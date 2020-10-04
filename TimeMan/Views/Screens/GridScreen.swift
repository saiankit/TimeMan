//
//  GridScreen.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

var timeline  = ["7:00","5:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00"]

struct GridScreen: View {
    
    var body: some View {
        if #available(iOS 14.0, *) {
            ScrollView{
            HStack(spacing: 50){
                Text("")
                Text("M")
                Text("T")
                Text("W")
                Text("T")
                Text("F")
                Text("S")
            }
                ForEach(0 ..< 13) {_ in
                RowForGrid()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridScreen()
           
           
    }
}

struct GridItem : View {
    var title : String
    var body: some View {
        VStack{
            Text("MATH").font(.system(size: 10))
            Text("F215").font(.system(size: 10))
            Text("L10").font(.system(size: 10))
        }
        .padding(2)
        .background(Color.orange).frame(width: 50, height: 50)
        
    }
}


struct Line : View{
    var body: some View {
        Rectangle()
            .fill(Color.black)
            .frame(height: 2)
        
    }
}

struct RowForGrid : View{
    var body: some View {
        VStack {
            Line()
            HStack{
                Text("7:00").font(.system(size: 10))
                GridItem(title: "ECE F215 L2")
                GridItem(title: "ECE F215 L2")
                GridItem(title: "ECE F215 L2")
                GridItem(title: "ECE F215 L2")
                GridItem(title: "ECE F215 L2")
                GridItem(title: "ECE F215 L2")
            }
        }.padding(.leading,2)
        .padding(.trailing,2)
    }
}
}
