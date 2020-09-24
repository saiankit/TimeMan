//
//  CalendarItem.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/22/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI
struct CalendarItem: View{
    
    var isSelected: Bool
    var weekDay: String
    var body: some View{
        VStack {
            if(weekDaySymbols[(Calendar.current.component(.weekday, from: Date()) - 2)] == weekDay)
            {
                Circle().frame(width: 5, height: 5).foregroundColor(.red)}
            Text(self.weekDay)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
        }
        .frame(width: 40, height: 40)
        .padding([.vertical],20)
        .padding([.horizontal],15)
        .background(isSelected ? Color(#colorLiteral(red: 0.7912799716, green: 1, blue: 0.8202505708, alpha: 1)) : Color.white)
        .cornerRadius(25)
    }
}

struct CalendarItem_Previews: PreviewProvider {
    static var previews: some View {
        CalendarItem(isSelected: true, weekDay: "Wed")
    }
}