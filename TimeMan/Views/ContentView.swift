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




//Button(action: {
//
//    UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (status, _) in
//        if status{
//
//            let content = UNMutableNotificationContent()
//            content.title = "ECE F215"
//            content.body = "Lecture in 10 min"
//
//            // this time interval represents the delay time of notification
//            // ie., the notification will be delivered after the delay.....
//            let date = Date(timeIntervalSinceNow: 5)
//            let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: date)
//            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
//
//            let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
//            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
//
//            return
//        }
//
//        self.alert.toggle()
//    }
//
//}) {
//
//    Text("Send Notification")
//
//}.alert(isPresented: $alert) {
//
//    return Alert(title: Text("Please Enable Notification Access In Settings Pannel !!!"))
//}
