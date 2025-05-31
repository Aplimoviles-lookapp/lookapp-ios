//
//  SavedItemView.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import SwiftUI

struct SavedItemView: View {
    let title: String
    let subtitle: String
    let imageUrl: String
    let onDelete: () -> Void

    var body: some View {
        HStack(spacing: 8) {
            // Circle with first letter of title
            ZStack {
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 40, height: 40)
                Text(String(title.prefix(1)).uppercased())
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            .padding(8)

            // Title and subtitle
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            // Right side: image and delete button
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: imageUrl))
                    .scaledToFit()
                    .frame(width: 64, height: 64)

                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .padding(6)
                        .background(Color(.systemBackground))
                        .clipShape(Circle())
                }
                .padding(6)
                .offset(x:10,y:-10)

            }
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color(.systemBackground))
            .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 1))
        .overlay(RoundedRectangle(cornerRadius: 12)
            .stroke(Color(.separator), lineWidth: 1))
    }
}


#Preview {
    SavedItemView(
        title: "Caroy Peluquería",
        subtitle: "Corte",
        imageUrl: "https://picsum.photos/64/64",
        onDelete: {}
    )
}
