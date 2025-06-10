
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack(spacing: 8) {
            TabBar()
            Form()
            Spacer()
        }
    }
}

struct HomeScreenWithNavigation: View {
    var body: some View {
        NavigationView {
            VStack {
                HomeScreen()
            }
            //.navigationTitle("Home")
            //.navigationBarTitleDisplayMode(.inline)
        }
        //.safeAreaInset(edge: .bottom) {
            
            // BottomNavBar()
        //}
    }
}

#Preview("Home") {
    HomeScreen()
}

#Preview("HomeScreen with Navigation") {
    HomeScreenWithNavigation()
}
