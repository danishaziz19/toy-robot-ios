//
//  SmallBlackButton.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 7/11/2025.
//

import SwiftUI

struct SmallBlackButton: ViewModifier {
    var enabled: Bool = true
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(enabled ? Color.black : Color.gray)
            .foregroundColor(.white)
            .cornerRadius(8)
            .font(.system(size: 14))
    }
}
