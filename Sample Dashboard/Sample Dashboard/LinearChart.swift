//
//  LinearChart.swift
//  Sample Dashboard
//
//  Created by Phanishree Kommalapati on 17/05/24.
//

import Foundation
import SwiftUI

struct LineChart: View {
    let data: [String: Int]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Path { path in
                    for (index, keyValue) in data.enumerated() {
                        let (hour, value) = keyValue
                        let xPosition = (geometry.size.width - 40) / CGFloat(data.count) * CGFloat(index + 1)
                        let yPosition = CGFloat((data.max { $0.value < $1.value }?.value ?? 0) - value) / CGFloat(data.max { $0.value < $1.value }?.value ?? 0) * (geometry.size.height - 20)
                        
                        if index == 0 {
                            path.move(to: CGPoint(x: xPosition, y: yPosition))
                        } else {
                            path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                        }
                    }
                }
                .stroke(Color.blue, lineWidth: 2)
            }
        }
    }
}
