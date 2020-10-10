//
//  UpcomingClassViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/2/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

class UpcomingClassViewModel {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    private func getClassType(course: Course) -> String {
        if course.isLecture {
            return course.lectureNumber!
        } else if course.isTutorial {
            return course.tutorialNumber!
        } else if course.isPractical {
            return course.practicalNumber!
        }
        return ""
    }
    
    private func shouldCourseBeIncluded(course: Course, index: Int) -> Bool{
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if converted!.contains(weekDayName) {
            return true
        }
        return false
    }
    
    func getUpcomingClass(list: FetchedResults<Course>) -> Course{
        let calendar = Calendar.current
        let listWork = list
        var upcomingCourse : Course = Course()
        
        let errorCourse = Course(context: self.managedObjectContext)
        errorCourse.courseTitle = "No upcoming Classes"
        errorCourse.courseID = "E"
        errorCourse.courseCode = "E"
        errorCourse.instructorName = "E"
        errorCourse.weekDayRepeat = ["Monday"]
        errorCourse.meetLink = "E"
        errorCourse.lectureNumber = "E"
        errorCourse.tutorialNumber = "E"
        errorCourse.practicalNumber = "E"
        errorCourse.isLecture = true
        errorCourse.isTutorial = false
        errorCourse.isPractical = false
        errorCourse.lectureExists = true
        errorCourse.tutorialExists = true
        errorCourse.practicalExists = true
        errorCourse.time = Date()
        errorCourse.colorNum = 0
        
        let currentTimeHour = calendar.component(.hour, from: Date())
        let currentTimeMinute = calendar.component(.minute, from: Date())
        let currentTime = currentTimeHour * 60 + currentTimeMinute
        var diff = 1440
        var count = 0
        let currentDayIndex = (Calendar.current.component(.weekday, from: Date())) - 1
        for courseClass in listWork {
            if shouldCourseBeIncluded(course: courseClass, index: currentDayIndex) {
                let courseTime = courseClass.time
                let courseHour = Calendar.current.component(.hour, from: courseTime!)
                let courseMinute = Calendar.current.component(.minute, from: courseTime!)
                let courTime = courseHour * 60 + courseMinute
                let difference = courTime - currentTime
                if difference > 0 {
                    if difference < diff {
                        diff = courTime - currentTime
                        upcomingCourse = courseClass
                        count = count + 1
                    }
                }
            }
        }
        if count == 0 {
            return errorCourse
        }
        return upcomingCourse
    }
}
