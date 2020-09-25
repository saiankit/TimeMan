//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var calendarIndex = (Calendar.current.component(.weekday, from: Date()) - 2)    
    @State var isPresented = false
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
//                        TuesdayClasses().sheet(isPresented: $isPresented){
//                            CourseInput()
//                        }
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

//
//struct TuesdayClasses: View {
//    @State var courses = TuesdayClasses.makeCourseDefaults()
//    static func makeCourseDefaults() -> [Course] {
//        let mockLecture = Course(
//            courseTitle: "Digital Design", courseCode: "ECE"
//            , courseID: "F215", instructorName: "Prof. Sanjay Vidhyadharan", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "P1", weekDayRepeat: ["Mon","Wed","Fri"], meetLink: "www.google.com", tutorialExists: true, practicalExits: true, lectureExists: true, isLecture: true, isTutorial: false, isPractical: false
//        )
//
//        let mockTutorial = Course(
//            courseTitle: "Control Systems", courseCode: "ECE"
//            , courseID: "F242", instructorName: "Alivelu Manga", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "", weekDayRepeat: ["Tue"], meetLink: "www.google.com", tutorialExists: true, practicalExits: false, lectureExists: true, isLecture: false, isTutorial: true, isPractical: false
//        )
//
//        return [mockLecture, mockTutorial]
//    }
//
//
//    func addCourse(course: Course) {
//      courses.append(course)
//    }
//
//    var body: some View{
//        ScrollView(.vertical,showsIndicators: false){
//            if #available(iOS 14.0, *) {
//                LazyVStack(alignment: .leading){
//                    CourseCard(courseTitle: "Public Policy", courseCode: "HSS F334", profName: "Zaq", lectureNumber: "L1",classTime: "9:00 AM")
//                    CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
//                    CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
//
//                }
//            } else {
//                VStack(alignment: .leading){
//                    CourseCard(courseTitle: "Public Policy", courseCode: "HSS F334", profName: "Zaq", lectureNumber: "L1",classTime: "9:00 AM")
//                    CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
//                    CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
//
//                }
//            }
//        }
//}
//}
