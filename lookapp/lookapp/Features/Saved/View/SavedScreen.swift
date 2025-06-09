import SwiftUI

struct SavedScreen: View {
    @StateObject private var viewModel = SavedItemsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack (spacing: 8){
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
                        .padding(.horizontal,8)
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


