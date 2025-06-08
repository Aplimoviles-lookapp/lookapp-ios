//
//  SavedViewModel.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class SavedItemsViewModel: ObservableObject {
    @Published var savedItems: [SavedItemModel] = []

    private let savedRepository = SavedRepository.shared
    private let sessionManager = SessionManager.shared
    private var cancellables = Set<AnyCancellable>()

    init() {
        sessionManager.$currentUserAccount
            .compactMap { $0?.id } // Ignora nils
            .flatMap { [savedRepository] userId in
                savedRepository.getSavedItems(userId: userId)
            }
            .receive(on: RunLoop.main)
            .assign(to: &$savedItems)
    }

    func deleteItem(id: String) async {
        guard let userId = sessionManager.currentUserAccount?.id else { return }
        await savedRepository.deleteItem(userId: userId, id: id)
    }
}
