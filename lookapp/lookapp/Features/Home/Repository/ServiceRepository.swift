//
//  ServiceRepository.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//

import Foundation
import Combine

@MainActor
class ServiceRepository: ObservableObject {
    static let shared = ServiceRepository()
    
    @Published private(set) var services: [ServiceModel] = []
    
    private init() {
        initializeData()
    }
    
    // MARK: - Initialization
    
    private func initializeData() {
        guard services.isEmpty else { return }
        
        let initialServices = [
            ServiceModel(
                id: "service_1",
                name: "Corte de Pelo",
                description: "Corte de pelo profesional"
            ),
            ServiceModel(
                id: "service_2",
                name: "Peinados",
                description: "Peinados y alizados"
            ),
            ServiceModel(
                id: "service_3",
                name: "Keratina",
                description: "Tratamiento de keratina"
            ),
            ServiceModel(
                id: "service_4",
                name: "Manicure",
                description: "Diseño de uñas de múltiples colores"
            ),
            ServiceModel(
                id: "service_5",
                name: "Pedicure",
                description: "Cuidado completo de pies"
            ),
            ServiceModel(
                id: "service_6",
                name: "Mascarillas",
                description: "Mascarillas de todo tipo"
            ),
            ServiceModel(
                id: "service_7",
                name: "Diseño de Cejas",
                description: "Cejas hermosas"
            )
        ]
        
        services = initialServices
    }
    
    // MARK: - Public Methods
    
    func getAll() -> AnyPublisher<[ServiceModel], Never> {
        $services.eraseToAnyPublisher()
    }
    
    func getServiceById(_ id: String) -> ServiceModel? {
        services.first { $0.id == id }
    }
    
    func getServiceByName(_ name: String) -> ServiceModel? {
        services.first { $0.name == name }
    }
    
    func searchServices(query: String) -> [ServiceModel] {
        guard !query.isEmpty else { return services }
        
        return services.filter { service in
            service.name.localizedCaseInsensitiveContains(query) ||
            service.description.localizedCaseInsensitiveContains(query)
        }
    }
}
