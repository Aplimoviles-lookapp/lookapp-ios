//
//  MyAccountSectionView.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import Foundation
import SwiftUI

struct MyAccountSectionView: View {
    let userName: String
    let onEdit: () -> Void
    let onManageClick: () -> Void

    var body: some View {
        VStack(alignment: .center) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: "https://picsum.photos/120"))
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())

                Button(action: onEdit) {
                    Image(systemName: "pencil")
                        .foregroundColor(.blue)
                        .frame(width: 24, height: 24)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                        .shadow(radius: 2)
                }
                .frame(width: 40, height: 40)
            }
            .padding(16)

            Text("¡Hola, \(userName)!")
                .font(.largeTitle)
                .foregroundColor(.primary)
                .padding(.top, 8)

            Spacer().frame(height: 20)

            Button(action: onManageClick) {
                HStack {
                    Image(systemName: "checkmark")
                        .padding(2)
                        .foregroundColor(.secondary)

                    Spacer().frame(width: 8)

                    Text("Administra tu cuenta")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .frame(width: 220)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.separator), lineWidth: 1)
                )
            }
        }
        .frame(maxWidth: .infinity)
    }
}


#Preview {
    MyAccountSectionView(
        userName: "Pepito Perez",
        onEdit: {},
        onManageClick: {}
    )
}
