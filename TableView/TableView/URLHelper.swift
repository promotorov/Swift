//
//  URLHelper.swift
//  TableView
//
//  Created by Гость on 15.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//

import Foundation
extension URL {
    
    static func baseDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    static func createPathWithBaseDir(path: String) -> URL {
        let documentsPath = baseDir()
        let url = URL(fileURLWithPath: documentsPath + path)
        return url
    }
}
