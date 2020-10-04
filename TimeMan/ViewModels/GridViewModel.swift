//
//  GridViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/4/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI
class GridViewModel {
    private func getClassType(course: Course) -> String {
        if(course.isLecture) {
            return course.lectureNumber ?? ""
        }
        else if(course.isTutorial) {
            return course.tutorialNumber ?? ""
        }
        else if(course.isPractical) {
            return course.practicalNumber ?? ""
        }
        return ""
    }
    
    
    private func shouldCourseBeIncluded(course: Course, index: Int) -> Bool{
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if(converted!.contains(weekDayName)){
            return true
        }
        return false
    }
    
    func getCourseForGrid(list: FetchedResults<Course>, gridTime : Int, weekDay : Int) ->  [String] {
        let calendar = Calendar.current
        var gridCourse : Course = Course()
        let gridLowerLimit =  gridTime * 60
        let gridUpperLimit = gridLowerLimit + 60
        var count = 0
        for courseItem in list {
            if(self.shouldCourseBeIncluded(course: courseItem, index: weekDay)) {
                let courseTime = courseItem.time
                let courseHour = calendar.component(.hour, from: courseTime!)
                let courseMinute = calendar.component(.minute, from: courseTime!)
                let classTime = courseHour * 60 + courseMinute
                if(classTime >= gridLowerLimit) {
                    if(classTime < gridUpperLimit) {
                        gridCourse = courseItem
                        count = count + 1
                    }
                }
            }
        }
        if(count == 0) {
            return ["Error"]
        }
        return [ gridCourse.courseCode! , gridCourse.courseID! , String(gridCourse.colorNum), self.getClassType(course: gridCourse) ]
    }
}
