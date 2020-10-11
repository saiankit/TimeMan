//
//  UpcomingCourseCardViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/11/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

class UpcomingCourseCardViewModel {
    private var courseCardViewModel = CourseCardViewModel()

    func classTime(course: Course) -> String {
        return courseCardViewModel.classTime(course: course)
    }

    func getClassType(course: Course) -> String {
        return courseCardViewModel.getClassType(course: course)
    }

    func secondaryBackground(course: Course) -> Color {
        return courseCardViewModel.secondaryBackground(course: course)
    }

    func primaryBackground(course: Course) -> Color {
        return courseCardViewModel.primaryBackground(course: course)
    }
}
