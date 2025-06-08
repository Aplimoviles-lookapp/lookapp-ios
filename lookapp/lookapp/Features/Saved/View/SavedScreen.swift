import SwiftUI

struct SavedScreen: View {
    @StateObject private var viewModel = SavedItemsViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.savedItems, id: \.id) { item in
                        SavedItemView(
                            title: item.title,
                            subtitle: item.subtitle,
                            imageUrl: item.imageUrl,
                            onDelete: {
                                Task {
                                    await viewModel.deleteItem(id: item.id)
                                }
                            }
                        )
                        .listRowInsets(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}


#Preview {
    SavedScreen()
}


