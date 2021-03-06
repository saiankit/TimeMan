//
//  HomeScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                ZStack {
                    Color("PrimaryBackground")
                    VStack(alignment: .leading) {
                        Spacer()
                        Image("Logo")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.leading)
                        Spacer()
                        Text("Upcoming Class")
                            .font(
                                .system(size: 22, weight: .bold, design: .rounded)
                            )
                            .padding(.bottom, 5)
                            .padding(.leading, 30)
                        UpcomingClasses()
                        Spacer()
                    }
                    .frame(width: 320.0, height: 500.0)
                    .background(
                        Color("SecondaryBackground")
                            .clipShape(CustomShapeHome())
                    )
                }
                .navigationTitle("TimeMan")
            } 
        }
    }
}
