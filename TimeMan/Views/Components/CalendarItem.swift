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
    var symbol: String
    var body: some View{
        
        
        VStack {
            Image(systemName: self.symbol).foregroundColor(Color.black)
            Text(self.weekDay)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
        }
        .frame(width: 40, height: 60)
        .padding([.vertical],25)
        .padding([.horizontal],20)
            
            
        .background(isSelected ? Color(#colorLiteral(red: 0.7912799716, green: 1, blue: 0.8202505708, alpha: 1)) : Color.white)
        .cornerRadius(25)        }
    
    
}

struct CalendarItem_Previews: PreviewProvider {
    static var previews: some View {
        CalendarItem(isSelected: true, weekDay: "J", symbol: "star")
    }
}
