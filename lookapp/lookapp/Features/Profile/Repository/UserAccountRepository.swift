import Foundation
import Combine

@MainActor
class UserAccountRepository: ObservableObject {
    static let shared = UserAccountRepository()
    
    @Published private(set) var userAccounts: [UserAccount] = []
    
    private init() {
        initializeData()
    }
    
    private func initializeData() {
        guard userAccounts.isEmpty else { return }
        
        let initialItems1 = [
            SavedItemModel(id: "item1", title: "Caroy Peluquería", subtitle: "Corte de cabello", imageUrl: "https://picsum.photos/64/64"),
            SavedItemModel(id: "item2", title: "Bella Salon", subtitle: "Manicure", imageUrl: "https://picsum.photos/64/64")
        ]
        
        let initialItems2 = [
            SavedItemModel(id: "item3", title: "Estilo Hair", subtitle: "Tinte", imageUrl: "https://picsum.photos/64/64"),
            SavedItemModel(id: "item4", title: "Nail Art Studio", subtitle: "Pedicure", imageUrl: "https://picsum.photos/64/64"),
            SavedItemModel(id: "item5", title: "Glamour Spa", subtitle: "Maquillaje", imageUrl: "https://picsum.photos/64/64")
        ]
        
        let initialUsers = [
            UserAccount(id: 1, name: "Alice Smith", email: "alice@example.com", savedItems: initialItems1),
            UserAccount(id: 2, name: "Bob Jones", email: "bob@example.com", savedItems: initialItems2)
        ]
        
        userAccounts = initialUsers
    }
    
    func insertUserAccount(_ userAccount: UserAccount) async {
        userAccounts.append(userAccount)
    }
    
    func getAll() -> AnyPublisher<[UserAccount], Never> {
        $userAccounts.eraseToAnyPublisher()
    }
    
    func deleteAll() async {
        userAccounts = []
    }
    
    func count() async -> Int {
        userAccounts.count
    }
}
