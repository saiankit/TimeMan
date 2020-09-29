//
//  CourseCard.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct Single: View {
    var input: String
    var body: some View {
        HStack{
            Text(input)
        }
    }
}

struct Double: View {
    var ip1: String
    var ip2: String
    var body: some View {
        HStack{
            Text(ip1)
            Spacer()
            Text(ip2)
        }
    }
}

struct Triple: View {
    var ip1: String
    var ip2: String
    var ip3: String
    var body: some View {
        HStack{
            Text(ip1)
            Spacer()
            Text(ip2)
            Spacer()
            Text(ip3)
        }
    }
}

struct CourseLink: View {
    var course: Course
    var body: some View {
        if(course.isLecture)
                          {
            Text(course.lectureNumber ?? "L1")
                              .font(.largeTitle)
                              .fontWeight(.heavy)
                          }
                          else if(course.isTutorial)
                          {
                            Text(course.tutorialNumber ?? "T1")
                              .font(.largeTitle)
                              .fontWeight(.heavy)
                          }
                          else if(course.isPractical)
                          {
                            Text(course.practicalNumber ?? "P1")
                              .font(.largeTitle)
                              .fontWeight(.heavy)
                          }
    }
}





struct CourseNumbers: View {
    var course: Course
    var body: some View {
        if(course.lectureExists && (course.tutorialExists && course.practicalExists) )
        {
            Triple(ip1: course.lectureNumber ?? "L1", ip2: course.tutorialNumber ?? "T1", ip3: course.practicalNumber ?? "P1")
        }
        else if(course.lectureExists && course.tutorialExists)
        {
            Double(ip1: course.lectureNumber ?? "L1", ip2: course.tutorialNumber ?? "T1")
        }
        else if(course.lectureExists && course.practicalExists)
        {
            Double(ip1: course.lectureNumber ?? "L1", ip2: course.practicalNumber ?? "P1")
        }
        else if(course.tutorialExists && course.practicalExists)
        {
            Double(ip1: course.tutorialNumber ?? "T1", ip2: course.practicalNumber ?? "P1")
        }
        else if(course.lectureExists)
        {
            Single(input: course.lectureNumber ?? "L1")
        }
        else if(course.tutorialExists)
        {
            Single(input: course.tutorialNumber ?? "T1")
        }
        else if(course.practicalExists)
        {
            Single(input: course.practicalNumber ?? "P1")
        }
    }
}

struct CourseCard: View {
    
    var course: Course
    var date: Int = (Calendar.current.component(.minute, from: Date()))
    private func getTime(time : Date) -> String {
        var timeType: String = "AM"
        var hour: Int = (Calendar.current.component(.hour, from: time))
        let minute: Int = (Calendar.current.component(.minute, from: time))
        
        var aminute = (minute == 0) ? "00" : String(minute)
        
        aminute = ((minute < 10) && (minute >= 1)) ? "0" + String(minute) : String(aminute)
        timeType = hour >= 12 ? "PM" : "AM"
        hour = hour > 12 ? hour - 12 : hour
        return String(hour) + ":" + String(aminute) + " " + timeType
    }
    //CardView
    var body: some View {
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(course.courseTitle ?? "Default Title")
                        .font(.system(size: 22, weight: .bold, design: .rounded)).padding(.bottom, 5)
                    Text(course.courseCode ?? "DDD" + "  " + course.courseID!)
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 10)
                    HStack {
                        Text(course.instructorName ?? "Prof. Instructor")
                            .font(.system(size: 16, design: .rounded))
                    }
                }
                Spacer()
                VStack {
                    Text(getTime(time: course.time ?? Date()))
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 20)
                    if #available(iOS 14.0, *) {
                        Link(destination: URL(string: course.meetLink ?? "www.google.com")!, label: {
                            HStack{
                                CourseLink(course: course)
                                Image(systemName: "video.fill")
                            }.padding(8)
                        .background(Color("CourseCardSecondaryAccent"))
                        .cornerRadius(15)
                        })
                    }
                    
                           
                }
            }
            Rectangle()
                .fill(Color.white)
                .frame(height: 2)
                .padding(.vertical)
            
            CourseNumbers(course: course)
            
        }
        .padding(30)
        .background(Color("CourseCardPrimaryAccent"))
        .foregroundColor(Color.white)
            .cornerRadius(20).padding(.bottom)
    }
}
