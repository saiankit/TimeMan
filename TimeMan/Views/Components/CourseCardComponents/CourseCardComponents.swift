//
//  CourseCardComponents.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/4/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct Single: View {
    var input: String
    var body: some View {
        HStack {
            Text(input)
        }
    }
}

struct Double: View {
    var ip1: String
    var ip2: String
    var body: some View {
        HStack {
            Text(ip1)
            Spacer()
            Text(ip2)
        }
    }
}

struct Triple: View {
    var ip1: String
    var ip2: String
    var ip3: String
    var body: some View {
        HStack {
            Text(ip1)
            Spacer()
            Text(ip2)
            Spacer()
            Text(ip3)
        }
    }
}

struct CourseNumbers: View {
    var course: Course
    var body: some View {
        if course.lectureExists && (course.tutorialExists && course.practicalExists) {
            Triple(
                ip1: course.lectureNumber ?? "L1",
                ip2: course.tutorialNumber ?? "T1",
                ip3: course.practicalNumber ?? "P1"
            )
        } else if course.lectureExists && course.tutorialExists {
            Double(
                ip1: course.lectureNumber ?? "L1",
                ip2: course.tutorialNumber ?? "T1"
            )
        } else if course.lectureExists && course.practicalExists {
            Double(
                ip1: course.lectureNumber ?? "L1",
                ip2: course.practicalNumber ?? "P1"
            )
        } else if course.tutorialExists && course.practicalExists {
            Double(
                ip1: course.tutorialNumber ?? "T1",
                ip2: course.practicalNumber ?? "P1"
            )
        } else if course.lectureExists {
            Single(input: course.lectureNumber ?? "L1")
        } else if course.tutorialExists {
            Single(input: course.tutorialNumber ?? "T1")
        } else if course.practicalExists {
            Single(input: course.practicalNumber ?? "P1")
        }
    }
}
