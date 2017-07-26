//
//  LearningProgress.swift
//  MyLearning
//
//  Created by Rang, Winters on 23/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class LearningProgress: NSObject {
    
    //MARK: Properties
    var learning_id: String
    var id: String
    var date: String
    var lecture: String
    
    //MARK: Initalization
    init(learning_id: String, id: String, date: String, lecture: String) {
        self.learning_id = learning_id
        self.id = id
        self.date = date
        self.lecture = lecture
    }
    
}
