//
//  SmallBlackButton.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 7/11/2025.
//

import SwiftUI

struct SmallBlackButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
            .font(.system(size: 14))
    }
}
