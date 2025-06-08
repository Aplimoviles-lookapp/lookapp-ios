import Foundation
import Combine

@MainActor
class SavedRepository: ObservableObject {
    static let shared = SavedRepository()
    private let userAccountRepository = UserAccountRepository.shared
    
    private init() {}
    
    func getSavedItems(userId: Int64) -> AnyPublisher<[SavedItemModel], Never> {
        userAccountRepository.getAll()
            .map { users in
                users.first { $0.id == userId }?.savedItems ?? []
            }
            .eraseToAnyPublisher()
    }
    
    func deleteItem(userId: Int64, id: String) async {
        var currentList = await userAccountRepository.getCurrentUsers()
        if let index = currentList.firstIndex(where: { $0.id == userId }) {
            let user = currentList[index]
            let updatedItems = user.savedItems.filter { $0.id != id }
            currentList[index] = UserAccount(
                id: user.id,
                name: user.name,
                email: user.email,
                savedItems: updatedItems
            )
            await userAccountRepository.updateUsers(currentList)
        }
    }
}
