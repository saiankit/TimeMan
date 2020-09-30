//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View{
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var calendarIndex = ((Calendar.current.component(.weekday, from: Date())) - 1)
    @State var isPresented = false
    var body: some View {
        NavigationView{
            if #available(iOS 14.0, *) {
                ScrollView(showsIndicators: false){
                ZStack {
                    Color("Background")
                    VStack {
                        WeekScroll(index: $calendarIndex)
                        Spacer()
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
                        .padding(30)
                        .background(Color("CoursesListBackground"))
                        .cornerRadius(50)
                    }
                }.navigationTitle("TimeMan")
                .navigationBarItems(trailing: HStack{
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color("Primary"))
                            .padding(.bottom,15)
                    }
                    Button(action: {
                        self.isPresented.toggle()
                    }) {
                        Image(systemName: "calendar")
                            .font(.system(size: 24, design: .rounded))
                            .foregroundColor(Color("Primary"))
                            .padding(.bottom,15)
                    }
                })
                    
            }
            
        }
    }
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
