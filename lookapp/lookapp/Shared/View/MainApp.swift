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
                HomeView()
                    .tabItem {
                        Label(Tab.home.rawValue, systemImage: Tab.home.icon)
                    }
                    .tag(Tab.home)

                SearchView()
                    .tabItem {
                        Label(Tab.search.rawValue, systemImage: Tab.search.icon)
                    }
                    .tag(Tab.search)

                SavedView()
                    .tabItem {
                        Label(Tab.saved.rawValue, systemImage: Tab.saved.icon)
                    }
                    .tag(Tab.saved)

                NotificationsView()
                    .tabItem {
                        Label(Tab.notifications.rawValue, systemImage: Tab.notifications.icon)
                    }
                    .tag(Tab.notifications)
            }
            .navigationBarTitle(Text(selectedTab.rawValue), displayMode: .inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: CreditosView()) {
                        Image(systemName: "info")
                            .foregroundColor(.blue)
                    },
                trailing:
                    NavigationLink(destination: ProfileView()) {
                        Image(systemName: "person")
                            .foregroundColor(.blue)
                    }
            )
        }
    }
}

#Preview {
    MainApp()
}
