//
//  LectureCardView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/24/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct LectureCardView: View {
    
    let lecture: Lecture
    static let lectureTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var body: some View {
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(lecture.courseTitle)
                        .font(.system(size: 22, weight: .bold, design: .rounded)).padding(.bottom, 5)
                    HStack{
                        Text(lecture.courseCode)
                            .font(.system(size: 18, design: .rounded))
                            .padding(.bottom, 10)
                        Text(lecture.courseID)
                            .font(.system(size: 18, design: .rounded))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Text(lecture.instructorName)
                            .font(.system(size: 16, design: .rounded))
                    }
                }
                Spacer()
                VStack {
                    Text("Hi")
                        .font(.system(size: 18, design: .rounded))
                            .padding(.bottom, 20)
                    Button(action: {}){
                        HStack{
                            Text(lecture.number)
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
            
            if(lecture.isTutorial == true && lecture.isPractical == true)
            {
                HStack{
                    HStack{
                        Text(lecture.number)
                    }
                Spacer()
                    HStack{
                        Text(lecture.tutorialNumber)
                    }
                Spacer()
                    HStack{
                        Text(lecture.practicalNumber)
                    }
                }
            }
            else if(lecture.isTutorial == true && lecture.isPractical == false)
            {
                HStack{
                    HStack{
                        Text(lecture.number)
                    }
                Spacer()
                    HStack{
                        Text(lecture.tutorialNumber)
                    }
                }
            }
            else if(lecture.isTutorial == false && lecture.isPractical == true)
            {
                HStack{
                    HStack{
                        Text(lecture.number)
                    }
                Spacer()
                    HStack{
                        Text(lecture.practicalNumber)
                    }
                }
            }
            else if(lecture.isTutorial == false && lecture.isPractical == false)
            {
                HStack{
                    Text(lecture.number)
                }
            }
        }
        .padding(30)
        .background(Color("CourseCardPrimaryAccent"))
            .foregroundColor(Color.white)
            .cornerRadius(20).padding(.bottom)
    }
}


struct LectureCourseCard_Previews: PreviewProvider {
    static var previews: some View {
        LectureCardView(lecture: Lecture(courseTitle: "Digital Design", courseCode: "ECE", courseID: "F215", instructorName: "Prof. Sanjay Vidhyadharan", number: "L1", time: Date(), weekDayRepeat: ["Mon", "Wed"], meetLink: "www.google.com", isTutorial: true, tutorialNumber: "T1", isPractical: false, practicalNumber: ""))
    }
}
