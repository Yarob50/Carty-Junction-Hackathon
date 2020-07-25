//
//  ViewController4.swift
//  CARTY
//
//  Created by Ammar AlTahhan on 28/09/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let strings = ["label1", "label1", "label1"]
    lazy var headerView = tableView.tableHeaderView as! CurrentNextItemsView

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset = UIEdgeInsets(top: 340, left: 0, bottom: 0, right: 0)
        setupHeader()
    }
    
    func setupHeader() {
        headerView.firstLabel.text = strings.first
        headerView.secondLabel.text = strings[1]
    }

}


extension ViewController4: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        cell.name.text = strings[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 60
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        headerView.firstLabel.text = "f"
//        return headerView
//    }
    
}
