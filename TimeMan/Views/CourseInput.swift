//
//  CourseInput.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/22/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI


struct CourseInput: View {
   
    @ObservedObject var viewModel: CourseViewModel = CourseViewModel()
    @Binding var isPresented: Bool
    @Binding var coursesList: [Course]
    private func getTime(time : Date) -> String {
        var timeType: String = "AM"
        var hour: Int = (Calendar.current.component(.hour, from: time))
        let minute: Int = (Calendar.current.component(.minute, from: time))
        timeType = hour >= 12 ? "PM" : "AM"
        hour = hour > 12 ? hour - 12 : hour
        return String(hour) + ":" + String(minute) + " " + timeType
    }
    private func addCourse(course: Course)
    {
        coursesList.append(course)
    }
    var body: some View {
        NavigationView{
        Form{
            Section(header: Text("Course Information")){
                TextField("Course Title ( Digital Design )", text: $viewModel.courseTitle)
                
                TextField("Course Code ( ECE )", text: $viewModel.courseCode)
                
                TextField("Course ID ( F215 )", text: $viewModel.courseID)
            }
            // MARK: - Lecture
            Toggle(isOn: $viewModel.isLectureExisting)
            {
                Text("Lecture")
            }
            if(viewModel.isLectureExisting)
            {
                Section(header: Text("Lecture Information")){
                
                TextField("Lecture Instructor", text: $viewModel.lectureInstructorName)
                Stepper(value: $viewModel.lectureNumber, in: 1...10){
                    Text("L" + String(viewModel.lectureNumber))
                }
                DatePicker("Lecture Time", selection: $viewModel.lectureTime, displayedComponents: .hourAndMinute)
                TextField("Lecture Meet Code", text: $viewModel.lectureMeetCode)
                MultiSelector(
                    label: Text("WeekDay Repeat"),
                    options: viewModel.weekDays,
                    optionToString: { $0.name },
                    selected: $viewModel.lectureRepeatWeek.weekDays
                )
            }
            }
            
            
            // MARK: - Tutorial
            Toggle(isOn: $viewModel.isTutorialExisting)
            {
                Text("Tutorial")
            }
            if(viewModel.isTutorialExisting)
            {
                Section(header: Text("Tutorial Information")){
                    TextField("Tutorial Instructor", text: $viewModel.tutorialInstructorName)
                    Stepper(value: $viewModel.tutorialNumber, in: 1...10){
                        Text("T" + String(viewModel.tutorialNumber))
                                  }
                    DatePicker("Tutorial Time", selection: $viewModel.tutorialTime, displayedComponents: .hourAndMinute)
                    TextField("Tutorial Meet Code", text: $viewModel.tutorialMeetCode)
                    MultiSelector(
                        label: Text("WeekDay Repeat"),
                        options: viewModel.weekDays,
                        optionToString: { $0.name },
                        selected: $viewModel.tutorialRepeatWeek.weekDays
                    )
                    
                }
            }
            
            
            // MARK: - Practical
            Toggle(isOn: $viewModel.isPracticalExisting)
            {
                Text("Practical")
            }
            if(viewModel.isPracticalExisting)
            {
                Section(header: Text("Practical Information")){
                    TextField("Practical Instructor", text: $viewModel.practicalInstructorName)
                    Stepper(value: $viewModel.practicalNumber, in: 1...10){
                        Text("P" + String(viewModel.practicalNumber))
                                  }
                    DatePicker("Practical Time", selection: $viewModel.practicalTime, displayedComponents: .hourAndMinute)
                    TextField("Practical Meet Code", text: $viewModel.practicalMeetCode)
                    MultiSelector(
                        label: Text("WeekDay Repeat"),
                        options: viewModel.weekDays,
                        optionToString: { $0.name },
                        selected: $viewModel.practicalRepeatWeek.weekDays
                    )
                }
            }
            Section {
                Button(action:{
                    let mappedLectureRepeatWeek = viewModel.lectureRepeatWeek.weekDays.map { $0.name }
                    let mappedTutorialRepeatWeek = viewModel.tutorialRepeatWeek.weekDays.map { $0.name }
                    let mappedPracticalRepeatWeek = viewModel.practicalRepeatWeek.weekDays.map { $0.name }
                    
                    
                    let newLecture = Course(id: ( coursesList.count + 1 ) ,courseTitle: viewModel.courseTitle, courseCode: viewModel.courseCode, courseID: viewModel.courseID, instructorName: viewModel.lectureInstructorName, time: viewModel.lectureTime, weekDayRepeat: mappedLectureRepeatWeek, meetLink: viewModel.generateLink(meetCode: viewModel.lectureMeetCode), lectureNumber: viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber), tutorialNumber: viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber), practicalNumber: viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber), isLecture: true, isTutorial: false, isPractical: false, tutorialExists: viewModel.isTutorialExisting, practicalExits: viewModel.isPracticalExisting, lectureExists: viewModel.isLectureExisting)
                    
                    let newTutorial = Course(id: ( coursesList.count + 2 ) ,courseTitle: viewModel.courseTitle, courseCode: viewModel.courseCode, courseID: viewModel.courseID, instructorName: viewModel.tutorialInstructorName, time: viewModel.tutorialTime, weekDayRepeat: mappedTutorialRepeatWeek, meetLink: viewModel.generateLink(meetCode: viewModel.tutorialMeetCode), lectureNumber: viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber), tutorialNumber: viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber), practicalNumber: viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber), isLecture: false, isTutorial: true, isPractical: false, tutorialExists: viewModel.isTutorialExisting, practicalExits: viewModel.isPracticalExisting, lectureExists: viewModel.isLectureExisting)
                    
                    let newPractical = Course(id: ( coursesList.count + 3 ) ,courseTitle: viewModel.courseTitle, courseCode: viewModel.courseCode, courseID: viewModel.courseID, instructorName: viewModel.practicalInstructorName, time: viewModel.practicalTime, weekDayRepeat: mappedPracticalRepeatWeek, meetLink: viewModel.generateLink(meetCode: viewModel.practicalMeetCode), lectureNumber: viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber), tutorialNumber: viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber), practicalNumber: viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber), isLecture: false, isTutorial: false, isPractical: true, tutorialExists: viewModel.isTutorialExisting, practicalExits: viewModel.isPracticalExisting, lectureExists: viewModel.isLectureExisting)
                    
                    if(viewModel.isLectureExisting)
                    {
                        addCourse(course: newLecture)
                    }
                    if(viewModel.isTutorialExisting)
                    {
                        addCourse(course: newTutorial)
                    }
                    if(viewModel.isPracticalExisting)
                    {
                        addCourse(course: newPractical)
                    }
                    self.isPresented.toggle()
                }){
                Text("Add Course")
              }
            }
            
        }.navigationBarTitle(Text("Add Course"),displayMode: .inline)
        }
    }
    
}
struct CourseInput_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}
