//
//  AppleEvents.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/29/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import EventKit
import SwiftUI

class AppleEvents {
    let utils = WeekDayUtilities()
    let eventStore = EKEventStore()
    @ObservedObject var viewModel = CourseViewModel()
    
    private func addLectureToCalendar(
        title: String,
        startDate: Date,
        notes: String,
        eventStore: EKEventStore,
        lectureRepeat: Set<String>
    ) {
        let mappedWeekDayArray: [EKRecurrenceDayOfWeek] = utils.mapToEvents(weekDaySet: lectureRepeat)
        let event = EKEvent(eventStore: eventStore)
        event.title = title
        event.startDate = startDate
        event.endDate = startDate.addingTimeInterval(3000)
        event.notes = notes
        let recurrenceRule = EKRecurrenceRule.init(recurrenceWith: .daily,
            interval: 1,
            daysOfTheWeek: mappedWeekDayArray,
            daysOfTheMonth: nil,
            monthsOfTheYear: nil,
            weeksOfTheYear: nil,
            daysOfTheYear: nil,
            setPositions: nil,
            end: EKRecurrenceEnd.init(occurrenceCount: 200))

          event.recurrenceRules = [recurrenceRule]
        
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
            print("error : \(error)")
        }
    }
    
    private func addTutorialToCalendar(
        title: String,
        startDate: Date,
        notes: String,
        eventStore: EKEventStore,
        tutorialRepeat: Set<String>
    ) {
        let mappedWeekDayArray: [EKRecurrenceDayOfWeek] = utils.mapToEvents(weekDaySet: tutorialRepeat)

        let event = EKEvent(eventStore: eventStore)
        event.title = title
        event.startDate = startDate
        event.endDate = startDate.addingTimeInterval(3000)
        event.notes = notes
        
        let recurrenceRule = EKRecurrenceRule.init(recurrenceWith: .daily,
            interval: 1,
            daysOfTheWeek: mappedWeekDayArray,
            daysOfTheMonth: nil,
            monthsOfTheYear: nil,
            weeksOfTheYear: nil,
            daysOfTheYear: nil,
            setPositions: nil,
            end: EKRecurrenceEnd.init(occurrenceCount: 10))

          event.recurrenceRules = [recurrenceRule]
        
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
            print("error : \(error)")
        }
    }
    
    private func addPracticalToCalendar(
        title: String,
        startDate: Date,
        notes: String,
        eventStore: EKEventStore,
        practicalRepeat: Set<String>
    ) {
        let mappedWeekDayArray: [EKRecurrenceDayOfWeek] = utils.mapToEvents(weekDaySet: practicalRepeat)

        let event = EKEvent(eventStore: eventStore)
        event.title = title
        event.startDate = startDate
        event.endDate = startDate.addingTimeInterval(6600)
        event.notes = notes
        
        let recurrenceRule = EKRecurrenceRule.init(recurrenceWith: .daily,
            interval: 1,
            daysOfTheWeek: mappedWeekDayArray,
            daysOfTheMonth: nil,
            monthsOfTheYear: nil,
            weeksOfTheYear: nil,
            daysOfTheYear: nil,
            setPositions: nil,
            end: EKRecurrenceEnd.init(occurrenceCount: 10))

          event.recurrenceRules = [recurrenceRule]
        
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
            print("error : \(error)")
        }
    }
    
    func addLecture(
        lectureRepeat: Set<String>,
        title: String,
        startDate: Date,
        notes: String
    ) {
        eventStore.requestAccess(to: .event) { granted, error in
            if (granted) && (error == nil) {
                print("Access Granted")
                
                self.addLectureToCalendar(
                    title: title,
                    startDate: startDate,
                    notes: notes,
                    eventStore: self.eventStore,
                    lectureRepeat: lectureRepeat)
            } else {
                print("error : \(String(describing: error))")
            }
        }
    }
    
    func addTutorial(
        tutorialRepeat: Set<String>,
        title: String,
        startDate: Date,
        notes: String
    ) {
        eventStore.requestAccess(to: .event) { granted, error in
            if (granted) && (error == nil) {
                print("Access Granted")
                self.addTutorialToCalendar(
                    title: title,
                    startDate: startDate,
                    notes: notes,
                    eventStore: self.eventStore,
                    tutorialRepeat: tutorialRepeat)
            } else {
                print("error : \(String(describing: error))")
            }
        }
    }
    
    func addPractical(
        practicalRepeat: Set<String>,
        title: String,
        startDate: Date,
        notes: String
    ) {
        eventStore.requestAccess(to: .event) { granted, error in
            if (granted) && (error == nil) {
                print("Access Granted")
                self.addPracticalToCalendar(
                    title: title,
                    startDate: startDate,
                    notes: notes,
                    eventStore: self.eventStore,
                    practicalRepeat: practicalRepeat)
            } else {
                print("error : \(String(describing: error))")
            }
        }
    }
}
