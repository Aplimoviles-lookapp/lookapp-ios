//
//  UserAccountItemList.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import Foundation
import SwiftUI

struct UserAccountItemListView: View {
    let list: [UserAccount]
    let onClickedAccount: (UserAccount?) -> Void

    var body: some View {
        VStack(spacing: 8) {
            ForEach(list) { account in
                UserAccountItemView(
                    name: account.name,
                    email: account.email,
                    onClick: {
                        onClickedAccount(account)
                    }
                )
            }
        }
    }
}


#Preview {
    UserAccountItemListView(
        list: [
            UserAccount(id: 0, name: "Juan", email: "juan@gmail.com"),
            UserAccount(id: 1, name: "Naren", email: "naren@gmail.com"),
            UserAccount(id: 2, name: "Freider", email: "freider@gmail.com")
        ],
        onClickedAccount: { _ in }
    )
}
