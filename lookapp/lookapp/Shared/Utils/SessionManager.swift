//
//  SessionManager.swift
//  lookapp
//
//  Created by jojan on 8/06/25.
//

import Foundation
import Combine
@MainActor
class SessionManager: ObservableObject {
    static let shared = SessionManager()
    @Published private(set) var currentUserAccount: UserAccount?
    private init() {}
    func updateUserAccount(_ newUserAccount: UserAccount?) {
        currentUserAccount = newUserAccount
    }
}
