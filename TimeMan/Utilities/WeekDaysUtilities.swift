//
//  weekDaysUtilities.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/29/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import EventKit
import Foundation

var weekDaySymbols: [String] = ["Sun",
                                "Mon",
                                "Tue",
                                "Wed",
                                "Thu",
                                "Fri",
                                "Sat"]

var longWeekDaySymbols: [String] = ["Sunday",
                                    "Monday",
                                    "Tuesday",
                                    "Wednesday",
                                    "Thursday",
                                    "Friday",
                                    "Saturday"]

class WeekDayUtilities {
    // MARK: - Integer Mapping
    // Mapping the weekDayRepeat to Native Integer Indices
    func mapToWeekDays(weekDaySet: Set<String>) -> [Int] {
        let lowerCasedSet = weekDaySet.map { $0.lowercased() }
        var mappedWeekDayArray: [Int] = []

        for weekDayName in lowerCasedSet {
            switch weekDayName {
            case "monday":
                mappedWeekDayArray.append(2)
            case "tuesday":
                mappedWeekDayArray.append(3)
            case "wednesday":
                mappedWeekDayArray.append(4)
            case "thursday":
                mappedWeekDayArray.append(5)
            case "friday":
                mappedWeekDayArray.append(6)
            case "saturday":
                mappedWeekDayArray.append(7)
            default:
                mappedWeekDayArray.append(1)
            }
        }
        
        return mappedWeekDayArray
    }
    
    // MARK: - EKRecurrenceDayOfWeek Mapping
    // Mapping the weekDayRepeat to EKRecurrenceDayOfWeek for Apple Event
    func mapToEvents(weekDaySet: Set<String>) -> [EKRecurrenceDayOfWeek] {
        let lowerCasedSet = weekDaySet.map { $0.lowercased() }
        var mappedWeekEventArray: [EKRecurrenceDayOfWeek] = []
        
        for weekDayName in lowerCasedSet {
            switch weekDayName {
            case "monday":
                mappedWeekEventArray.append(EKRecurrenceDayOfWeek.init(EKWeekday.monday))
            case "tuesday":
                mappedWeekEventArray.append(EKRecurrenceDayOfWeek.init(EKWeekday.tuesday))
            case "wednesday":
                mappedWeekEventArray.append(EKRecurrenceDayOfWeek.init(EKWeekday.wednesday))
            case "thursday":
                mappedWeekEventArray.append(EKRecurrenceDayOfWeek.init(EKWeekday.thursday))
            case "friday":
                mappedWeekEventArray.append(EKRecurrenceDayOfWeek.init(EKWeekday.friday))
            case "saturday":
                mappedWeekEventArray.append(EKRecurrenceDayOfWeek.init(EKWeekday.saturday))
            default:
                mappedWeekEventArray.append(EKRecurrenceDayOfWeek.init(EKWeekday.sunday))
            }
        }
        
        return mappedWeekEventArray
    }
}
