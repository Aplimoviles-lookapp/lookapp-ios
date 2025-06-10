//
//  Credits.swift
//  lookapp
//
//  Created by jojan on 10/06/25.
//

import Foundation
import SwiftUI

struct Credits: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                Text("""
                LOOKAPP es una aplicación la cual los usuarios van a poder realizar la separación de turno para peluquería o salón de belleza, además permitirá visualizar tipos de peinados, cortes de pelo, también el tipo y diseño de uñas de manos y pies. La aplicación también notificará promociones de artículos o de servicios y permitirá ver los lugares cercanos en un mapa
                """)
                .multilineTextAlignment(.leading)
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.bottom, 8)

                Spacer().frame(height: 32)

                Text("Esta app fue desarrollada por:")
                    .font(.title3.weight(.semibold))
                    .padding(.bottom, 8)

                CreditItemView(name: "Jojan Serna", role: "Developer")
                CreditItemView(name: "Freider Escobar", role: "Developer")
                CreditItemView(name: "Brayan Majin", role: "Developer")

                Spacer().frame(height: 32)

                Text("App Version: 1.0.0")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            .padding(16)
        }
    }
}

#Preview{
    Credits()
}
