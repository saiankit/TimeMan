//
//  LocalNotificationManager.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/20/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation
import UserNotifications
class LocalNotificationManager {
    let center = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    let calendar = Calendar.current
    let utils = WeekDayUtilities()
    
    private func registerNotifications() {
        center.requestAuthorization(options: options) { (granted, error) in
            if granted {
                print("Notifications are registered")
            } else {
                print("D'oh.. Notifications aren't registered")
            }
        }
    }
    
    func scheduleNotification(
        title: String,
        subtitle: String,
        body: String,
        time: Date,
        weekRepeat: Set<String>
    ) {
        self.registerNotifications()
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        let newTime = calendar.date(byAdding: .minute, value: -10, to: time) // 10 minutes earlier
        var dateComponents = DateComponents()
        let hour = calendar.component(.hour, from: newTime!)
        let minute = calendar.component(.minute, from: newTime!)
        let mappedWeekDayArray: [Int] = utils.mapToWeekDays(weekDaySet: weekRepeat)
        
        for weekDay in mappedWeekDayArray {
            dateComponents.hour = hour
            dateComponents.minute = minute
            dateComponents.weekday = weekDay
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: trigger
            )
            
            center.add(request)
        }
    }
}

