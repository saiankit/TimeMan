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
    @FetchRequest(entity: Course.entity(), sortDescriptors: [NSSortDescriptor(key: "time", ascending: false)]) var courseItemsList: FetchedResults<Course>
    
    func shouldCourseBeIncluded(course: Course, index: Int) -> Bool{
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if(converted!.contains(weekDayName)){
            return true
        }
        return false
       }
    
    var body: some View{
        ScrollView(.vertical,showsIndicators: false){
            if #available(iOS 14.0, *) {
                LazyVStack(alignment: .leading){
                    ForEach(self.courseItemsList, id: \.self) {
                        if(shouldCourseBeIncluded(course: $0, index: self.calendarIndex))
                        {
                            CourseCard(course: $0)
                        }
                    }
                }
            }
        }
}
}
