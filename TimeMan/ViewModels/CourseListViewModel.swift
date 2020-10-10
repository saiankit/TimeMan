//
//  CourseListViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/4/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

class CourseListViewModel {
    func shouldCourseBeIncluded(course: Course, index: Int) -> Bool{
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if converted!.contains(weekDayName) {
            return true
        }
        return false
    }
    
    func areClassesAvailableToday(coursesList : FetchedResults<Course>, index : Int) -> Bool {
        var count = 0
        let weekDayName = longWeekDaySymbols[index]
        for course in coursesList {
            let converted = course.weekDayRepeat
            if(converted!.contains(weekDayName)){
                count = count + 1
            }
        }
        if count == 0 {
            return false
        }
        return true
    }
}
