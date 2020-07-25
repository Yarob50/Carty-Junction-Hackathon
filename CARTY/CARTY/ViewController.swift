//
//  ViewController.swift
//  CARTY
//
//  Created by Ammar AlTahhan on 28/09/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: FLAnimatedImageView!
    @IBOutlet weak var backView: UIView!
    
    let timer = Timer()
    private var isLoading = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadImage()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.finishLoading()
        }
        backView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        backView.layer.cornerRadius = backView.frame.size.width/2
    }
    
    func loadImage() {
        let path1: String = Bundle.main.path(forResource: "loading-2", ofType: "gif")!
        let url = URL(fileURLWithPath: path1)
        let gifData = try? Data(contentsOf: url)
        let imageData1 = FLAnimatedImage(animatedGIFData: gifData)
        imageView.animatedImage = imageData1
        imageView.loopCompletionBlock = { loopCount in
            if !self.isLoading {
                self.imageView.stopAnimating()
                self.animateOut()
            }
        }
    }
    
    func finishLoading() {
        isLoading = false
    }
    
    private func animateOut() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.imageView.transform = CGAffineTransform(translationX: 320, y: 0)
        }) { (_) in
            
        }
        self.clearBack()
    }

    private func clearBack() {
        UIView.animate(withDuration: 0.6, delay: 0.8, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.backView.transform = .identity
        }) { (_) in
            self.performSegue(withIdentifier: "seg", sender: nil)
        }
    }

}









