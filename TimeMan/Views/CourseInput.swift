//
//  CourseInput.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/22/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI
import EventKit


struct CourseInput: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var viewModel: CourseViewModel = CourseViewModel()
    @Binding var isPresented: Bool
//    @Binding var coursesList: [Course]
    private func getTime(time : Date) -> String {
        var timeType: String = "AM"
        var hour: Int = (Calendar.current.component(.hour, from: time))
        let minute: Int = (Calendar.current.component(.minute, from: time))
        timeType = hour >= 12 ? "PM" : "AM"
        hour = hour > 12 ? hour - 12 : hour
        return String(hour) + ":" + String(minute) + " " + timeType
    }
//    private func addCourse(course: Course)
//    {
//        coursesList.append(course)
//    }
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
                    let fmappedLectureRepeatWeek = viewModel.lectureRepeatWeek.weekDays.map { $0.name }
                    let mappedLectureRepeatWeek = Set(fmappedLectureRepeatWeek)
                    
                    let fmappedTutorialRepeatWeek = viewModel.tutorialRepeatWeek.weekDays.map { $0.name }
                    let mappedTutorialRepeatWeek = Set(fmappedTutorialRepeatWeek)

                    
                    
                    let fmappedPracticalRepeatWeek = viewModel.practicalRepeatWeek.weekDays.map { $0.name }
                    let mappedPracticalRepeatWeek = Set(fmappedPracticalRepeatWeek)
                    
                    if(viewModel.isLectureExisting)
                    {
                        let newLecture = Course(context: self.managedObjectContext)
                        newLecture.courseTitle = viewModel.courseTitle
                        newLecture.courseID = viewModel.courseID
                        newLecture.courseCode = viewModel.courseCode
                        newLecture.instructorName = viewModel.lectureInstructorName
                        newLecture.weekDayRepeat = mappedLectureRepeatWeek
                        newLecture.meetLink = viewModel.generateLink(meetCode: viewModel.lectureMeetCode)
                        newLecture.lectureNumber = viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber)
                        newLecture.tutorialNumber = viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber)
                        newLecture.practicalNumber = viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber)
                        newLecture.isLecture = true
                        newLecture.isTutorial = false
                        newLecture.isPractical = false
                        newLecture.lectureExists = viewModel.isLectureExisting
                        newLecture.tutorialExists = viewModel.isTutorialExisting
                        newLecture.practicalExists = viewModel.isPracticalExisting
                        newLecture.time = viewModel.lectureTime
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch{
                            print(error)
                        }
                        

                    }
                    if(viewModel.isTutorialExisting)
                    {
                        let newTutorial = Course(context: self.managedObjectContext)
                        newTutorial.courseTitle = viewModel.courseTitle
                        newTutorial.courseID = viewModel.courseID
                        newTutorial.courseCode = viewModel.courseCode
                        newTutorial.instructorName = viewModel.tutorialInstructorName
                        newTutorial.weekDayRepeat = mappedTutorialRepeatWeek
                        newTutorial.meetLink = viewModel.generateLink(meetCode: viewModel.tutorialMeetCode)
                        newTutorial.lectureNumber = viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber)
                        newTutorial.tutorialNumber = viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber)
                        newTutorial.practicalNumber = viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber)
                        newTutorial.isLecture = false
                        newTutorial.isTutorial = true
                        newTutorial.isPractical = false
                        newTutorial.lectureExists = viewModel.isLectureExisting
                        newTutorial.tutorialExists = viewModel.isTutorialExisting
                        newTutorial.practicalExists = viewModel.isPracticalExisting
                        newTutorial.time = viewModel.tutorialTime
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch{
                            print(error)
                        }
                    }
                    if(viewModel.isPracticalExisting)
                    {
                        let newPractical = Course(context: self.managedObjectContext)
                        newPractical.courseTitle = viewModel.courseTitle
                        newPractical.courseID = viewModel.courseID
                        newPractical.courseCode = viewModel.courseCode
                        newPractical.instructorName = viewModel.practicalInstructorName
                        newPractical.weekDayRepeat = mappedPracticalRepeatWeek
                        newPractical.meetLink = viewModel.generateLink(meetCode: viewModel.practicalMeetCode)
                        newPractical.lectureNumber = viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber)
                        newPractical.tutorialNumber = viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber)
                        newPractical.practicalNumber = viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber)
                        newPractical.isLecture = false
                        newPractical.isTutorial = false
                        newPractical.isPractical = true
                        newPractical.lectureExists = viewModel.isLectureExisting
                        newPractical.tutorialExists = viewModel.isTutorialExisting
                        newPractical.practicalExists = viewModel.isPracticalExisting
                        newPractical.time = viewModel.practicalTime
                        do {
                                                  try self.managedObjectContext.save()
                                              } catch{
                                                  print(error)
                                              }
                    }
                    
                    
                    let eventStore: EKEventStore = EKEventStore()
                    eventStore.requestAccess(to: .event, completion: {
                        (granted,error) in
                        
                        if (granted) && (error == nil)
                        {
                            print("Access Granted")
                        
                            let event: EKEvent = EKEvent(eventStore: eventStore)
                            event.title = viewModel.courseTitle + viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber)
                            event.startDate = Date()
                            event.endDate = Date()
                            event.calendar = eventStore.defaultCalendarForNewEvents
                            do {
                                try eventStore.save(event, span: .thisEvent)
                            } catch let error as NSError{
                                print("error : \(error)")
                            }
                            print("Event Added")
                        }
                        else
                        {
                            print("error : \(error)")
                        }
                    })
                    
                    
                    
                    
                    
                    
                    
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
