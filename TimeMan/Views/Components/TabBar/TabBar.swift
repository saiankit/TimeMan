//
//  TabBar.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab : String
    @Binding var isPresented: Bool
    var body: some View {
        
        HStack{
            
            TabButton(title: "Scroll", image: "lineweight", selectedTab: $selectedTab)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.isPresented.toggle()
            }) {
                
                Image(systemName: "plus")
                    .renderingMode(.original)
                    .padding(.vertical)
                    .padding(.horizontal,25)
                    .background(Color.orange)
                    .cornerRadius(15)
            }
            
            Spacer(minLength: 0)
            
            TabButton(title: "Grid", image: "calendar" ,selectedTab: $selectedTab)
            
        }
        .padding(.top)
        .padding(.horizontal,22)
        .padding(.bottom)
        .background(Color("CoursesListBackground"))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
    }
}


struct TabButton : View {
    
    var title : String
    var image : String
    @Binding var selectedTab : String
    
    var body: some View{
        
        Button(action: {selectedTab = title}) {
            
            HStack(spacing: 10){
                
                Image(systemName :image)
                    .renderingMode(.template)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == title ? .yellow : .gray)
            .padding(.vertical,10)
            .padding(.horizontal,15)
            .background(Color.yellow.opacity(selectedTab == title ? 0.15 : 0))
            .clipShape(Capsule())
        }
    }
}

struct CustomCorner : Shape {
    var corners : UIRectCorner
    var size : CGFloat
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: size, height: size))
        
        return Path(path.cgPath)
    }
}
