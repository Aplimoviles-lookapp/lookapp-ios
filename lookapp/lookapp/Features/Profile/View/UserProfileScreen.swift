import SwiftUI

struct UserProfileScreen: View {
    @StateObject private var viewModel = UserProfileViewModel()
    @ObservedObject private var sessionManager = SessionManager.shared

    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 24) {
                    MyAccountSectionView(
                        userName: sessionManager.currentUserAccount?.name ?? "Anonymous",
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
            }
            .background(.background)
            
        }
    }
}


#Preview {
    UserProfileScreen()
}
