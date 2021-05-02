//
//  Diamond.swift
//  Memorize
//
//  Created by Alan on 2.5.2021.
//

import SwiftUI

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.midX, y:rect.minY)
        let left = CGPoint(x: rect.minX, y:rect.midY)
        let bottom = CGPoint(x: rect.midX, y:rect.maxY)
        let right = CGPoint(x: rect.maxX, y:rect.midY)
        
        var p = Path()
        p.move(to: top)
        p.addLines([left, bottom, right,  top])
        
        return p
    }
    
    
}
