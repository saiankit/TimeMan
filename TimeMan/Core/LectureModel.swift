//
//  LectureModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/24/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation

struct Lecture {
    let courseTitle: String
    let courseCode: String
    let courseID: String
    let instructorName: String
    let number: String
    let time: Date
    let weekDayRepeat: Set<String>
    let meetLink: String
    let isTutorial: Bool
    let tutorialNumber: String
    let isPractical: Bool
    let practicalNumber: String
}
