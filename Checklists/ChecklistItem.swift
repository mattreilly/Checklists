//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Matt Reilly on 1/9/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
    
    // conform to NSCoding protocol
    
    // encode object to file
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
    
    // decode file back into object
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as String
        checked = aDecoder.decodeBoolForKey("Checked")
        
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    // end of NSCoding protocol
}

