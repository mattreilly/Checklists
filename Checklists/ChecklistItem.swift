//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Matt Reilly on 1/9/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}

