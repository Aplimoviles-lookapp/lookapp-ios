//
//  CreditItemView.swift
//  lookapp
//
//  Created by jojan on 10/06/25.
//

import SwiftUI

struct CreditItemView: View {
    let name: String
    let role: String

    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            Text(name)
                .fontWeight(.medium)

            Text(role)
                .font(.system(size: 12))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 4)
    }
}
