//
//  UpcomingClasses.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/2/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct UpcomingClasses: View {
    var upcomingClassViewModel = UpcomingClassViewModel()
    @FetchRequest(entity: Course.entity(), sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]) var listForUpcoming: FetchedResults<Course>
    var body: some View {
        VStack{
            if upcomingClassViewModel.getUpcomingClass(list: listForUpcoming).courseID == "E" {
                VStack{
                    Text("No Upcoming Classes")
                        .font(
                            .system(
                                size: 22,
                                weight: .bold,
                                design: .rounded
                            )
                        )
                        .padding(.bottom, 5)
                }
            }
            else {
                UpcomingCourseCard(course: upcomingClassViewModel.getUpcomingClass(list: listForUpcoming))
            }
        }
        .padding(20)
    }
}
