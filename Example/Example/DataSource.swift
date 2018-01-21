//
//  DataSource.swift
//  Example
//
//  Created by Arror on 2018/1/21.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation
import ElementSelection

struct Person: Identifiable, Hashable {
    
    let id: String
    let name: String
    
    var identifier: String {
        return id
    }
}

final class PersonController: ElementContainer {
    
    let elements: [Person]
    
    init() {
        self.elements = [
            Person(id: "0", name: "Jackson"),
            Person(id: "1", name: "Aiden"),
            Person(id: "2", name: "Liam"),
            Person(id: "3", name: "Lucas"),
            Person(id: "4", name: "Noah"),
            Person(id: "5", name: "Mason"),
            Person(id: "6", name: "Ethan"),
            Person(id: "7", name: "Caden"),
            Person(id: "8", name: "Logan"),
            Person(id: "9", name: "Jacob")
        ]
    }
}
