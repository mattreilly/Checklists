//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Matt Reilly on 1/13/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: ItemDetailViewController)
    
    func itemDetailViewController(controller: ItemDetailViewController,
        didFinishAddingItem item: ChecklistItem)
    
    func itemDetailViewController(controller: ItemDetailViewController,
        didFinishEditingItem item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    var itemToEdit: ChecklistItem?
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let item = itemToEdit {
            item.text = textField.text
            delegate?.itemDetailViewController(self, didFinishEditingItem: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAddingItem: item)
        }
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
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.enabled = true
        }
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
