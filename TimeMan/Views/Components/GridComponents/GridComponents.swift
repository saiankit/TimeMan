//
//  GridComponents.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/4/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct GridWeekItem : View{
    var title : String
    var body: some View {
        VStack{
            Text(title)
                .font(
                    .system(
                        size: 18,
                        weight: .bold,
                        design: .rounded
                    )
                )
        }
        .frame(width: width, height: height)
        .padding(4)
    }
}

struct GridWeekRow : View{
    var body: some View {
        HStack(spacing: spacing){
            GridWeekItem(title: "")
            GridWeekItem(title: "M")
            GridWeekItem(title: "T")
            GridWeekItem(title: "W")
            GridWeekItem(title: "T")
            GridWeekItem(title: "F")
            GridWeekItem(title: "S")
        }
    }
}

struct Line : View{
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(height: 2)
        
    }
}

struct TimeGrid : View{
    var body: some View {
        VStack {
            RowForGrid(time: 7)
            RowForGrid(time: 8)
            RowForGrid(time: 9)
            RowForGrid(time: 10)
            RowForGrid(time: 11)
            RowForGrid(time: 12)
            RowForGrid(time: 13)
            RowForGrid(time: 14)
            RowForGrid(time: 15)
            RowForGrid(time: 16)
        }
    }
}

struct RowForGrid : View{
    var time : Int
    
    var body: some View {
        VStack {
            Line()
            HStack(spacing: spacing){
                VStack(alignment: .center){
                    Text(String(time) + ":00")
                        .font(.system(size: 13))
                }
                .frame(width: width, height: height)
                .padding(4)
                
                GridItem(time: time, weekDay: 1)
                GridItem(time: time, weekDay: 2)
                GridItem(time: time, weekDay: 3)
                GridItem(time: time, weekDay: 4)
                GridItem(time: time, weekDay: 5)
                GridItem(time: time, weekDay: 6)
            }
        }
        .padding(.leading,5)
        .padding(.trailing,5)
    }
}
