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
    
    @State var lectureInstructorName : String = ""
    @State var lectureNumber : Int = 1
    
    @State var isTutorialExisting : Bool = false
    @State var tutorialInstructorName : String = ""
    @State var tutorialNumber : Int = 1
    
    @State var isPracticalExisting : Bool = false
    @State var practicalInstructorName : String = ""
    @State var practicalNumber : Int = 1
    
    var body: some View {
        Form{
            Section(header: Text("Course Information")){
                TextField("Course Title", text: $courseTitle)
            }
            // MARK: - Lecture
            Section(header: Text("Lecture Information")){
                TextField("Lecture Instructor", text: $courseTitle)
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
                }
            }
        }
    }
}

struct CourseInput_Previews: PreviewProvider {
    static var previews: some View {
        CourseInput()
    }
}
