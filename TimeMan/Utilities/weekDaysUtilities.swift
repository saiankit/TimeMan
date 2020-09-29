//
//  weekDaysUtilities.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/29/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation
import EventKit

class WeekDayUtilities{
    func mapToWeekDays(weekDaySet: Set<String>) -> [Int] {
        
        let lowerreMappedSet = weekDaySet.map { $0.lowercased() }
        
        var mappedWeekDayArray: [Int] = []

        for weekName in lowerreMappedSet {
            switch weekName {
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
    
    
    
    func mapToEvents(weekDaySet: Set<String>) -> [EKRecurrenceDayOfWeek] {
        
        let lowerreMappedSet = weekDaySet.map { $0.lowercased()}
        var mappedWeekEventArray: [EKRecurrenceDayOfWeek] = []
        for weekName in lowerreMappedSet {
            switch weekName {
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
