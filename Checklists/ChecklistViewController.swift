//
//  ViewController.swift
//  Checklists
//
//  Created by Matt Reilly on 1/1/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var row0checked = false
    var row1checked = false
    var row2checked = false
    var row3checked = false
    var row4checked = false

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
            
            if indexPath.row % 5 == 0 {
                label.text = "Walk the dog"
            } else if indexPath.row % 5 == 1 {
                label.text = "Brush my teeth"
            } else if indexPath.row % 5 == 2 {
                label.text = "Learn iOS development"
            } else if indexPath.row % 5 == 3 {
                label.text = "Soccer practice"
            } else if indexPath.row % 5 == 4 {
                label.text = "Eat ice cream"
            }
            
            configureCheckmarkForCell(cell, indexPath: indexPath)
            
            return cell
    }
    
    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            var isChecked = false
            
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                if indexPath.row == 0 {
                    row0checked = !row0checked
                    isChecked = row0checked
                } else if indexPath.row == 1 {
                    row1checked = !row1checked
                    isChecked = row1checked
                } else if indexPath.row == 2 {
                    row2checked = !row2checked
                    isChecked = row2checked
                } else if indexPath.row == 3 {
                    row3checked = !row3checked
                    isChecked = row3checked
                } else if indexPath.row == 4 {
                    row4checked = !row4checked
                    isChecked = row4checked
                }
                
                if isChecked {
                    cell.accessoryType = .Checkmark
                } else {
                    cell.accessoryType = .None
                }
            }
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell,
        indexPath: NSIndexPath) {
            
            var isChecked = false
            
            if indexPath.row == 0 {
                isChecked = row0checked
            } else if indexPath.row == 1 {
                isChecked = row1checked
            } else if indexPath.row == 2 {
                isChecked = row2checked
            } else if indexPath.row == 3 {
                isChecked = row3checked
            } else if indexPath.row == 4 {
                isChecked = row4checked
            }
            
            if isChecked {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
    }
}

















