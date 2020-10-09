//
//  ContentView.swift
//  TimeMan
//
//  Created by Sai Ankit on 9/21/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    @State var isPresented = false
    @State var selectedIndex = ""
    var body: some View {
        VStack {
            if(selectedIndex == "Scroll") {
                ScrollScreen(isPresented: $isPresented)
            } else if(selectedIndex == "") {
                HomeScreen()
            } else {
                GridScreen(isPresented: $isPresented)
            }
            TabBar(selectedTab: $selectedIndex, isPresented: $isPresented)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
