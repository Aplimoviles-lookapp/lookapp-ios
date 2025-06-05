//
//  DummyScreen.swift
//  lookapp
//
//  Created by jojan on 5/06/25.
//

import Foundation
import SwiftUI

struct DummyScreen: View {
    let title: String

    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()

            Text(title)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}
