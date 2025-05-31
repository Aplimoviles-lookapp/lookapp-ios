//
//  AccountsSectionView.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import Foundation
import SwiftUI

struct AccountsSectionView: View {
    let accounts: [UserAccount]
    let onClickedAccount: (UserAccount?) -> Void
    let onClickedAddAccount: () -> Void
    let onClickedLoggoutAll: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text("Tus Cuentas")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            UserAccountItemListView(
                list: accounts,
                onClickedAccount: onClickedAccount
            )

            Spacer().frame(height: 40)

            Button(action: onClickedAddAccount) {
                HStack {
                    Image(systemName: "plus")
                        .foregroundColor(.secondary)
                    Text("Añadir otra cuenta")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .shadow(radius: 2)
            }
            .frame(width: 320)

            Button(action: onClickedLoggoutAll) {
                HStack {
                    Image(systemName: "arrow.backward.square")
                        .foregroundColor(.secondary)
                    Text("Cerrar todas las cuentas")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(16)
                .shadow(radius: 2)
            }
            .frame(width: 320)
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .padding(30)
    }
}


#Preview {
    AccountsSectionView(
        accounts: [
            UserAccount(id: 0, name: "Juan", email: "Juan@gmail.com"),
            UserAccount(id: 1, name: "Naren", email: "Naren@gmail.com"),
            UserAccount(id: 2, name: "Freider", email: "Freider@gmail.com")
        ],
        onClickedAccount: { _ in },
        onClickedAddAccount: {},
        onClickedLoggoutAll: {}
    )
}
