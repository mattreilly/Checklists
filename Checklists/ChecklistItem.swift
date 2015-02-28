//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Matt Reilly on 1/9/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import Foundation
import UIKit

class ChecklistItem: NSObject, NSCoding {
    var text = ""
    var checked = false
    
    var dueDate = NSDate()
    var shouldRemind = false
    var itemID: Int
    
    func toggleChecked() {
        checked = !checked
    }
    
    // conform to NSCoding protocol
    
    // encode object to file
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
        
        aCoder.encodeObject(dueDate, forKey: "DueDate")
        aCoder.encodeBool(shouldRemind, forKey: "ShouldRemind")
        aCoder.encodeInteger(itemID, forKey: "ItemID")
    }
    
    // decode file back into object
    required init(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as String
        checked = aDecoder.decodeBoolForKey("Checked")
        
        dueDate = aDecoder.decodeObjectForKey("DueDate") as NSDate
        shouldRemind = aDecoder.decodeBoolForKey("ShouldRemind")
        itemID = aDecoder.decodeIntegerForKey("ItemID")
        
        super.init()
    }
    
    override init() {
        itemID = DataModel.nextChecklistItemID()
        super.init()
    }
    
    convenience init(text: String, checked: Bool) {
        self.init(text: text, checked: checked)
    }
    
    // end of NSCoding protocol
    
    
    func scheduleNotification() {
        let existingNotification = notificationForThisItem()
        if let notification = existingNotification {
            UIApplication.sharedApplication().cancelLocalNotification(
            notification)
        }
        
        if shouldRemind && dueDate.compare(NSDate()) !=
            NSComparisonResult.OrderedAscending {
                
                let localNotification = UILocalNotification()
                
                localNotification.fireDate = dueDate
                localNotification.timeZone = NSTimeZone.defaultTimeZone()
                localNotification.alertBody = text
                localNotification.soundName =
                    UILocalNotificationDefaultSoundName
                localNotification.userInfo = ["ItemID": itemID]
                
                UIApplication.sharedApplication().scheduleLocalNotification(
                    localNotification)
        }
    }
    
    func notificationForThisItem() -> UILocalNotification? {
        let allNotifications =
            UIApplication.sharedApplication().scheduledLocalNotifications
                as [UILocalNotification]
        
        for notification in allNotifications {
            if let number = notification.userInfo?["ItemID"] as? NSNumber {
                if number.integerValue == itemID {
                    return notification
                }
            }
        }
            
        return nil
    }
    
    deinit {
        let existingNotification = notificationForThisItem()
        
            if let notification = existingNotification {
                UIApplication.sharedApplication().cancelLocalNotification(
                    notification)
            }
    }
}

