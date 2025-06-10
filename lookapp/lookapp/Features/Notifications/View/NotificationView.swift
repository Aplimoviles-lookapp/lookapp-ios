//
//  NotificationView.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var viewModel = NotificationViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if !viewModel.recent.isEmpty {
                    Text("Recientes")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ForEach(viewModel.recent) { notif in
                        NotificationCard(notification: notif)
                    }
                }
                
                if !viewModel.old.isEmpty {
                    Text("Antiguas")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    ForEach(viewModel.old) { notif in
                        NotificationCard(notification: notif)
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct NotificationCard: View {
    let notification: AppNotification
    
    var body: some View {
        HStack(alignment: .top) {
            Circle()
                .fill(Color.purple.opacity(0.2))
                .frame(width: 36, height: 36)
                .overlay(Text("L").font(.headline).foregroundColor(.purple))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(notification.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                Text(notification.message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(formattedDate(notification.date))
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(8)
            .background(Color.purple.opacity(0.05))
            .cornerRadius(8)
        }
        .padding(.horizontal)
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy h:mm a"
        return formatter.string(from: date)
    }
}

