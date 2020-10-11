//
//  ScrollScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct ScrollScreen: View {
    private let calendar = Calendar.current
    @Binding var isPresented: Bool
    @State var calendarIndex = ((Calendar.current.component(.weekday, from: Date())) - 1)

    var body: some View {
        if #available(iOS 14.0, *) {
            ZStack {
                ScrollView(showsIndicators: false) {
                    ZStack {
                        Color("PrimaryBackground")
                        VStack {
                            WeekScroll(index: $calendarIndex).padding(.top, 20)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(calendarIndex == (calendar.component(.weekday, from: Date()) - 1)
                                            ? "Today's Classes" : longWeekDaySymbols[calendarIndex]
                                            + "'s Classes")
                                        .font(
                                            .system(size: 20, weight: .bold, design: .rounded)
                                        )
                                        .padding(.bottom, 15)
                                    Spacer()
                                }
                                CoursesList(calendarIndex: $calendarIndex)
                                    .sheet(isPresented: $isPresented) {
                                        CourseInput(isPresented: $isPresented)
                                    }
                            }
                            .frame(minHeight: 800.0, alignment: .top)
                            .padding(25)
                            .background(Color("SecondaryBackground"))
                            .clipShape(CustomCorner(corners: [.topLeft, .topRight], size: 55))
                        }
                    }
                }
                FloatingActionButton(isPresented: $isPresented)
            }
        }
    }
}
