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

struct CourseNumbers: View {
    var course: Course
    var body: some View {
        if(course.lectureExists && (course.tutorialExists && course.practicalExits) )
        {
            Triple(ip1: course.lectureNumber, ip2: course.tutorialNumber, ip3: course.practicalNumber)
        }
        else if(course.lectureExists && course.tutorialExists)
        {
            Double(ip1: course.lectureNumber, ip2: course.tutorialNumber)
        }
        else if(course.lectureExists && course.practicalExits)
        {
            Double(ip1: course.lectureNumber, ip2: course.practicalNumber)
        }
        else if(course.tutorialExists && course.practicalExits)
        {
            Double(ip1: course.tutorialNumber, ip2: course.practicalNumber)
        }
        else if(course.lectureExists)
        {
            Single(input: course.lectureNumber)
        }
        else if(course.tutorialExists)
        {
            Single(input: course.tutorialNumber)
        }
        else if(course.practicalExits)
        {
            Single(input: course.practicalNumber)
        }
    }
}

struct CourseCard: View {
    
    var course: Course
    var date: Int = (Calendar.current.component(.minute, from: Date()))
    private func getTime(time : Date) -> String {
        var timeType: String = "AM"
        var hour: Int = (Calendar.current.component(.hour, from: time))
        let aminute: Int = (Calendar.current.component(.minute, from: time))
        let minute = (aminute == 0) ? "00" : String(aminute)
        timeType = hour >= 12 ? "PM" : "AM"
        hour = hour > 12 ? hour - 12 : hour
        return String(hour) + ":" + minute + " " + timeType
    }
    //CardView
    var body: some View {
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(course.courseTitle)
                        .font(.system(size: 22, weight: .bold, design: .rounded)).padding(.bottom, 5)
                    Text(course.courseCode + "  " + course.courseID)
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 10)
                    HStack {
                        Text(course.instructorName)
                            .font(.system(size: 16, design: .rounded))
                    }
                }
                Spacer()
                VStack {
                    Text(getTime(time: course.time))
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 20)
                    if #available(iOS 14.0, *) {
                        Link(destination: URL(string: course.meetLink)!, label: {
                            HStack{
                                if(course.isLecture)
                                {
                                    Text(course.lectureNumber)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                }
                                else if(course.isTutorial)
                                {
                                    Text(course.tutorialNumber)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                }
                                else if(course.isPractical)
                                {
                                    Text(course.practicalNumber)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                }
                                Image(systemName: "video.fill")
                            }.padding(8)
                        .background(Color("CourseCardSecondaryAccent"))
                        .cornerRadius(15)
                        })
                    } else {
                        // Fallback on earlier versions
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

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        
        CourseCard(course: Course(id: 1 , courseTitle: "Digital Design", courseCode: "ECE", courseID: "F215", instructorName: "Prof. Sanjay Vidhaydharan", time: Date(), weekDayRepeat: ["Mon"], meetLink: "www.meet.google.com", lectureNumber: "L1", tutorialNumber: "T3", practicalNumber: "P9", isLecture: false, isTutorial: false, isPractical: true, tutorialExists: true, practicalExits: true, lectureExists: true))
    }
}
