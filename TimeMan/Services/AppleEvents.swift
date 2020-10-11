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
    private let utils = WeekDayUtilities()
    private let eventStore = EKEventStore()

    // MARK: - Save Event
    // Method used to save event to Apple Calendar
    // Params include all the content pertaining to the event
    // If the event "isPractical" end Time increases from 50 min to 1hr50min

    private func saveEvent(
        title: String,
        startDate: Date,
        notes: String,
        eventStore: EKEventStore,
        weekDayRepeat: Set<String>,
        isPractical: Bool
    ) {
        // Content for the Event
        let event = EKEvent(eventStore: eventStore)
        event.title = title
        event.startDate = startDate
        event.endDate = isPractical ? startDate.addingTimeInterval(6600) : startDate.addingTimeInterval(3000)
        event.notes = notes

        // Reccurence Rule for the event
        // Repeats every week on the given Reccurence Day of the Week
        // Recurrence Day is given by mapping the repeat to EKRecurrenceDayOfWeek

        let mappedWeekDayArray: [EKRecurrenceDayOfWeek] = utils.mapToEvents(weekDaySet: weekDayRepeat)
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

        // Save
        do {
            try eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
            print("error : \(error)")
        }
    }

    // MARK: - Lecture Event
    // Public method used to store Lecture Event using the main save event method
    // We check for the access and store the event in Apple Calendar

    func addLecture(
        lectureRepeat: Set<String>,
        title: String,
        startDate: Date,
        notes: String
    ) {
        eventStore.requestAccess(to: .event) { granted, error in
            if granted && error == nil {
                self.saveEvent(
                    title: title,
                    startDate: startDate,
                    notes: notes,
                    eventStore: self.eventStore,
                    weekDayRepeat: lectureRepeat,
                    isPractical: false)
            } else {
                print("error : \(String(describing: error))")
            }
        }
    }

    // MARK: - Tutorial Event
    // Public method used to store Tutorial Event using the main save event method
    // We check for the access and store the event in Apple Calendar

    func addTutorial(
        tutorialRepeat: Set<String>,
        title: String,
        startDate: Date,
        notes: String
    ) {
        eventStore.requestAccess(to: .event) { granted, error in
            if granted && error == nil {
                self.saveEvent(
                    title: title,
                    startDate: startDate,
                    notes: notes,
                    eventStore: self.eventStore,
                    weekDayRepeat: tutorialRepeat,
                    isPractical: false)
            } else {
                print("error : \(String(describing: error))")
            }
        }
    }

    // MARK: - Practical Event
    // Public method used to store Practical Event using the main save event method
    // We check for the access and store the event in Apple Calendar

    func addPractical(
        practicalRepeat: Set<String>,
        title: String,
        startDate: Date,
        notes: String
    ) {
        eventStore.requestAccess(to: .event) { granted, error in
            if granted && error == nil {
                self.saveEvent(
                    title: title,
                    startDate: startDate,
                    notes: notes,
                    eventStore: self.eventStore,
                    weekDayRepeat: practicalRepeat,
                    isPractical: true)
            } else {
                print("error : \(String(describing: error))")
            }
        }
    }
}
