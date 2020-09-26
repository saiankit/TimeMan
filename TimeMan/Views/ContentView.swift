//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI


struct ContentView: View{
    @State var calendarIndex = (Calendar.current.component(.weekday, from: Date()) - 2)
    @State var isPresented = false
    @State var courseList = mockCoursesList
    var body: some View {
        NavigationView{
            ZStack {
                Color("Background")
                VStack {
                    Header()
                        .padding(.top, 60.0)
                        .padding(.bottom,20)
                    
                    WeekScroll(index: $calendarIndex)

                    Spacer()
                    VStack(alignment: .leading){
                        HStack {
                            Text(calendarIndex == (Calendar.current.component(.weekday, from: Date()) - 2) ? "Today's Classes" : longWeekDaySymbols[calendarIndex] + "'s Classes")
                                .font(.system(size: 24, weight: .bold, design: .rounded)).padding(.bottom,15)
                            Spacer()
                            Button(action: {
                                self.isPresented.toggle()
                            }) {
                                Image(systemName: "plus.circle")
                                .font(.system(size: 24, design: .rounded))
                                .foregroundColor(Color("Primary"))
                                .padding(.bottom,15)
                            }
                        }
                        CoursesList(courses: $courseList, calendarIndex: $calendarIndex).sheet(isPresented: $isPresented){
                            CourseInput(isPresented: $isPresented, coursesList: $courseList)
                        }
                    }
                    .padding(30)
                    .background(Color("CoursesListBackground"))
                    .cornerRadius(50)
                    .edgesIgnoringSafeArea(.bottom)
                    
                }
            }.edgesIgnoringSafeArea([.top,.bottom])
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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
