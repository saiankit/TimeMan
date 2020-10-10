//
//  CustomRoundedEdgesShape.swift
//  TimeMan
//
//  Created by Sai Ankit on 10/3/20.
//  Copyright © 2020 Sai Ankit. All rights reserved.
//

import SwiftUI

struct CustomCorner: Shape {
    var corners: UIRectCorner
    var size: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: size, height: size)
        )
        
        return Path(path.cgPath)
    }
}
