//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State var calendarIndex = (Calendar.current.component(.weekday, from: Date()) - 2)
    @State var calendarIndex = 4
    @State var isShowingAddCourse = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("Background")
               VStack {
                    Header(isShown: $isShowingAddCourse)
                        .padding(.top, 60.0)
                        .padding(.bottom,30)
                    
                    WeekScroll(index: $calendarIndex)
                    
                    NavigationLink(destination: CourseInput(), isActive: $isShowingAddCourse) { EmptyView() }
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text(calendarIndex == (Calendar.current.component(.weekday, from: Date()) - 2) ? "Today's Classes" : longWeekDaySymbols[calendarIndex] + "'s Classes")
                                .font(.system(size: 24, weight: .bold, design: .rounded)).padding(.bottom,15)
                            
                            Spacer()
                            
                            
                            Button(action: {
                                self.isShowingAddCourse = true
                            }) {
                                Image(systemName: "plus.circle")
                                .font(.system(size: 24, design: .rounded))
                                .foregroundColor(Color("Primary"))
                                .padding(.bottom,15)
                            }

                        }
                        TuesdayClasses()
                        
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


struct Header: View {
    @Binding var isShown: Bool
    var body: some View{
        HStack {
            VStack {
                HStack {
                    Text("TimeMan")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                }
                HStack {
                    Text("Track your Timetable")
                        .font(.callout)
                        .fontWeight(.thin)
                    
                }
                
            }.padding(.leading)
            Spacer()
            
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct MondayClasses: View {
    var body: some View{
        VStack(alignment: .leading){
            HStack {
                Text("Today's Classes")
                    .font(.system(size: 24, weight: .bold, design: .rounded)).padding(.bottom,15)
            }
            ScrollView(.vertical,showsIndicators: false){
                VStack(alignment: .leading){
                    CourseCard(courseTitle: "Srimad Bhagavad Gita", courseCode: "HSS F334", profName: "Dr.Aruna Lolla", lectureNumber: "L1",classTime: "9:00 AM")
                    CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
                    
                }
            }
            
        }
        .padding(30)
        .background(Color(#colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 1)))
        .cornerRadius(50)
        .edgesIgnoringSafeArea(.bottom)
    }
    
}


struct TuesdayClasses: View {
    var body: some View{
        ScrollView(.vertical,showsIndicators: false){
            VStack(alignment: .leading){
                CourseCard(courseTitle: "Public Policy", courseCode: "HSS F334", profName: "Zaq", lectureNumber: "L1",classTime: "9:00 AM")
                CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
                
            }
        }
        
}
}
