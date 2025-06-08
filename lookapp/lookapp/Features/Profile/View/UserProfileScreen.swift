import SwiftUI

struct UserProfileScreen: View {
    @StateObject private var viewModel = UserProfileViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                MyAccountSectionView(
                    userName: viewModel.currentUser?.name ?? "Anonymous",
                    onEdit: {
                        // Placeholder for edit action (not implemented in Kotlin code)
                        print("Edit profile tapped")
                    },
                    onManageClick: {
                        // Placeholder for manage account action
                        print("Manage account tapped")
                    }
                )
                
                AccountsSectionView(
                    accounts: viewModel.users,
                    onClickedAccount: { userAccount in
                        viewModel.updateUserAccount(userAccount)
                    },
                    onClickedAddAccount: {
                        Task {
                            await viewModel.addUserAccount()
                        }
                    },
                    onClickedLoggoutAll: {
                        viewModel.signoutAllAccounts()
                    }
                )
            }
            .background(.background)
            
        }
    }
}


#Preview {
    UserProfileScreen()
}
