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

func getFileSize(for file: URL) -> Int {
    if let attributes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
       let fileSize = attributes[FileAttributeKey.size] as? Int {
        print("fileSize = ", fileSize)
        return fileSize
    } else {
        return 0
    }
}

func removeLast7(input: String?) -> String? {
    var myString = input
    if myString?.count ?? 0 > 7 {
        myString?.removeLast(7)
        
    }
    return myString
    
    
}
