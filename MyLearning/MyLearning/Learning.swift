//
//  Learning.swift
//  MyLearning
//  Hello World
//  Created by Rang, Winters on 23/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class Learning: NSObject {
    
    //MARK: Properties
    var id: String
    var type: String
    var name: String
    var number: Int
    var unit: String
    var status: String
    
    //MARK: Initalization
    
    init(id: String, type: String, name: String, number: Int, unit: String, status: String) {
        self.id = id
        self.type = type
        self.name = name
        self.number = number
        self.unit = unit
        self.status = status
    }

}
