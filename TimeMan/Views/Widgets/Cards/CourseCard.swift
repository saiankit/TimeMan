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
    var colorCodes = ColorCodes()
    var dateTimeUtilities = DateTimeUtilities()
    //CardView
    var body: some View {
        VStack{
            HStack(alignment: .top){
                //Course Information
                VStack(alignment: .leading){
                    Text(course.courseTitle ?? "Default Title")
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .padding(.bottom, 5)
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
                    Text(dateTimeUtilities.getClassTime(time: course.time ?? Date()))
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 20)
                    if #available(iOS 14.0, *) {
                        Link(destination: URL(string: course.meetLink ?? "www.google.com")!, label: {
                            HStack{
                                ClassType(course: course).foregroundColor(.white)
                                Image(systemName: "video.fill").foregroundColor(.white)
                            }.padding(8)
                            .background(colorCodes.colorNumbersLight[Int(course.colorNum)])
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
        .background(colorCodes.colorNumbers[Int(course.colorNum)])
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
