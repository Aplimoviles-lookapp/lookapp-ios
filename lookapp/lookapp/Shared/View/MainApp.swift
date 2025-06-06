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
                DummyScreen(title: "Principal")
                    .tabItem {
                        Label(Tab.home.rawValue, systemImage: Tab.home.icon)
                    }
                    .tag(Tab.home)

                DummyScreen(title: "Buscar")
                    .tabItem {
                        Label(Tab.search.rawValue, systemImage: Tab.search.icon)
                    }
                    .tag(Tab.search)

                DummyScreen(title: "Guardados")
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
                    NavigationLink(destination: DummyScreen(title: "Profile")) {
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
