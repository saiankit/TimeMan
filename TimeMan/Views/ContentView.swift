//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI
import UserNotifications
struct ContentView: View{
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: Course.entity(), sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]) var listForUpcoming: FetchedResults<Course>
    
    private func getClassType(course: Course) -> String {
        if(course.isLecture)
        {
            return course.lectureNumber ?? ""
        }
        else if(course.isTutorial)
        {
            return course.tutorialNumber ?? ""
        }
        else if(course.isPractical)
        {
            return course.practicalNumber ?? ""
        }
        return ""
    }
    
    private func shouldCourseBeIncluded(course: Course, index: Int) -> Bool{
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if(converted!.contains(weekDayName)){
            return true
        }
        return false
    }
    
    private func getUpcomingClass(list: FetchedResults<Course>) -> String{
        let listWork = list
        var upcomingCourse : Course = Course()
        let currentTimeHour = Calendar.current.component(.hour, from: Date())
        let currentTimeMinute = Calendar.current.component(.minute, from: Date())
        let currentTime = currentTimeHour * 60 + currentTimeMinute
        var diff = 1440
        var count = 0
        for courseClass in listWork {
            if(shouldCourseBeIncluded(course: courseClass, index: (Calendar.current.component(.weekday, from: Date()))
            )){
                let courseTime = courseClass.time
                let courseHour = Calendar.current.component(.hour, from: courseTime!)
                let courseMinute = Calendar.current.component(.minute, from: courseTime!)
                let courTime = courseHour * 60 + courseMinute
                let difference = courTime - currentTime
                if(difference > 0)
                {
                    if(difference < diff)
                    {
                        diff = courTime - currentTime
                        upcomingCourse = courseClass
                        count+=1
                    }
                }
            }
        }
        if(count==0)
        {
            return "No Upcoming Classes"
        }
        return upcomingCourse.courseTitle!
    }

    @State var calendarIndex = ((Calendar.current.component(.weekday, from: Date())) - 1)
    @State var isPresented = false
    var body: some View {
        NavigationView{
            if #available(iOS 14.0, *) {
                ScrollView(showsIndicators: false){
                ZStack {
                    Color("Background")
                    VStack {
                        WeekScroll(index: $calendarIndex)
                        VStack{
                            Text("Upcoming Class")
                                .font(.system(size: 20, weight: .bold, design: .rounded)).padding(.bottom,15)
                            Text(getUpcomingClass(list: listForUpcoming))
                        }
                        .padding(20)
                        .background(Color("CoursesListBackground"))
                        .cornerRadius(20)
                    
                        VStack(alignment: .leading){
                            HStack {
                                Text(calendarIndex == (Calendar.current.component(.weekday, from: Date()) - 1) ? "Today's Classes" : longWeekDaySymbols[calendarIndex] + "'s Classes")
                                    .font(.system(size: 20, weight: .bold, design: .rounded)).padding(.bottom,15)
                                Spacer()
                              
                            }

                            CoursesList(calendarIndex: $calendarIndex).sheet(isPresented: $isPresented){
                                CourseInput(isPresented: $isPresented)
                            }
                        }
                        .frame(minHeight: 800.0,alignment: .top)
                        .padding(25)
                        .background(Color("CoursesListBackground"))
                        .cornerRadius(50)
                    }
                }.navigationTitle("TimeMan")
                .navigationBarItems(trailing: HStack{
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color("Primary"))
                            .padding(.bottom,15)
                    }
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Image(systemName: "calendar")
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color("Primary"))
                            .padding(.bottom,15)
                    }
                })
                    
            }
            
        }
    }
}
}
