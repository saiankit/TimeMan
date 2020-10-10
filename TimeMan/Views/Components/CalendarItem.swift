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
            Text(self.weekDay)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
        }
        .frame(width: 30 , height: 30)
        .padding(6)
        .background(isSelected ? Color(#colorLiteral(red: 0.7912799716, green: 1, blue: 0.8202505708, alpha: 1)) : Color("CalendarItemBackground"))
        .cornerRadius(15)
    }
}
