//
//  TutorialModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/24/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation

struct Tutorial {
    let courseTitle: String
    let courseCode: String
    let courseID: String
    let instructorName: String
    let number: String
    let time: Date
    let weekDayRepeat: Set<String>
    let meetLink: String
    let isTutorial: Bool
    let isPractical: Bool
}
