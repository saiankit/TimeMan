//
//  CourseListViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/4/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

class CourseListViewModel {
    func shouldCourseBeIncluded(course: Course, index: Int) -> Bool {
        
        // To find if current course is scheduled on the given day of the week
        // We check if the given day of the week is present in the weekDayRepeat of current Course
        // If the course is scheduled on that day of week "true" is returned
        // Else "false" is returned
        
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if converted!.contains(weekDayName) {
            return true
        }
        return false
    }
    
    func areClassesAvailableToday(coursesList: FetchedResults<Course>, index: Int) -> Bool {
        
        // To find if any classes are scheduled on that day
        // We loop across all the courses and
        // check if the given day of the week is present in the weekDayRepeat of the iterable Course

        var areClassesAvailable = false
        let weekDayName = longWeekDaySymbols[index]
        for course in coursesList {
            let courseWeekDayRepeat = course.weekDayRepeat
            if courseWeekDayRepeat!.contains(weekDayName) {
                areClassesAvailable = true
            }
        }
        if !areClassesAvailable {
            return false
        }
            return true
    }
}
