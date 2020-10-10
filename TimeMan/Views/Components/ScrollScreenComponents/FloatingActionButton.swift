//
//  FloatingActionButton.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/4/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct FloatingActionButton : View {
    @Binding var isPresented : Bool
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 50, height: 45)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                }
                .background(Color("CourseCardSecondaryAccent"))
                .cornerRadius(25)
                .padding()
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
        }
    }
}
