
import SwiftUI

struct NavigationBarMenuMain: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        HStack {
            NavigationBarItem(
                title: "Agendar",
                isSelected: selectedIndex == 0,
                action: { selectedIndex = 0 }
            )
            
            NavigationBarItem(
                title: "Cola",
                isSelected: selectedIndex == 1,
                action: { selectedIndex = 1 }
            )
            
            NavigationBarItem(
                title: "Productos",
                isSelected: selectedIndex == 2,
                action: { selectedIndex = 2 }
            )
            
            NavigationBarItem(
                title: "Sitios",
                isSelected: selectedIndex == 3,
                action: { selectedIndex = 3 }
            )
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemGray5))
    }
}

struct NavigationBarItem: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .accentColor : .secondary)
                .frame(maxWidth: .infinity)
        }
    }
}

struct TabBar: View {
    @State private var selectedTabIndex = 0
    private let tabs = ["Agendar", "Cola", "Productos", "Sitios"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ForEach(0..<tabs.count, id: \.self) { index in
                    Button {
                        selectedTabIndex = index
                    } label: {
                        VStack(spacing: 8) {
                            Text(tabs[index])
                                .font(.system(size: 16, weight: selectedTabIndex == index ? .bold : .regular))
                                .foregroundColor(selectedTabIndex == index ? .accentColor : Color(.systemGray))
                            
                            Rectangle()
                                .fill(selectedTabIndex == index ? Color.accentColor : Color.clear)
                                .frame(height: 3)
                                .cornerRadius(1.5, corners: [.topLeft, .topRight])
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                    }
                }
            }
            .background(Color(.systemBackground))
            
            Divider()
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview("NavigationBarMenuMain") {
    NavigationBarMenuMain()
}

#Preview("TabBar") {
    TabBar()
}
