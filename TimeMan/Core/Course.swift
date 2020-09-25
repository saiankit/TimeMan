//
//  Course.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/25/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation
struct Course {
    let courseTitle: String
    let courseCode: String
    let courseID: String
    let instructorName: String
    let time: Date
    let lectureNumber: String
    let tutorialNumber: String
    let practicalNumber: String
    let weekDayRepeat: Set<String>
    let meetLink: String
    let tutorialExists: Bool
    let practicalExits: Bool
    let lectureExists: Bool
    let isLecture: Bool
    let isTutorial: Bool
    let isPractical: Bool
}
