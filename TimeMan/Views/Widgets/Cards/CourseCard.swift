//
//  CourseCard.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct CourseCard: View {
    var course: Course
    var viewModel = CourseCardViewModel()
    // CardView
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                // Course Information
                VStack(alignment: .leading) {
                    // Course Title
                    Text(course.courseTitle!)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.bottom, 5)
                    // Course Code + ID
                    Text(course.courseCode! + "  " + course.courseID!)
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 10)
                    // Instructor Name
                    Text(course.instructorName!)
                        .font(.system(size: 16, design: .rounded))
                }
                Spacer()
                // Class Time and Meet Link
                VStack {
                    // Class Time
                    Text(viewModel.classTime(course: course))
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 20)
                    if #available(iOS 14.0, *) {
                        // Meet Link Button
                        Link(destination: URL(string: course.meetLink!)!) {
                            HStack {
                                Text(viewModel.getClassType(course: course))
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.white)
                                Image(systemName: "video.fill")
                                    .foregroundColor(.white)
                            }
                            .padding(8)
                            .background(viewModel.secondaryBackground(course: course))
                            .cornerRadius(15)
                        }
                    }
                }
            }
            Rectangle()
                .fill(Color.white)
                .frame(height: 2)
                .padding(.vertical)
            // All available Course Numbers
            CourseNumbers(course: course)
        }
        .padding(20)
        .background(viewModel.primaryBackground(course: course))
        .foregroundColor(Color.black)
        .cornerRadius(20)
        .padding(.bottom)
        .contextMenu {
            Button {
                viewModel.deleteItem(course: course)
            } label: {
                Text("Delete")
            }
        }
    }
}
