//
//  GridScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

var timeline  = ["7:00","5:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00"]

struct GridScreen: View {
    var body: some View {
        if #available(iOS 14.0, *) {
            ScrollView{
            HStack(spacing: 20){
                Text(" ").frame(width: 30, height: 30)
                Text("M").frame(width: 30, height: 30)
                Text("T").frame(width: 30, height: 30)
                Text("W").frame(width: 30, height: 30)
                Text("T").frame(width: 30, height: 30)
                Text("F").frame(width: 30, height: 30)
                Text("S").frame(width: 30, height: 30)
            }
                RowForGrid(time: 7)
                RowForGrid(time: 8)
                RowForGrid(time: 9)
                RowForGrid(time: 10)
                
            }
    }
}

struct GridItem : View {
    var time : Int
    var weekDay : Int
    var viewModel = CourseViewModel()
    private func shouldCourseBeIncluded(course: Course, index: Int) -> Bool{
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if(converted!.contains(weekDayName)){
            return true
        }
        return false
    }
    @FetchRequest(entity: Course.entity(), sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]) var listForUpcoming: FetchedResults<Course>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    func getCourseForGrid(list: FetchedResults<Course>,time : Int, weekDay : Int) ->  [String]{
        
        let calendar = Calendar.current
        let listWork = list
        var upcomingCourse : Course = Course()
        let currentTime =  time * 60
        var count = 0
        for courseClass in listWork {
            if(shouldCourseBeIncluded(course: courseClass, index: weekDay)) {
                
                let courseTime = courseClass.time
                let courseHour = calendar.component(.hour, from: courseTime!)
                let courseMinute = calendar.component(.minute, from: courseTime!)
                let courTime = courseHour * 60 + courseMinute
                if(courTime >= currentTime) {
                    if(courTime < currentTime + 60) {
                        upcomingCourse = courseClass
                        count = count + 1
                    }
                }
            }
        }
        if(count == 0)
        {
            return ["Error"]
        }
        return [upcomingCourse.courseCode! , upcomingCourse.courseID! , String(upcomingCourse.colorNum) ]
    }
    
    var body: some View {
        if(getCourseForGrid(list: listForUpcoming, time: time, weekDay: weekDay)[0] == "Error")
        {
            VStack{
                Text("")
            }
            .frame(width: 30, height: 30)
            .padding(2)
            .background(Color.gray)
        }
        else{
        VStack{
            Text(getCourseForGrid(list: listForUpcoming, time: time, weekDay: weekDay)[0]).font(.system(size: 10))
            Text(getCourseForGrid(list: listForUpcoming, time: time, weekDay: weekDay)[1]).font(.system(size: 10))
        }
        .frame(width: 30, height: 30)
        .padding(2)
        .background(viewModel.colorNumbers[Int(getCourseForGrid(list: listForUpcoming, time: time, weekDay: weekDay)[2])!])
        .background(Color.orange)
        }
    }
}


struct Line : View{
    var body: some View {
        Rectangle()
            .fill(Color("Primary"))
            .frame(height: 2)
        
    }
}

struct RowForGrid : View{
    var time : Int
    
    var body: some View {
        VStack {
            Line()
            HStack(spacing: 20){
                Text(String(time) + ":00").font(.system(size: 10)).frame(width: 30, height: 30)
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
}
