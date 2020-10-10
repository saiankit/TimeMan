//
//  GridScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

var height : CGFloat = 40
var width : CGFloat = 40
var spacing : CGFloat = 8

struct GridScreen: View {
    @Binding var isPresented : Bool
    var body: some View {
        if #available(iOS 14.0, *) {
            ZStack{
            VStack{
                GridWeekRow().sheet(isPresented: $isPresented){
                    CourseInput(isPresented: $isPresented)
                }
                ScrollView{
                    TimeGrid()
                    RowForGrid(time: 17)
                    RowForGrid(time: 18)
                    RowForGrid(time: 19)
                    
                }
            }
                FloatingActionButton(isPresented: $isPresented)
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
        if self.gridViewModel.getCourseForGrid(
            list: listForUpcoming,
            gridTime: time,
            weekDay: weekDay
        )[0] == "Error" {
            VStack{
                Text("")
            }
            .frame(width: width, height: height)
            .padding(4)
            .background(Color("CoursesListBackground"))
        } else {
            VStack{
                Text(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[0])
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                Text(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[1])
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                Text(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[3])
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                
            }
            .frame(width: width, height: height)
            .padding(4)
            .background(viewModel.colorNumbers[Int(self.gridViewModel.getCourseForGrid(list: listForUpcoming, gridTime: time, weekDay: weekDay)[2])!])
            .cornerRadius(5)
        }
    }
}
