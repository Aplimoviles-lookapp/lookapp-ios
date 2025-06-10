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
            SavedItemModel(id: "item1", title: "Caroy Peluquería", subtitle: "Corte de cabello", imageUrl: "https://picsum.photos/64/64?random=1"),
            SavedItemModel(id: "item2", title: "Bella Salon", subtitle: "Manicure", imageUrl: "https://picsum.photos/64/64?random=2"),
            SavedItemModel(id: "item3", title: "Estética Glamour", subtitle: "Depilación láser", imageUrl: "https://picsum.photos/64/64?random=3"),
            SavedItemModel(id: "item4", title: "Barbería Zeus", subtitle: "Afeitado clásico", imageUrl: "https://picsum.photos/64/64?random=4"),
            SavedItemModel(id: "item5", title: "Nails Studio", subtitle: "Uñas acrílicas", imageUrl: "https://picsum.photos/64/64?random=5"),
            SavedItemModel(id: "item6", title: "Glow Spa", subtitle: "Limpieza facial", imageUrl: "https://picsum.photos/64/64?random=6"),
            SavedItemModel(id: "item7", title: "Hair Studio by Lina", subtitle: "Coloración capilar", imageUrl: "https://picsum.photos/64/64?random=7"),
            SavedItemModel(id: "item8", title: "Look Perfect", subtitle: "Maquillaje profesional", imageUrl: "https://picsum.photos/64/64?random=8"),
            SavedItemModel(id: "item9", title: "Masajes Armonía", subtitle: "Masaje relajante", imageUrl: "https://picsum.photos/64/64?random=9"),
            SavedItemModel(id: "item10", title: "Estilo Urbano", subtitle: "Peinado urbano", imageUrl: "https://picsum.photos/64/64?random=10")
        ]

        
        let initialItems2 = [
            SavedItemModel(id: "item3", title: "Estilo Hair", subtitle: "Tinte", imageUrl: "https://picsum.photos/64/64"),
            SavedItemModel(id: "item4", title: "Nail Art Studio", subtitle: "Pedicure", imageUrl: "https://picsum.photos/64/64"),
            SavedItemModel(id: "item5", title: "Glamour Spa", subtitle: "Maquillaje", imageUrl: "https://picsum.photos/64/64")
        ]
        
        let initialUsers = [
            UserAccount(id: 1, name: "Alice Smith", email: "alice@example.com", savedItems: initialItems1, notifications: [
                AppNotification(title: "Bienvenido a LookApp", message: "Gracias por instalar la aplicación.", date: Date()),
                AppNotification(title: "Tips de belleza", message: "Conoce los últimos trends en cortes de cabello para esta temporada.", date: Date()),
                AppNotification(title: "¿Sabías esto?", message: "Puedes guardar tus peluquerías favoritas.", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
            ]),
            UserAccount(id: 2, name: "Bob Jones", email: "bob@example.com", savedItems: initialItems2, notifications: [
                AppNotification(title: "Bienvenido a LookApp", message: "Gracias por instalar la aplicación.", date: Date()),
                AppNotification(title: "¿Sabías esto?", message: "Puedes guardar tus peluquerías favoritas.", date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
            ])
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
    
    func getCurrentUsers() async -> [UserAccount] {
        userAccounts
    }
    
    func updateUsers(_ users: [UserAccount]) async {
        userAccounts = users
    }
}
