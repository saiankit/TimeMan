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
    @FetchRequest(entity: Course.entity(), sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]) var courseItemsList: FetchedResults<Course>
    var courseViewModel = CourseListViewModel()
    var body: some View{
        if #available(iOS 14.0, *) {
            LazyVStack(alignment: .leading){
                ForEach(self.courseItemsList, id: \.self) {
                    if courseViewModel.shouldCourseBeIncluded(course: $0, index: self.calendarIndex) {
                        CourseCard(course: $0)
                    }
                }
            }
            if courseViewModel.areClassesAvailableToday(coursesList: courseItemsList, index: calendarIndex) == false {
                    Text("No Classes Today")
                        .font(
                            .system(
                                size: 22,
                                weight: .bold,
                                design: .rounded
                            )
                        )
                        .padding(.bottom, 5)
                        .padding(.leading,20)
            }
        }
    }
}
