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
    private let center = UNUserNotificationCenter.current()
    private let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    private let calendar = Calendar.current
    private let weekDayUtilities = WeekDayUtilities()

    // Method to register for Notifications on the Device
    private func registerNotifications() {
        center.requestAuthorization(options: options) { granted, error in
            if granted && error == nil {
                print("Notifications are registered")
            } else {
                print("D'oh.. Notifications aren't registered")
            }
        }
    }

    // Public Method used to schedule for Notifications
    func scheduleNotification(
        title: String,
        subtitle: String,
        body: String,
        time: Date,
        weekRepeat: Set<String>
    ) {
        self.registerNotifications()

        // Content for the Notification
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body

        // Setting time 10 minutes earlier of the class
        let newTime = calendar.date(byAdding: .minute, value: -10, to: time)
        var dateComponents = DateComponents()
        let hour = calendar.component(.hour, from: newTime!)
        let minute = calendar.component(.minute, from: newTime!)
        let mappedWeekDayArray = weekDayUtilities.mapToWeekDays(weekDaySet: weekRepeat)

        // We are looping across the weekDay and scheduling the notifcations
        for weekDay in mappedWeekDayArray {
            dateComponents.hour = hour
            dateComponents.minute = minute
            dateComponents.weekday = weekDay
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            let request = UNNotificationRequest(
                identifier: UUID().uuidString,
                content: content,
                trigger: trigger)
            center.add(request)
        }
    }
}
