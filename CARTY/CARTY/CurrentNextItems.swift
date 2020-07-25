//
//  CurrentNextItems.swift
//  CARTY
//
//  Created by Ammar AlTahhan on 28/09/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit

class CurrentNextItemsView: UIView {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func changeNextItem(_ nextItem: String) {
        UIView.animate(withDuration: 1) {
            self.firstLabel.transform = CGAffineTransform(translationX: 0, y: -80)
        }
        
        firstLabel.text = secondLabel.text
        secondLabel.text = nextItem
        
        UIView.animate(withDuration: 1) {
            self.secondLabel.transform = CGAffineTransform(translationX: 0, y: -80)
            self.secondLabel.textColor = .white
        }
    }

}
