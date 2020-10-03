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
        ZStack {
            Color("Background")
            VStack {
                UpcomingClasses()
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
