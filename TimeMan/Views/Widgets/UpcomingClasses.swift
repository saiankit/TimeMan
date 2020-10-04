//
//  UpcomingClasses.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/2/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct UpcomingClasses: View {
    var viewModel = UpcomingClassViewModel()
    @FetchRequest(entity: Course.entity(), sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]) var listForUpcoming: FetchedResults<Course>
    var body: some View {
        VStack{
            if(self.viewModel.getUpcomingClass(list: listForUpcoming).courseID == "E") {
                VStack{
                    Image(systemName: "snow").resizable().frame(width: 50, height: 50)
                    Text("No Upcoming Classes").font(.system(size: 22, weight: .bold, design: .rounded)).padding(.bottom, 5)
                    
                }
            }
            else{
                UpcomingCourseCard(course: self.viewModel.getUpcomingClass(list: listForUpcoming))
            }
        }
        .padding(20)
        
    }
}
