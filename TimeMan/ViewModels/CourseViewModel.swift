//
//  CourseViewModel.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/23/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation
class CourseViewModel: ObservableObject {
    //Input
    
    @Published var courseTitle : String = ""
    @Published var courseCode : String = ""
    @Published var courseID : String = ""
    
    
    @Published var lectureInstructorName : String = ""
    @Published var lectureNumber : Int = 1
    @Published var lectureTime = Date()
    @Published var lectureMeetLink: String = ""
    
    
    @Published var tutorialInstructorName : String = ""
    @Published var tutorialNumber : Int = 1
    @Published var tutorialTime = Date()
    @Published var tutorialMeetLink: String = ""
    
    
    @Published var practicalInstructorName : String = ""
    @Published var practicalNumber : Int = 1
    @Published var practicalTime = Date()
    @Published var practicalMeetLink: String = ""
}
