//
//  HomeScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var isPresented : Bool
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                ZStack {
                    Color("Background")
                    VStack {
                        UpcomingClasses()
                    }
                    .frame(width: 300.0, height: 500.0)
                    .background(
                        Color("CoursesListBackground")
                            .clipShape(CustomShape())
                    )
                }.navigationTitle("Upcoming Classes")
            } 
    }
    }
}
