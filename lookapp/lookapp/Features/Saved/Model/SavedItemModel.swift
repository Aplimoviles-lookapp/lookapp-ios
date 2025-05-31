//
//  SavedItemModel.swift
//  lookapp
//
//  Created by jojan on 30/05/25.
//

import Foundation

struct SavedItemModel: Identifiable {
    let id: String // Use itemId as the identifier
    let title: String
    let subtitle: String
    let imageUrl: String
}
