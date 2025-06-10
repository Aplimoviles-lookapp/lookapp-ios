//
//  NotificationRepository.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//

import Foundation

@MainActor
class NotificationRepository {
    func getNotificationsForCurrentUser() -> [AppNotification] {
        guard let user = SessionManager.shared.currentUserAccount else {
            return []
        }
        return user.notifications
    }
}

