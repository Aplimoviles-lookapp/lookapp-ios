//
//  UserAccountItem.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import Foundation
import SwiftUI

struct UserAccountItemView: View {
    let name: String
    let email: String
    let onClick: () -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            // Initial Circle
            ZStack {
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 40, height: 40)

                Text(String(name.prefix(1)).uppercased())
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding(8)

            // Name and Email
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)

                Text(email)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding(8)

            Spacer()
        }
        .frame(width: 320)
        .background(Color(.systemBackground))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.separator), lineWidth: 1)
        )
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .contentShape(Rectangle()) // Extiende el área táctil
        .onTapGesture {
            onClick()
        }
    }
}


#Preview {
    UserAccountItemView(
        name: "Pepito Perez",
        email: "pepitoperez@gmail.com",
        onClick: {}
    )
}
