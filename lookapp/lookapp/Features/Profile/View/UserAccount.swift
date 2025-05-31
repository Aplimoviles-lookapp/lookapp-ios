//
//  UserAccount.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import Foundation


struct UserAccount: Identifiable {
    var id: Int64 = 0
    let name: String
    let email: String
    
    init(id: Int64 = 0, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
