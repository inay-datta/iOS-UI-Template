//
//  StatisticCard.swift
//  Sample Dashboard
//
//  Created by Phanishree Kommalapati on 17/05/24.
//

import Foundation
import SwiftUI


struct StatisticCard: View {
    let icon: String
    let value: String
    let label: String

    var body: some View {
        VStack {
            Image(icon)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(width: 15, height: 15)
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .frame(width: 100, height: 50)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: 150, height: 150)
    }
}
