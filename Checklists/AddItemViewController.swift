//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Matt Reilly on 1/13/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // make sure a user can't select the 'Add Item' row without 
    // being prompted to edit it
    override func tableView(tableView: UITableView,
        willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
            return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 44
    }
}
