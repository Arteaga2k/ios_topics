//
//  SimpleTableViewController.swift
//  SimpleTableViewController
//
//  Created by Michael Mellinger on 3/8/16.
//  Copyright © 2016 h4labs. All rights reserved.
//

import UIKit

class  SimpleTableViewController: UITableViewController {
    
    let rowData = ["one", "two", "three"]
    let CellIdentifier = "Cell"
    
    override func viewDidLoad() {

        self.tableView.rowHeight = 80
        
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier)

    }
    
}

// Data source delegate

extension SimpleTableViewController {

    // We can skip overriding this function and it will default to 1
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rowData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath) as! CustomTableViewCell
        
        // Configure the cell...
        cell.label1?.text = rowData[(indexPath as NSIndexPath).row]
        cell.label2?.text = "\((indexPath as NSIndexPath).row + 1)"
        let imageName:String = "fr_icon"
        
        if let image = UIImage(named: imageName) {
            cell.imageView1.image = image
        }
        return cell

    }

    //: Optional Header title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header"
    }

}
