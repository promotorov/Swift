//
//  Person.swift
//  TableView
//
//  Created by Гость on 13.11.2017.
//  Copyright © 2017 Гость. All rights reserved.
//

import Foundation
class Person: Codable {
    private(set) static var persons: [Person] = []
    private(set) var firstName: String
    private(set) var secondName: String
    private(set) var age: Int
    
    static var url: URL = {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let url = URL(fileURLWithPath: documentsPath + "/my.json2")
        return url
    }()
    
    init(firstName: String, secondName: String, age: Int) {
        self.firstName = firstName
        self.secondName = secondName
        self.age = age
    }
    
    static func addNewPerson(person: Person){
        persons.append(person)
    }
    
    static func serializePersons() {
        try! JSONEncoder().encode(persons).write(to: url)
    }
    
    static func desirializePersons() {
        let data = try! Data(contentsOf: url)
        persons = try! JSONDecoder().decode([Person].self, from: data)
    }
}
