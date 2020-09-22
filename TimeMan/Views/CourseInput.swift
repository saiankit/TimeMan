//
//  CourseInput.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/22/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct CourseInput: View {
    
    @State var courseTitle : String = ""
    @State var courseCode : String = ""
    @State var courseID : String = ""
    
    @State var lectureInstructorName : String = ""
    @State var lectureNumber : Int = 1
    @State var lectureTime = Date()
    @State var lectureMeetLink: String = ""
    
    @State var isTutorialExisting : Bool = false
    @State var tutorialInstructorName : String = ""
    @State var tutorialNumber : Int = 1
    @State var tutorialTime = Date()
    @State var tutorialMeetLink: String = ""
    
    @State var isPracticalExisting : Bool = false
    @State var practicalInstructorName : String = ""
    @State var practicalNumber : Int = 1
    @State var practicalTime = Date()
    @State var practicalMeetLink: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Course Information")){
                TextField("Course Title ( Digital Design )", text: $courseTitle)
                
                TextField("Course Code ( ECE )", text: $courseCode)
                
                TextField("Course ID ( F215 )", text: $courseID)
            }
            // MARK: - Lecture
            Section(header: Text("Lecture Information")){
                TextField("Lecture Instructor", text: $lectureInstructorName)
                Stepper(value: $lectureNumber, in: 1...10){
                    Text("L" + String(lectureNumber))
                }
                DatePicker("Lecture Time", selection: $lectureTime, displayedComponents: .hourAndMinute)
                TextField("Lecture Meet Link", text: $lectureMeetLink)
            }
            
            
            // MARK: - Tutorial
            Toggle(isOn: $isTutorialExisting)
            {
                Text("Tutorial")
            }
            if(self.isTutorialExisting)
            {
                Section(header: Text("Tutorial Information")){
                    TextField("Tutorial Instructor", text: $tutorialInstructorName)
                    Stepper(value: $tutorialNumber, in: 1...10){
                                      Text("T" + String(tutorialNumber))
                                  }
                    DatePicker("Tutorial Time", selection: $tutorialTime, displayedComponents: .hourAndMinute)
                    TextField("Tutorial Meet Link", text: $tutorialMeetLink)
                    
                }
            }
            
            
            // MARK: - Practical
            Toggle(isOn: $isPracticalExisting)
            {
                Text("Practical")
            }
            if(self.isPracticalExisting)
            {
                Section(header: Text("Practical Information")){
                    TextField("Practical Instructor", text: $practicalInstructorName)
                    Stepper(value: $practicalNumber, in: 1...10){
                                      Text("P" + String(practicalNumber))
                                  }
                    DatePicker("Practical Time", selection: $practicalTime, displayedComponents: .hourAndMinute)
                    TextField("Practical Meet Link", text: $practicalMeetLink)
                }
            }
        }.padding()
    }
}

struct CourseInput_Previews: PreviewProvider {
    static var previews: some View {
        CourseInput()
    }
}
