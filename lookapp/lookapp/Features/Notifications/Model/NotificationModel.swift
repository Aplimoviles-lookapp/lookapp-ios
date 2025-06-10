//
//  NotificationModel.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//

import Foundation

struct AppNotification: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let date: Date
}

