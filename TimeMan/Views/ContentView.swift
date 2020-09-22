//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var calendarIndex = 0

   
    var dateComponents = DateComponents();
  
//    let endOfDomain = fqdn.index(fqdn.endIndex, offsetBy: -4)
//    let rangeOfDomain = fqdn.startIndex ..< endOfDomain
//    fqdn[rangeOfDomain]

    var body: some View {
        ZStack {
            Color(red: 204/255, green: 246/255, blue: 255/255)
            VStack {
                Header()
                    .padding(.top, 60.0)
                    .padding(.bottom,30)
               WeekScroll(index: $calendarIndex)
                Spacer()
                if(self.calendarIndex == 0)
                {
                    MondayClasses()
                }
                else
                {
                    TuesdayClasses()
                }
            }
        }.edgesIgnoringSafeArea([.top,.bottom])
           
    }
}


struct Header: View {
    var body: some View{
        VStack {
            HStack {
                Text("TimeMan")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            HStack {
                Text("Track your Timetable")
                    .font(.callout)
                    .fontWeight(.thin)
                
                Spacer()
            }
            
        }.padding(.leading)
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct MondayClasses: View {
    var body: some View{
      VStack(alignment: .leading){
                     Text("Today's Classes")
                         .font(.system(size: 24, weight: .bold, design: .rounded)).padding(.bottom,15)
                     ScrollView(.vertical,showsIndicators: false){
                         VStack(alignment: .leading){
                             CourseCard(courseTitle: "Srimad Bhagavad Gita", courseCode: "HSS F334", profName: "Dr.Aruna Lolla", lectureNumber: "L1",classTime: "9:00 AM")
                             CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
                             
                         }
                     }
                     
                 }
                 .padding(30)
                 .background(Color(#colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 1)))
                 .cornerRadius(50)
                 .edgesIgnoringSafeArea(.bottom)
    }
    
}


struct TuesdayClasses: View {
    var body: some View{
      VStack(alignment: .leading){
                     Text("Today's Classes")
                         .font(.system(size: 24, weight: .bold, design: .rounded)).padding(.bottom,15)
                     ScrollView(.vertical,showsIndicators: false){
                         VStack(alignment: .leading){
                             CourseCard(courseTitle: "Public Policy", courseCode: "HSS F334", profName: "Zaq", lectureNumber: "L1",classTime: "9:00 AM")
                             CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "T2", classTime: "2:00 PM")
                             
                         }
                     }
                     
                 }
                 .padding(30)
                 .background(Color(#colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 1)))
                 .cornerRadius(50)
                 .edgesIgnoringSafeArea(.bottom)
    }
    
}
