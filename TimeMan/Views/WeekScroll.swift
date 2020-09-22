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
                
               CalendarItem(isSelected: self.index == 0  ?true  :false,weekDay: "Mon").onTapGesture {
                                                   self.index = 0
                                               }
             
                
                CalendarItem(isSelected: self.index == 1 ?true  :false,weekDay: "Tue").onTapGesture {
                    self.index = 1
                }
                CalendarItem(isSelected: self.index == 2  ?true  :false,weekDay: "Wed").onTapGesture {
                    self.index = 2
                }
                CalendarItem(isSelected: self.index == 3  ?true  :false,weekDay: "Thu").onTapGesture {
                    self.index = 3
                }
                CalendarItem(isSelected: self.index == 4  ?true  :false,weekDay: "Fri").onTapGesture {
                    self.index = 4
                }
                CalendarItem(isSelected: self.index == 5  ?true  :false,weekDay: "Sat").onTapGesture {
                    self.index = 5
                }
            }
        }.padding(.bottom,40)
            .padding(.leading)
    }
}

struct WeekScroll_Previews: PreviewProvider {
    static var previews: some View {
       Text("Hi")
    }
}
