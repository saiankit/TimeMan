//
//  CourseCard.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct CourseCard: View {
    
    var course: Course
    var date: Int = (Calendar.current.component(.minute, from: Date()))
    private func getTime(time : Date) -> String {
        var timeType: String = "AM"
        var hour: Int = (Calendar.current.component(.hour, from: time))
        let minute: Int = (Calendar.current.component(.minute, from: time))
        timeType = hour >= 12 ? "PM" : "AM"
        hour = hour > 12 ? hour - 12 : hour
        return String(hour) + ":" + String(minute) + " " + timeType
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
                         
                    Button(action: {}){
                        HStack{
                            Text("L1")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            Image(systemName: "video.fill")
                        }
                    }.padding(8)
                        .background(Color("CourseCardSecondaryAccent"))
                        .cornerRadius(15)
                }
                
            }
            Rectangle()
                .fill(Color.white)
                .frame(height: 2)
                .padding(.vertical)
            
            HStack{
                Button(action: {}){
                    HStack{
                        Text("L1")
                    }
                }
                Spacer()
                Button(action: {}){
                    HStack{
                        Text("T5")
                    }
                }
                Spacer()
                Button(action: {}){
                    HStack{
                        Text("P2")
                    }
                }
            }
        }
        .padding(30)
        .background(Color("CourseCardPrimaryAccent"))
            .foregroundColor(Color.white)
            .cornerRadius(20).padding(.bottom)
    }
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        
        CourseCard(course: Course(
            courseTitle: "Control Systems", courseCode: "ECE"
            , courseID: "F242", instructorName: "Alivelu Manga", time: Date(), lectureNumber: "L1", tutorialNumber: "T1", practicalNumber: "", weekDayRepeat: ["Tue"], meetLink: "www.google.com", tutorialExists: true, practicalExits: false, lectureExists: true, isLecture: false, isTutorial: true, isPractical: false
        ))
    }
}
