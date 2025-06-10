//
//  NotificationViewModel.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//

import Foundation

@MainActor
final class NotificationViewModel: ObservableObject {
    @Published var recent: [AppNotification] = []
    @Published var old: [AppNotification] = []
    
    private let repository = NotificationRepository()
    
    init() {
        loadNotifications()
    }
    
    func loadNotifications() {
        let all = repository.getNotificationsForCurrentUser()
        
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        recent = all.filter { calendar.isDate($0.date, inSameDayAs: today) }
        old = all.filter { !calendar.isDate($0.date, inSameDayAs: today) }
    }
}

