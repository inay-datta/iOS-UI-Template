//
//  NavigationBarItem.swift
//  Sample Dashboard
//
//  Created by Phanishree Kommalapati on 17/05/24.
//

import Foundation
import SwiftUI

struct NavigationBarItem: View {
    let icon: String
    let title: String
    let isMiddleIcon: Bool

    var body: some View {
        VStack {
            Image(icon)
                .font(.title2)
                .scaleEffect(isMiddleIcon ? 1.2 : 1.0)
                .offset(y: isMiddleIcon ? -8 : 0)
                Text(title)
                .font(.caption)
        }
    }
}
