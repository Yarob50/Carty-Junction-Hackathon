//
//  ViewController2ViewController.swift
//  CARTY
//
//  Created by Ammar AlTahhan on 28/09/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonView: GradientView!
    
    let list = ["Fruits", "Dairy", "Cans", "Bakery"]
    let images = [#imageLiteral(resourceName: "item2"), #imageLiteral(resourceName: "item3"), #imageLiteral(resourceName: "milk"), #imageLiteral(resourceName: "bread")]
    let buttonViewTransform = CGAffineTransform(translationX: 0, y: 100)
    var selected: [String] = [] {
        didSet {
            animateButton(isIn: selected.count != 0 )
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.transform = CGAffineTransform(translationX: 0, y: 40)
        imageView.alpha = 0
        tableView.alpha = 0
        buttonView.transform = buttonViewTransform
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showIcon()
    }
    
    private func showIcon() {
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.imageView.transform = .identity
        }) { (_) in

        }
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.imageView.alpha = 1
            self.imageView.layoutIfNeeded()
        }) { (_) in
            self.animateItemsIn()
        }
    }
    
    private func animateItemsIn() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.imageView.transform = CGAffineTransform(translationX: 0, y: -(self.view.frame.size.height)).concatenating(CGAffineTransform(scaleX: 0.4, y: 0.4))
        }) { (_) in
            
        }
        UIView.animate(withDuration: 1.2, delay: 0.3, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.tableView.alpha = 1
            self.tableView.layoutIfNeeded()
        }) { (_) in
            
        }
    }
    
    private func animateButton(isIn: Bool) {
        if isIn {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.buttonView.transform = .identity
            }) { (_) in
                
            }
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.buttonView.transform = self.buttonViewTransform
            }) { (_) in
                
            }
        }
    }

}

extension ViewController2: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.name.text = list[indexPath.row]
        cell.imageV.image = images[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected.append(list[indexPath.row])
        tableView.cellForRow(at: indexPath)?.animateSelection()
        print("SELECT")
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selected.remove(at: selected.firstIndex(of: list[indexPath.row])!)
        tableView.cellForRow(at: indexPath)?.animateSelection()
        print("DESELECT")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}


extension UITableViewCell {
    func animateSelection(color: UIColor = UIColor.gray.withAlphaComponent(0.3)) {
        let currentColor = self.backgroundColor
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.backgroundColor = color
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0.25, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.backgroundColor = currentColor
            }, completion: nil)
        }
    }
}
