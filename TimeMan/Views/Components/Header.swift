//
//  Header.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/25/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct Header: View {
    var body: some View{
        HStack {
            VStack {
                HStack {
                    Text("TimeMan")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                HStack {
                    Text("Track your Timetable")
                        .font(.callout)
                        .fontWeight(.thin)
                }
                
            }.padding(.leading)
            Spacer()
        }
    }
}
