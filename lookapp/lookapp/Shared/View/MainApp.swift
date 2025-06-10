import SwiftUI

struct MainApp: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab: String {
        case home = "Principal"
        case search = "Buscar"
        case saved = "Guardados"
        case notifications = "Notificaciones"
        
        var icon: String {
            switch self {
            case .home: return "house"
            case .search: return "magnifyingglass"
            case .saved: return "heart"
            case .notifications: return "bell"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                HomeScreen()
                    .tabItem {
                        Label(Tab.home.rawValue, systemImage: Tab.home.icon)
                    }
                    .tag(Tab.home)
                
                DummyScreen(title: "Buscar")
                    .tabItem {
                        Label(Tab.search.rawValue, systemImage: Tab.search.icon)
                    }
                    .tag(Tab.search)
                
                SavedScreen()
                    .tabItem {
                        Label(Tab.saved.rawValue, systemImage: Tab.saved.icon)
                    }
                    .tag(Tab.saved)
                
                DummyScreen(title: "Notificaciones")
                    .tabItem {
                        Label(Tab.notifications.rawValue, systemImage: Tab.notifications.icon)
                    }
                    .tag(Tab.notifications)
            }
            .navigationBarTitle(Text(selectedTab.rawValue), displayMode: .inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: DummyScreen(title: "Creditos")) {
                        Image(systemName: "info")
                            .foregroundColor(.blue)
                    },
                trailing:
                    NavigationLink(destination: UserProfileScreen()) {
                        Image(systemName: "person")
                            .foregroundColor(.blue)
                    }
            )
            .toolbarBackground(.background.opacity(0.2), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

#Preview {
    MainApp()
}
