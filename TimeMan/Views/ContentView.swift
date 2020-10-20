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
    @State var alert = false
    @State var calendarIndex = ((Calendar.current.component(.weekday, from: Date())) - 1)
    @State var isPresented = false
    var body: some View {
        NavigationView{
            ZStack {
                Color("Background")
                VStack {
                    Header()
                        .padding(.top, 60.0)
                        .padding(.bottom,20)
                    
                    WeekScroll(index: $calendarIndex)
                    Button(action: {
                        let center = UNUserNotificationCenter.current()

                            center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                                if granted {
                                    print("Yay!")
                                } else {
                                    print("D'oh")
                                }
                            }
                    }){
                        Text("Register")
                    }
                    Button(action: {
                                let content = UNMutableNotificationContent()
                                content.title = "ECE F215"
                                content.body = "Lecture in 10 min"
                                content.categoryIdentifier = "Lecture"

                                // this time interval represents the delay time of notification
                                // ie., the notification will be delivered after the delay.....
//                                let date = Date(timeIntervalSinceNow: 5)
//                                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                        //                                let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                        //                                UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                        
                        // Sunday | Monday | Tue | Wec | Thu | Fri | Sat
                        // 1        2          3    4     5     6     7
                        
                        //["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
                        // 0         1          2        3           4           5         6
                                var dateComponents = DateComponents()
                                dateComponents.hour = 9
                                dateComponents.minute = 50
                                dateComponents.weekday = 3
                                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//                        UNUserNotificationCenter.removeAllPendingNotificationRequests()
                        UNUserNotificationCenter.current().add(request)
                        }
                    ) {
                        Text("Send Notification")
                    }

                    Spacer()
                    VStack(alignment: .leading){
                        HStack {
                            Text(calendarIndex == (Calendar.current.component(.weekday, from: Date()) - 1) ? "Today's Classes" : longWeekDaySymbols[calendarIndex] + "'s Classes")
                                .font(.system(size: 20, weight: .bold, design: .rounded)).padding(.bottom,15)
                            Spacer()
                            Button(action: {
                                self.isPresented.toggle()
                            }) {
                                Image(systemName: "plus.circle")
                                .font(.system(size: 24, design: .rounded))
                                .foregroundColor(Color("Primary"))
                                .padding(.bottom,15)
                            }
                        }
                        CoursesList(calendarIndex: $calendarIndex).sheet(isPresented: $isPresented){
                            CourseInput(isPresented: $isPresented)
                        }
                    }
                    .padding(30)
                    .background(Color("CoursesListBackground"))
                    .cornerRadius(50)
                    .edgesIgnoringSafeArea(.bottom)
                    
                }
            }.edgesIgnoringSafeArea([.top,.bottom])
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




