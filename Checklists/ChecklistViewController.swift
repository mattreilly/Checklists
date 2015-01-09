//
//  ViewController.swift
//  Checklists
//
//  Created by Matt Reilly on 1/1/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return 5
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
                tableView.dequeueReusableCellWithIdentifier("ChecklistItem")
                          as UITableViewCell
            
            let label = cell.viewWithTag(1000) as UILabel
            
            if indexPath.row == 0 {
                label.text = "Walk the dog"
            } else if indexPath.row == 1 {
                label.text = "Brush my teeth"
            } else if indexPath.row == 2 {
                label.text = "Learn iOS development"
            } else if indexPath.row == 3 {
                label.text = "Soccer practice"
            } else if indexPath.row == 4 {
                label.text = "Eat ice cream"
            }


            
            return cell
    }

}

