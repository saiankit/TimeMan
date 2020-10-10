//
//  UpcomingCourseCard.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct UpcomingCourseCard: View {
    var course: Course
    var date: Int = (Calendar.current.component(.minute, from: Date()))
    var colorCodes = ColorCodes()
    var dateTimeUtilities = DateTimeUtilities()
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(course.courseTitle!)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.bottom, 5)
                    Text(course.courseCode! + "  " + course.courseID!)
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 10)
                    HStack {
                        Text(course.instructorName!)
                            .font(.system(size: 16, design: .rounded))
                    }
                }
                Spacer()
                VStack {
                    Text(dateTimeUtilities.getClassTime(time: course.time ?? Date()))
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 20)
                    if #available(iOS 14.0, *) {
                        Link(destination: URL(string: course.meetLink!)!) {
                            HStack {
                                ClassType(course: course)
                                    .foregroundColor(.white)
                                Image(systemName: "video.fill")
                                    .foregroundColor(.white)
                            }
                            .padding(8)
                            .background(colorCodes.colorNumbersLight[Int(course.colorNum)])
                            .cornerRadius(15)
                        }
                    }
                }
            }
        }
        .padding(20)
        .background(colorCodes.colorNumbers[Int(course.colorNum)])
        .foregroundColor(Color.black)
        .cornerRadius(20).padding(.bottom)
    }
}
