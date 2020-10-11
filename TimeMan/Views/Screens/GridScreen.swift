//
//  GridScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct GridScreen: View {
    @Binding var isPresented: Bool
    var body: some View {
        if #available(iOS 14.0, *) {
            ZStack {
            VStack {
                GridWeekRow().sheet(isPresented: $isPresented) {
                    CourseInput(isPresented: $isPresented)
                }
                ScrollView {
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

struct GridItem: View {
    var time: Int
    var weekDay: Int
    @FetchRequest(
        entity: Course.entity(),
        sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]
    ) var coursesList: FetchedResults<Course>
    var viewModel = GridViewModel()
    var body: some View {
        if viewModel.getCourseForGrid(
            list: coursesList,
            gridTime: time,
            weekDay: weekDay
        )[0] == "Error" {
            VStack {
                Text("")
            }
            .frame(width: GridValues.width, height: GridValues.height)
            .padding(4)
            .background(Color("SecondaryBackground"))
        } else {
            VStack {
                Text(viewModel.getCourseForGrid(list: coursesList, gridTime: time, weekDay: weekDay)[0])
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                Text(viewModel.getCourseForGrid(list: coursesList, gridTime: time, weekDay: weekDay)[1])
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                Text(viewModel.getCourseForGrid(list: coursesList, gridTime: time, weekDay: weekDay)[3])
                    .font(.system(size: 12))
                    .foregroundColor(.black)
            }
            .frame(width: GridValues.width, height: GridValues.height)
            .padding(4)
            .background(
                viewModel.gridBackground(list: coursesList, gridTime: time, weekDay: weekDay)
            )
            .cornerRadius(5)
        }
    }
}
