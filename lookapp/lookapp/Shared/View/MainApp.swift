import SwiftUI

struct MainApp: View {
    @State private var selectedTab: Tab = .home

    enum Tab: String, CaseIterable {
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
                ForEach(Tab.allCases, id: \.self) { tab in
                    DummyScreen(title: tab.rawValue)
                        .tabItem {
                            Label(tab.rawValue, systemImage: tab.icon)
                        }
                        .tag(tab)
                }
            }
            .navigationBarTitle(Text(selectedTab.rawValue), displayMode: .inline)
            .navigationBarItems(
                leading:
                    NavigationLink(destination: DummyScreen(title: "Creditos")) {
                        Image(systemName: "info").foregroundColor(.blue)
                    }
                    .padding(),
                trailing:
                    NavigationLink(destination: DummyScreen(title: "Profile")) {
                        Image(systemName: "person").foregroundColor(.blue)
                    }
                    .padding()
            )
        }
    }
}

#Preview {
    MainApp()
}
