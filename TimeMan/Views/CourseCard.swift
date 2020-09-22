//
//  CourseCard.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct CourseCard: View {
    
    //Attributes
    var courseTitle: String
    var courseCode: String
    var profName: String
    var lectureNumber: String
    var tutorialNumber: String = ""
    var practicalNumber: String = ""
    var lectureLink: String = ""
    var tutorialLink: String = ""
    var practicalLink: String = ""
    var classTime: String
    
    //CardView
    var body: some View {
        VStack{
            HStack(alignment: .top){
                
                VStack(alignment: .leading){
                    Text(self.courseTitle)
                        .font(.system(size: 22, weight: .bold, design: .rounded)).padding(.bottom, 5)
                    Text(self.courseCode)
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 10)
                    HStack {
                        Text(self.profName)
                            .font(.system(size: 16, design: .rounded))
                    }
                }
                Spacer()
                VStack {
                    
                    Text(self.classTime)
                        .font(.system(size: 18, design: .rounded))
                        .padding(.bottom, 20)
                    Button(action: {}){
                        HStack{
                            Text(self.lectureNumber)
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
        CourseCard(courseTitle: "Srimad Bhagavad Gita", courseCode: "HSS F334", profName: "Dr.Aruna Lolla", lectureNumber: "L1",classTime: "9:00 AM")
    }
}
