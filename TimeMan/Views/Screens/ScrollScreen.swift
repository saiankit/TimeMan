//
//  ScrollScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct ScrollScreen: View {
    @Binding var isPresented : Bool
    @State var calendarIndex = ((Calendar.current.component(.weekday, from: Date())) - 1)
    var body: some View {
        if #available(iOS 14.0, *) {
            
            ZStack{
                ScrollView(showsIndicators: false){
                          ZStack {
                            Color("Background")
                              VStack {
                                  WeekScroll(index: $calendarIndex)
                                  VStack(alignment: .leading){
                                      HStack {
                                          Text(calendarIndex == (Calendar.current.component(.weekday, from: Date()) - 1) ? "Today's Classes" : longWeekDaySymbols[calendarIndex] + "'s Classes")
                                              .font(.system(size: 20, weight: .bold, design: .rounded)).padding(.bottom,15)
                                          Spacer()
                                      }
                                    CoursesList(calendarIndex: $calendarIndex).sheet(isPresented: $isPresented){
                                        CourseInput(isPresented: $isPresented)
                                      }
                                    }
                                  .frame(minHeight: 800.0,alignment: .top)
                                  .padding(25)
                                  .background(Color("CoursesListBackground"))
                                  .clipShape(CustomCorner(corners: [.topLeft,.topRight], size: 55))
                    }
                }
            }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.isPresented.toggle()
                        },
                               label: {
                                Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 50, height: 45)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                                }
                        )
                        .background(Color.blue)
                        .cornerRadius(25)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                        radius: 3,x: 3,y: 3)
                    }
                }
            }
     
    }
}
}
