//
//  Helper.swift
//  MyRecorder
//
//  Created by Iurie Guzun on 2022-01-30.
//

import Foundation

func getCreationDate(for file: URL) -> Date {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
       let creationDate = attributes[FileAttributeKey.creationDate] as? Date {
        return creationDate
    } else {
        return Date()
    }
}
func removeLast4(input: String?) -> String? {
    var myString = input
    if myString?.count ?? 0 > 4 {
        myString?.removeLast(4)
        
    }
    return myString
    
    
}
