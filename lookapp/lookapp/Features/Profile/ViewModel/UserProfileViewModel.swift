//
//  UserProfileViewModel.swift
//  lookapp
//
//  Created by jojan on 8/06/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class UserProfileViewModel: ObservableObject {
    private let sessionManager = SessionManager.shared
    private let repository = UserAccountRepository.shared
    
    @Published var users: [UserAccount] = []
    
    // Predefined list of random user accounts (without savedItems)
    private let randomAccounts = [
        UserAccount(name: "John Doe", email: "john.doe@example.com", savedItems: [], notifications: []),
        UserAccount(name: "Jane Smith", email: "jane.smith@example.com", savedItems: [], notifications: []),
        UserAccount(name: "Alice Johnson", email: "alice.johnson@example.com", savedItems: [], notifications: []),
        UserAccount(name: "Bob Brown", email: "bob.brown@example.com", savedItems: [], notifications: [])
    ]
    
    var currentUser: UserAccount? {
        sessionManager.currentUserAccount
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        repository.getAll()
            .sink { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
    
    func addUserAccount() {
        Task {
            // Select a random user account and assign a unique ID
            var newUser = randomAccounts.randomElement() ?? UserAccount(name: "Default User", email: "default@example.com", savedItems: [])
            newUser.id = Int64(users.count + 1)
            await repository.insertUserAccount(newUser)
            //sessionManager.updateUserAccount(newUser)
        }
    }
    
    func signoutAllAccounts() {
        Task {
            await repository.deleteAll()
            sessionManager.updateUserAccount(nil)
        }
    }
    
    func getUserAccounts() -> AnyPublisher<[UserAccount], Never> {
        repository.getAll()
    }
    
    func updateUserAccount(_ userAccount: UserAccount?) {
        sessionManager.updateUserAccount(userAccount)
    }
}
