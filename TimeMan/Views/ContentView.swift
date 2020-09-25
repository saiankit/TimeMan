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
                        CoursesList(calendarIndex: $calendarIndex).sheet(isPresented: $isPresented){
                            CourseInput(isPresented: $isPresented)
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
    @State var courses = CoursesList.makeCourseDefaults()
    @Binding var calendarIndex: Int
    static func makeCourseDefaults() -> [Course] {
        let mockLecture = Course(
            courseTitle: "Digital Design", courseCode: "ECE"
            , courseID: "F215", instructorName: "Prof. Sanjay Vidhyadharan", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "P1", weekDayRepeat: ["Monday","Wednesday","Friday"], meetLink: "www.meet.google.com", tutorialExists: true, practicalExits: true, lectureExists: true)

        let mockTutorial = Course(
            courseTitle: "Control Systems", courseCode: "ECE"
            , courseID: "F242", instructorName: "Alivelu Manga", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "", weekDayRepeat: ["Tuesday"], meetLink: "www.meet.google.com", tutorialExists: true, practicalExits: false, lectureExists: true)
        
        let mockPractical = Course(
            courseTitle: "Biology Laboratory", courseCode: "BIO"
            , courseID: "F110", instructorName: "Alivelu Manga", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "P10", weekDayRepeat: ["Monday"], meetLink: "www.meet.google.com", tutorialExists: false, practicalExits: true, lectureExists: false)

        return [mockLecture, mockTutorial, mockPractical]
    }


    func addCourse(course: Course) {
      courses.append(course)
    }
    
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
                    
                    ForEach(courses, id: \.courseTitle) {
                        if(shouldCourseBeIncluded(course: $0, index: self.calendarIndex))
                        {
                            CourseCard(course: $0)
                        }
                        
                    }
                }
            } else {
                VStack(alignment: .leading){
                    ForEach(courses, id: \.courseTitle) {
                      CourseCard(course: $0)
                    }
                }
            }
        }
}
}
