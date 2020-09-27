//
//  Constants.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/22/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

var weekDaySymbols: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]

var longWeekDaySymbols : [String] = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

var mockCoursesList = [
    Course(id: 1 ,courseTitle: "Digital Design", courseCode: "ECE", courseID: "F215", instructorName: "Prof. Sanjay Vidhaydharan", time: Date(), weekDayRepeat: ["Monday", "Wednesday", "Friday"], meetLink: "https://meet.google.com/mgz-vjqy-gei", lectureNumber: "L1", tutorialNumber: "T3", practicalNumber: "P9", isLecture: true, isTutorial: false, isPractical: false, tutorialExists: true, practicalExits: true, lectureExists: true),
    Course(id : 2, courseTitle: "Srimad Bhagavad Gita", courseCode: "HSS", courseID: "F334", instructorName: "Dr. Aruna Lolla", time: Date(), weekDayRepeat: ["Monday", "Wednesday", "Friday"], meetLink: "https://meet.google.com/mgz-vjqy-gei", lectureNumber: "L1", tutorialNumber: "", practicalNumber: "", isLecture: true, isTutorial: false, isPractical: false, tutorialExists: false, practicalExits: false, lectureExists: true),
    Course(id : 3, courseTitle: "Digital Design", courseCode: "ECE", courseID: "F215", instructorName: "Prof. Sanjay Vidhaydharan", time: Date(), weekDayRepeat: ["Monday"], meetLink: "https://meet.google.com/mgz-vjqy-gei", lectureNumber: "L1", tutorialNumber: "T3", practicalNumber: "P9", isLecture: false, isTutorial: false, isPractical: true, tutorialExists: true, practicalExits: true, lectureExists: true),
]
