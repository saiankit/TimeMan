//
//  CourseCardComponents.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/4/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

// If Single Course Type is Present - Centered Number
struct CenteredSingleCourseTypeView: View {
    var type: String
    var body: some View {
        HStack {
            Text(type)
        }
    }
}

// If Two Course Types are present - Numbers at the extreme ends
struct ExtremeDualCourseTypeView: View {
    var type1: String
    var type2: String
    var body: some View {
        HStack {
            Text(type1)
            Spacer()
            Text(type2)
        }
    }
}

// If all three Course Types are present - Equally Spaced
struct EquallySpacedCourseTypeView: View {
    var type1: String
    var type2: String
    var type3: String
    var body: some View {
        HStack {
            Text(type1)
            Spacer()
            Text(type2)
            Spacer()
            Text(type3)
        }
    }
}

struct CourseNumbers: View {
    var course: Course
    var body: some View {
        if course.lectureExists && (course.tutorialExists && course.practicalExists) {
            EquallySpacedCourseTypeView(
                type1: course.lectureNumber!,
                type2: course.tutorialNumber!,
                type3: course.practicalNumber!
            )
        } else if course.lectureExists && course.tutorialExists {
            ExtremeDualCourseTypeView(
                type1: course.lectureNumber!,
                type2: course.tutorialNumber!
            )
        } else if course.lectureExists && course.practicalExists {
            ExtremeDualCourseTypeView(
                type1: course.lectureNumber!,
                type2: course.practicalNumber!
            )
        } else if course.tutorialExists && course.practicalExists {
            ExtremeDualCourseTypeView(
                type1: course.tutorialNumber!,
                type2: course.practicalNumber!
            )
        } else if course.lectureExists {
            CenteredSingleCourseTypeView(type: course.lectureNumber!)
        } else if course.tutorialExists {
            CenteredSingleCourseTypeView(type: course.tutorialNumber!)
        } else if course.practicalExists {
            CenteredSingleCourseTypeView(type: course.practicalNumber!)
        }
    }
}
