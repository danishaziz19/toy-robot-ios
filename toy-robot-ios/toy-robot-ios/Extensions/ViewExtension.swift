//
//  ViewExtension.swift
//  toy-robot-ios
//
//  Created by Danish Aziz on 7/11/2025.
//

import SwiftUI

extension View {
    func smallBlackButtonStyle() -> some View {
        self.modifier(SmallBlackButton())
    }
}
