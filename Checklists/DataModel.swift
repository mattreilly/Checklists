//
//  DataModel.swift
//  Checklists
//
//  Created by Matt Reilly on 2/18/15.
//  Copyright (c) 2015 Fountain and Fairchild LLC. All rights reserved.
//

import Foundation

class DataModel {
    var lists = [Checklist]()
    
    init() {
        loadChecklists()
    }
    
    // save and load lists
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true) as [String]
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent(
            "Checklists.plist")
    }
    
    func saveChecklists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        
        archiver.encodeObject(lists, forKey: "Checklists")
        archiver.finishEncoding()
        
        data.writeToFile(dataFilePath(), atomically: true)
    }
    
    func loadChecklists() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                lists = unarchiver.decodeObjectForKey("Checklists")
                    as [Checklist]
                unarchiver.finishDecoding()
            }
        }
    }

}