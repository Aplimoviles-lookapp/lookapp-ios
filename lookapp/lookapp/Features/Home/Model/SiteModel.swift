//
//  SiteModel.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//

import Foundation


struct SiteModel: Identifiable, Codable {
    let id: String
    let name: String
    let address: String
    let numberPhone: String
    
    init(
        id: String = UUID().uuidString,
        name: String,
        address: String,
        numberPhone: String
    ) {
        self.id = id
        self.name = name
        self.address = address
        self.numberPhone = numberPhone
    }
}
