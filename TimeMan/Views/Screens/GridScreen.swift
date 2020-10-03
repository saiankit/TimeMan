//
//  GridScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct GridScreen: View {
    @State var calendarIndex = ((Calendar.current.component(.weekday, from: Date())) - 1)
    var body: some View {
        if #available(iOS 14.0, *) {
            
            VStack(alignment: .center) {
                Spacer()
                    HStack {
                        Text("Under Construction").font(.system(size: 22, weight: .bold, design: .rounded)).padding(.bottom, 5)
                    }
                Spacer()
                    
                }
        }
    }
}
