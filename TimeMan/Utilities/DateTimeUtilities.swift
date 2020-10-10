//
//  DateTimeUtilities.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/10/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import Foundation

class DateTimeUtilities {
    func getClassTime(time : Date) -> String {
        var timeType: String = "AM"
        var hour: Int = (Calendar.current.component(.hour, from: time))
        let minute: Int = (Calendar.current.component(.minute, from: time))
        var aminute = (minute == 0) ? "00" : String(minute)
        aminute = ((minute < 10) && (minute >= 1)) ? "0" + String(minute) : String(aminute)
        timeType = hour >= 12 ? "PM" : "AM"
        hour = hour > 12 ? hour - 12 : hour
        return String(hour) + ":" + String(aminute) + " " + timeType
    }
}
