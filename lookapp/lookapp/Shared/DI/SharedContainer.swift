//
//  SharedContainer.swift
//  lookapp
//
//  Created by jojan on 9/06/25.
//

import Foundation
import FactoryKit

extension Container{
    var sessionManager: Factory<SessionManager>{
        self{
            SessionManager.shared
        }
        .singleton
    }
}

