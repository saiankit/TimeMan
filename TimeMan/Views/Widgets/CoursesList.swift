//
//  CoursesList.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/27/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct CoursesList: View {
    @Binding var calendarIndex: Int
    @FetchRequest(
        entity: Course.entity(),
        sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]
    ) var coursesList: FetchedResults<Course>
    var viewModel = CourseListViewModel()
    
    var body: some View {
        if #available(iOS 14.0, *) {
            if !viewModel.areClassesAvailableToday(coursesList: coursesList, index: calendarIndex) {
                NoClassesToday()
            } else {
                LazyVStack(alignment: .leading) {
                    ForEach(self.coursesList, id: \.self) {
                        if viewModel.shouldCourseBeIncluded(course: $0, index: self.calendarIndex) {
                            CourseCard(course: $0)
                        }
                    }
                }
            }
        }
    }
}

struct NoClassesToday: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("No Classes Today")
                    .font(.system(size: 22, weight: .bold, design: .rounded ))
                    .padding(.bottom, 5)
                    .padding(.leading, 20)
                Spacer()
            }
            Spacer()
        }
    }
}
