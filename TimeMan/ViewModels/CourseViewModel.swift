//
//  CourseViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/23/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct WeekDayName: Hashable, Identifiable {
    var name: String
    var id: String { name }
}

struct ClassTypeRepeat {
    var name: String
    var weekDays: Set<WeekDayName>
}

class CourseViewModel: ObservableObject {
    let weekDays: [WeekDayName] = [
        WeekDayName(name: "Monday"),
        WeekDayName(name: "Tuesday"),
        WeekDayName(name: "Wednesday"),
        WeekDayName(name: "Thursday"),
        WeekDayName(name: "Friday"),
        WeekDayName(name: "Saturday")
    ]
    
    // MARK: - Course
    @Published var courseTitle: String = ""
    @Published var courseCode: String = ""
    @Published var courseID: String = ""
    @Published var colorNum: Int = 0
    
    func generateLink(meetCode: String) -> String {
        let linkPreccedence = "https://meet.google.com/"
        return linkPreccedence + meetCode
    }
    
    // MARK: - Lecture
    @Published var lectureInstructorName: String = ""
    @Published var lectureNumber: Int = 1
    @Published var lectureTime = Date()
    @Published var lectureMeetCode: String = ""
    @Published var lectureRepeatWeek = ClassTypeRepeat(name: "", weekDays: [])
    @Published var isLectureExisting: Bool = true
    @Published var isLectureNotificationsEnabled: Bool = false
    func generateLectureNumber( lectureNumber: Int) -> String {
        return "L\(lectureNumber)"
    }
    
    // MARK: - Tutorial
    @Published var tutorialInstructorName: String = ""
    @Published var tutorialNumber: Int = 1
    @Published var tutorialTime = Date()
    @Published var tutorialMeetCode: String = ""
    @Published var tutorialRepeatWeek = ClassTypeRepeat(name: "", weekDays: [])
    @Published var isTutorialExisting: Bool = false
    @Published var isTutorialNotificationsEnabled: Bool = false
    
    func generateTutorialNumber( tutorialNumber: Int) -> String {
        return "T" + String(tutorialNumber)
    }
    
    // MARK: - Practical
    @Published var practicalInstructorName: String = ""
    @Published var practicalNumber: Int = 1
    @Published var practicalTime = Date()
    @Published var practicalMeetCode: String = ""
    @Published var practicalRepeatWeek = ClassTypeRepeat(name: "", weekDays: [])
    @Published var isPracticalExisting: Bool = false
    @Published var isPracticalNotificationsEnabled: Bool = false
    func generatePracticalNumber( practicalNumber: Int) -> String {
        return "P" + String(practicalNumber)
    }
}
