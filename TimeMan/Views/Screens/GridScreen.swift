//
//  GridScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI


struct GridWeekItem : View{
    var title : String
    var body: some View {
        VStack{
            Text(title).font(.system(size: 18, weight: .bold, design: .rounded))
        }
        .frame(width: width, height: height)
        .padding(2)
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


var height : CGFloat = 40
var width : CGFloat = 40
var spacing : CGFloat = 8

struct GridScreen: View {
    var body: some View {
        if #available(iOS 14.0, *) {
            VStack{
                GridWeekRow()
                ScrollView{
                    TimeGrid()
                    RowForGrid(time: 17)
                    RowForGrid(time: 18)
                    RowForGrid(time: 19)
                    
                }
            }
        }
    }
}

struct GridItem : View {
    var time : Int
    var weekDay : Int
    var viewModel = CourseViewModel()
    @FetchRequest(entity: Course.entity(), sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]) var listForUpcoming: FetchedResults<Course>
    @Environment(\.managedObjectContext) var managedObjectContext
    var gridViewModel = GridViewModel()
    var body: some View {
        if(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[0] == "Error")
        {
            VStack{
                Text("")
            }
            .frame(width: width, height: height)
            .padding(2)
            .background(Color("CoursesListBackground"))
        }
        else{
            VStack{
                Text(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[0]).font(.system(size: 10)).foregroundColor(.black)
                Text(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[1]).font(.system(size: 10)).foregroundColor(.black)
                Text(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[3]).font(.system(size: 10)).foregroundColor(.black)

            }
            .frame(width: width, height: height)
            .padding(2)
            .background(viewModel.colorNumbers[Int(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[2])!])
            .cornerRadius(5)
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

struct RowForGrid : View{
    var time : Int
    
    var body: some View {
        VStack {
            Line()
            HStack(spacing: spacing){
                Text(String(time) + ":00").font(.system(size: 10)).frame(width: width, height: height)
                GridItem(time: time, weekDay: 1)
                GridItem(time: time, weekDay: 2)
                GridItem(time: time, weekDay: 3)
                GridItem(time: time, weekDay: 4)
                GridItem(time: time, weekDay: 5)
                GridItem(time: time, weekDay: 6)
            }
        }
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

