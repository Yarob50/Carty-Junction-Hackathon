//
//  TableViewCell.swift
//  CARTY
//
//  Created by Ammar AlTahhan on 28/09/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit
import BEMCheckBox

class TableViewCell: UITableViewCell {

    @IBOutlet weak var checkBox: BEMCheckBox!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageV: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkBox.boxType = .circle
        checkBox.onAnimationType = .fill
        checkBox.tintColor = .gray
        checkBox.offAnimationType = .fill
        checkBox.isEnabled = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        checkBox.setOn(selected, animated: true)
    }

}
