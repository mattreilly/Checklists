//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Matt Reilly on 1/13/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        println("Contents of the text field: \(textField.text)")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    // make sure a user can't select the 'Add Item' row without 
    // being prompted to edit it
    override func tableView(tableView: UITableView,
        willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
            return nil
    }
    
    // fix the 'ambiguous row height' warning
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 44
    }
    
    func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool {
            
            let oldText: NSString = textField.text
            let newText: NSString =
                oldText.stringByReplacingCharactersInRange(range,
                    withString: string)
            
            doneBarButton.enabled = newText.length > 0
            
            return true
    }
}
