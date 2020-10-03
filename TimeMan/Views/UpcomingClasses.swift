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
            Text(self.viewModel.getUpcomingClass(list: listForUpcoming))
        }
        .padding(20)
        .background(Color("CoursesListBackground"))
        .cornerRadius(20)
    }
}
