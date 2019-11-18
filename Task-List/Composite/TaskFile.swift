//
//  TaskFile.swift
//  Task-List
//
//  Created by admin on 14.11.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


protocol File {
    var name: String {get set}
    
    func showContent() -> Any
    
    func addArrayFile(array: File)
    
    func countContent() -> Int
    
}

class Task: File {

    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        return name
    }
    
    func addArrayFile(array: File) {
        print("нельзя добавить")
    }
    
    func countContent() -> Int {
        return 1
    }
}

class Folder: File {
    var name: String
    
    private var contentArray = [File]()
    
    init(name: String) {
        self.name = name
    }
    
    func showContent() -> Any {
        return contentArray
    }
    
    func addArrayFile(array: File) {
        contentArray.append(array)
    }
    
    func countContent() -> Int {
        return contentArray.count
    }
}


