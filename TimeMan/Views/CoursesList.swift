//
//  CoursesList.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/27/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI


struct CoursesList: View {
    @Binding var courses: [Course]
    @Binding var calendarIndex: Int

    func shouldCourseBeIncluded(course: Course, index: Int) -> Bool{
       let weekDayName = longWeekDaySymbols[index]
       let mapped = course.weekDayRepeat.map{ $0 == weekDayName }
       for mappedCourse in mapped {
           if(mappedCourse == true)
           {
               return true
           }
        }
       return false
       }
    var body: some View{
        ScrollView(.vertical,showsIndicators: false){
            if #available(iOS 14.0, *) {
                LazyVStack(alignment: .leading){
                    
                    ForEach(courses, id: \.id) {
                        if(shouldCourseBeIncluded(course: $0, index: self.calendarIndex))
                        {
                            CourseCard(course: $0)
                        }
                        
                    }
                }
            } else {
                VStack(alignment: .leading){
                    ForEach(courses, id: \.id) {
                      CourseCard(course: $0)
                    }
                }
            }
        }
}
}
