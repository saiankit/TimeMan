//
//  Constants.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/22/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

var weekDaySymbols: [String] = ["Mon","Tue","Wed","Thu","Fri","Sat"]

var longWeekDaySymbols : [String] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

var mockCoursesList = [
    Course(
        courseTitle: "Digital Design", courseCode: "ECE"
        , courseID: "F215", instructorName: "Prof. Sanjay Vidhyadharan", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "P1", weekDayRepeat: ["Monday","Wednesday","Friday"], meetLink: "www.meet.google.com", tutorialExists: true, practicalExits: true, lectureExists: true),
    Course(
        courseTitle: "Control Systems", courseCode: "ECE"
        , courseID: "F242", instructorName: "Alivelu Manga", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "", weekDayRepeat: ["Tuesday"], meetLink: "www.meet.google.com", tutorialExists: true, practicalExits: false, lectureExists: true),
    Course(
        courseTitle: "Biology Laboratory", courseCode: "BIO"
        , courseID: "F110", instructorName: "Alivelu Manga", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "P10", weekDayRepeat: ["Monday"], meetLink: "www.meet.google.com", tutorialExists: false, practicalExits: true, lectureExists: false)
]
