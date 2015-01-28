//
//  AllListsViewController.swift
//  Checklists
//
//  Created by Matt Reilly on 1/15/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    var lists: [Checklist]
    
    required init(coder aDecoder: NSCoder) {
        
        lists = [Checklist]()
        
        super.init(coder: aDecoder)
        
        var list = Checklist(name: "Birthdays")
        lists.append(list)
        
        list = Checklist(name: "Groceries")
        lists.append(list)
        
        list = Checklist(name: "Cool Apps")
        lists.append(list)
        
        list = Checklist(name: "To Do")
        lists.append(list)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
   
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        
            return lists.count
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cellIdentifier = "Cell"
            
            var cell: UITableViewCell! =
                tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
                    as? UITableViewCell
            
            if cell == nil {
                cell = UITableViewCell(style: .Default,
                    reuseIdentifier: cellIdentifier)
            }
            
            let checklist = lists[indexPath.row]
            cell.textLabel!.text = checklist.name
            cell.accessoryType = .DetailDisclosureButton
            
            return cell
    }
    
    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            let checklist = lists[indexPath.row]
            performSegueWithIdentifier("ShowChecklist", sender: checklist)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject?) {
            
            if segue.identifier == "ShowChecklist" {
                let controller = segue.destinationViewController
                    as ChecklistViewController
                
                controller.checklist = sender as Checklist
            }
    }
}