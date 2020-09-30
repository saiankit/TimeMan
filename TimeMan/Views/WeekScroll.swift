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
            HStack{
                   CalendarItem(isSelected: self.index == 1  ?true  :false,weekDay: "Mo").onTapGesture {
                        self.index = 1
                   }
                    CalendarItem(isSelected: self.index == 2 ?true  :false,weekDay: "Tu").onTapGesture {
                        self.index = 2
                    }
                    CalendarItem(isSelected: self.index == 3  ?true  :false,weekDay: "We").onTapGesture {
                        self.index = 3
                    }
                    CalendarItem(isSelected: self.index == 4  ?true  :false,weekDay: "Th").onTapGesture {
                        self.index = 4
                    }
                    CalendarItem(isSelected: self.index == 5  ?true  :false,weekDay: "Fr").onTapGesture {
                        self.index = 5
                    }
                    CalendarItem(isSelected: self.index == 6  ?true  :false,weekDay: "Sa").onTapGesture {
                        self.index = 6
                    }
                    CalendarItem(isSelected: self.index == 0  ?true  :false,weekDay: "Su").onTapGesture {
                        self.index = 0
                    }
            }.padding(.bottom,20)
            .padding([.leading,.trailing])
    }
}
