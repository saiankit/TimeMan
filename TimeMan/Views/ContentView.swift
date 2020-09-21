//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 204/255, green: 246/255, blue: 255/255)
            VStack {
                Header()
                    .padding(.top, 60.0)
                    .padding(.bottom,30)
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(spacing: 20) {
                        
                        CalendarItem(isSelected: false)
                        CalendarItem(isSelected: true)
                        CalendarItem(isSelected: false)
                        CalendarItem(isSelected: false)
                        CalendarItem(isSelected: false)
                        CalendarItem(isSelected: false)
                        CalendarItem(isSelected: false)
                    }
                }.padding(.bottom,40)
                    .padding(.leading)
                
                Spacer()
                VStack(alignment: .leading){
                    Text("Today's Classes")
                        .font(.system(size: 24, weight: .bold, design: .rounded)).padding(.bottom,15)
                    ScrollView(.vertical,showsIndicators: false){
                        VStack(alignment: .leading){
                            CourseCard(courseTitle: "Srimad Bhagavad Gita", courseCode: "HSS F334", profName: "Dr.Aruna Lolla", lectureNumber: "L1",classTime: "9:00 AM")
                            CourseCard(courseTitle: "Digital Design", courseCode: "ECE F215", profName: "Prof. Sanjay Vidhyadharan", lectureNumber: "L2", classTime: "2:00 PM")
                            
                        }
                    }
                    
                }
                .padding(30)
                .background(Color(#colorLiteral(red: 0.9961728454, green: 0.9902502894, blue: 1, alpha: 1)))
                .cornerRadius(20)
                .edgesIgnoringSafeArea(.bottom)
                
                
            }
        }.edgesIgnoringSafeArea([.top,.bottom])
    }
}



struct CalendarItem: View{
    
    var isSelected: Bool;
    var body: some View{
        
        VStack {
            Text("9")
            Text("Sat")
        }
        .padding([.horizontal],15)
        .padding([.vertical],25)
            
        .background(isSelected ? Color(#colorLiteral(red: 0.7912799716, green: 1, blue: 0.8202505708, alpha: 1)) : Color.white)
        .cornerRadius(20)
        
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
