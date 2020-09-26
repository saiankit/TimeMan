//
//  Course.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/25/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation
struct Course {
    // Course Information
    let id: Int
    let courseTitle: String
    let courseCode: String
    let courseID: String
    
    // Class Information
    let instructorName: String
    let time: Date
    let weekDayRepeat: [String]
    let meetLink: String
    
    let lectureNumber: String
    let tutorialNumber: String
    let practicalNumber: String
    
    let isLecture: Bool
    let isTutorial: Bool
    let isPractical: Bool
    
    let tutorialExists: Bool
    let practicalExits: Bool
    let lectureExists: Bool
}
