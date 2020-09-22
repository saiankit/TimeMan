//
//  WeekScroll.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/22/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct WeekScroll: View {
    @Binding var index: Int
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 20) {
                CalendarItem(isSelected: self.index == 0  ?true  :false,weekDay: "Mon",symbol: "sun.max.fill").onTapGesture {
                    self.index = 0
                }
                
                CalendarItem(isSelected: self.index == 1  ?true  :false,weekDay: "Tue",symbol: "wind").onTapGesture {
                    self.index = 1
                }
                CalendarItem(isSelected: self.index == 2  ?true  :false,weekDay: "Wed",symbol: "tornado").onTapGesture {
                    self.index = 2
                }
                CalendarItem(isSelected: self.index == 3  ?true  :false,weekDay: "Thu",symbol: "hurricane").onTapGesture {
                    self.index = 3
                }
                CalendarItem(isSelected: self.index == 4  ?true  :false,weekDay: "Fri",symbol: "snow").onTapGesture {
                    self.index = 4
                }
                CalendarItem(isSelected: self.index == 5  ?true  :false,weekDay: "Sat",symbol: "sparkles").onTapGesture {
                    self.index = 5
                }
            }
        }.padding(.bottom,40)
            .padding(.leading)
    }
}
