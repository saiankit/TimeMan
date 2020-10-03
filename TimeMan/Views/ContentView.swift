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
    @State var selectedIndex = "Scroll"
    var body: some View {
        NavigationView{
            if #available(iOS 14.0, *) {
                VStack{
                ScrollView(showsIndicators: false){
                ZStack {
                    Color("Background")
                    VStack {
                        WeekScroll(index: $calendarIndex)
                        UpcomingClasses()
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
                }.navigationTitle("TimeMan")
                }
                    TabBar(selectedTab: $selectedIndex, isPresented: $isPresented)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}
