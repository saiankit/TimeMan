//
//  PracticalCardView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/24/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct PracticalCardView: View {
    let practical: Practical
    let lectureTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var body: some View {
        VStack{
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text(practical.courseTitle)
                        .font(.system(size: 22, weight: .bold, design: .rounded)).padding(.bottom, 5)
                    HStack{
                        Text(practical.courseCode)
                            .font(.system(size: 18, design: .rounded))
                            .padding(.bottom, 10)
                        Text(practical.courseID)
                            .font(.system(size: 18, design: .rounded))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Text(practical.instructorName)
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
                            Text(practical.number)
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
            
            if(practical.isTutorial == true && practical.isPractical == true)
            {
                HStack{
                    HStack{
                        Text(practical.number)
                    }
                Spacer()
                    HStack{
                        Text(practical.tutorialNumber)
                    }
                Spacer()
                    HStack{
                        Text(practical.practicalNumber)
                    }
                }
            }
            else if(practical.isTutorial == true && practical.isPractical == false)
            {
                HStack{
                    HStack{
                        Text(practical.number)
                    }
                Spacer()
                    HStack{
                        Text(practical.tutorialNumber)
                    }
                }
            }
            else if(practical.isTutorial == false && practical.isPractical == true)
            {
                HStack{
                    HStack{
                        Text(practical.number)
                    }
                Spacer()
                    HStack{
                        Text(practical.lectureNumber)
                    }
                }
            }
            else if(practical.isTutorial == false && practical.isPractical == false)
            {
                HStack{
                    Text(practical.number)
                }
            }
        }
        .padding(30)
        .background(Color("CourseCardPrimaryAccent"))
            .foregroundColor(Color.white)
            .cornerRadius(20).padding(.bottom)
    }
}

struct PracticalCardView_Previews: PreviewProvider {
    static var previews: some View {
        PracticalCardView(practical: Practical(courseTitle: "Digital Design", courseCode: "ECE", courseID: "F215", instructorName: "Prof. Sanjay Vidhyadharan", number: "L1", time: Date(), weekDayRepeat: ["Mon", "Wed"], meetLink: "www.google.com", isTutorial: true, tutorialNumber: "T1", isLecture: false, practicalNumber: ""))
    }
}
