//
//  CourseCard.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct CourseCard: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var course: Course
    var viewModel = CourseViewModel()
    private func getClassTime(time : Date) -> String {
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
                //Course Information
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
                // Class Time and Meet Link
                VStack {
                    Text(getClassTime(time: course.time ?? Date()))
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 20)
                    if #available(iOS 14.0, *) {
                        Link(destination: URL(string: course.meetLink ?? "www.google.com")!, label: {
                            HStack{
                                ClassType(course: course).foregroundColor(.white)
                                Image(systemName: "video.fill").foregroundColor(.white)
                            }.padding(8)
                            .background(self.viewModel.colorNumbersLight[Int(course.colorNum)])
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
        .padding(20)
        .background(self.viewModel.colorNumbers[Int(course.colorNum)])
        .foregroundColor(Color.black)
        .cornerRadius(20).padding(.bottom)
        .contextMenu {
            Button(action: {
                let deleteItem = course
                self.managedObjectContext.delete(deleteItem)
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
            }) {
                Text("Delete")
            }
        }
    }
}
