//
//  URLHelper.swift
//  TableView
//
//  Created by Гость on 15.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//

import Foundation
extension URL {
    func baseDir() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    func createPathWithBaseDir(path: String) -> URL {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let url = URL(fileURLWithPath: documentsPath + path)
        return url
    }
}
