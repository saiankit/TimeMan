//
//  AppleEvents.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/29/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI
import EventKit
class AppleEvents {
    
    let utils = WeekDayUtilities()
    let eventStore: EKEventStore = EKEventStore()
    @ObservedObject var viewModel: CourseViewModel = CourseViewModel()
    
    private func addLectureToCalendar(viewModel: CourseViewModel, eventStore: EKEventStore, lectureRepeat: Set<String>)
    {
        
        let mappedWeekDayArray: [EKRecurrenceDayOfWeek] = utils.mapToEvents(weekDaySet: lectureRepeat)
        let event: EKEvent = EKEvent(eventStore: eventStore)
        event.title = viewModel.courseTitle + " " + viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber)
        event.startDate = viewModel.lectureTime
        event.endDate = viewModel.lectureTime.addingTimeInterval(3000)
        event.notes = viewModel.courseTitle + " :" + viewModel.courseCode + " " + viewModel.courseID + " " + viewModel.generateLectureNumber(lectureNumber: viewModel.lectureNumber) + " Instructor Name: " + viewModel.lectureInstructorName
        
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
        } catch let error as NSError{
            print("error : \(error)")
        }
        print("Lecture Event Added")
        
    }
    
    
    private func addTutorialToCalendar(viewModel: CourseViewModel, eventStore: EKEventStore, tutorialRepeat: Set<String>)
    {
        
        let mappedWeekDayArray: [EKRecurrenceDayOfWeek] = utils.mapToEvents(weekDaySet: tutorialRepeat)

        let event: EKEvent = EKEvent(eventStore: eventStore)
        event.title = viewModel.courseTitle + " " + viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber)
        event.startDate = viewModel.tutorialTime
        event.endDate = viewModel.tutorialTime.addingTimeInterval(3000)
        event.notes = viewModel.courseTitle + " :" + viewModel.courseCode + " " + viewModel.courseID + " " + viewModel.generateTutorialNumber(tutorialNumber: viewModel.tutorialNumber) + " Instructor Name: " + viewModel.lectureInstructorName
        
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
        } catch let error as NSError{
            print("error : \(error)")
        }
        print("Event Added")
        
    }
    
    private func addPracticalToCalendar(viewModel: CourseViewModel, eventStore: EKEventStore, practicalRepeat: Set<String>)
    {
        
        let mappedWeekDayArray: [EKRecurrenceDayOfWeek] = utils.mapToEvents(weekDaySet: practicalRepeat)

        let event: EKEvent = EKEvent(eventStore: eventStore)
        event.title = viewModel.courseTitle + " " + viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber)
        event.startDate = viewModel.practicalTime
        event.endDate = viewModel.practicalTime.addingTimeInterval(3000)
        event.notes = viewModel.courseTitle + " :" + viewModel.courseCode + " " + viewModel.courseID + " " + viewModel.generatePracticalNumber(practicalNumber: viewModel.practicalNumber) + " Instructor Name: " + viewModel.lectureInstructorName
        
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
        } catch let error as NSError{
            print("error : \(error)")
        }
        print("Event Added")
        
    }
    
    
    func addLecture(lectureRepeat: Set<String>) {
        eventStore.requestAccess(to: .event, completion: {
            (granted,error) in
            
            if (granted) && (error == nil)
            {
                print("Access Granted")
                self.addLectureToCalendar(viewModel: self.viewModel, eventStore: self.eventStore, lectureRepeat: lectureRepeat )
            }
            else
            {
                print("error : \(String(describing: error))")
            }
        })
    }
    
    
    func addTutorial(tutorialRepeat: Set<String>) {
        eventStore.requestAccess(to: .event, completion: {
            (granted,error) in
            
            if (granted) && (error == nil)
            {
                print("Access Granted")
                self.addTutorialToCalendar(viewModel: self.viewModel, eventStore: self.eventStore, tutorialRepeat: tutorialRepeat )
            }
            else
            {
                print("error : \(String(describing: error))")
            }
        })
    }
    
    func addPractical(practicalRepeat: Set<String>) {
        eventStore.requestAccess(to: .event, completion: {
            (granted,error) in
            
            if (granted) && (error == nil)
            {
                print("Access Granted")
                self.addPracticalToCalendar(viewModel: self.viewModel, eventStore: self.eventStore, practicalRepeat: practicalRepeat )
            }
            else
            {
                print("error : \(String(describing: error))")
            }
        })
    }

    
    
    
    
    
    
}
