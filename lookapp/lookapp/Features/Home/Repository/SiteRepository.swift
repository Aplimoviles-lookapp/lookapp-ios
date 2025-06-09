import Foundation
import Combine

@MainActor
class SiteRepository: ObservableObject {
    static let shared = SiteRepository()
    
    @Published private(set) var sites: [SiteModel] = []
    @Published private(set) var siteServices: [String: [ServiceModel]] = [:]
    
    private init() {
        initializeData()
    }
    
    
    private func initializeData() {
        guard sites.isEmpty else { return }
        
        let initialSites = [
            SiteModel(id: "site_1",name: "Cortes Juana",address: "Calle 5 Pandiguando",numberPhone: "3105467890"),
            SiteModel(id: "site_2",name: "Shelly",address: "La esmeralda",numberPhone: "3105868870"),
            SiteModel(id: "site_3",name: "Peluqueria el Calvo",address: "Barrio Bolivar",numberPhone: "3115447680"),
            SiteModel(id: "site_4",name: "Peinados y mas",address: "Centro",numberPhone: "3125434890")
        ]
        
        sites = initialSites
        initializeSiteServices()
    }
    
    private func initializeSiteServices() {
        siteServices = [
            "site_1": [
                ServiceModel(id: "service_1", name: "Corte de Pelo", description: "Corte de pelo profesional"),
                ServiceModel(id: "service_2", name: "Peinados", description: "Peinados y alizados"),
                ServiceModel(id: "service_3", name: "Keratina", description: "Tratamiento de keratina")
            ],
            "site_2": [
                ServiceModel(id: "service_1", name: "Corte de Pelo", description: "Corte de pelo profesional"),
                ServiceModel(id: "service_4", name: "Manicure", description: "Diseño de uñas de múltiples colores"),
                ServiceModel(id: "service_5", name: "Pedicure", description: "Cuidado completo de pies"),
                ServiceModel(id: "service_7", name: "Diseño de Cejas", description: "Cejas hermosas")
            ],
            "site_3": [
                ServiceModel(id: "service_1", name: "Corte de Pelo", description: "Corte de pelo profesional"),
                ServiceModel(id: "service_6", name: "Mascarillas", description: "Mascarillas de todo tipo")
            ],
            "site_4": [
                ServiceModel(id: "service_1", name: "Corte de Pelo", description: "Corte de pelo profesional"),
                ServiceModel(id: "service_2", name: "Peinados", description: "Peinados y alizados"),
                ServiceModel(id: "service_4", name: "Manicure", description: "Diseño de uñas de múltiples colores"),
                ServiceModel(id: "service_7", name: "Diseño de Cejas", description: "Cejas hermosas")
            ]
        ]
    }
    
    
    func getAll() -> AnyPublisher<[SiteModel], Never> {
        $sites.eraseToAnyPublisher()
    }
    
    func getSiteById(_ id: String) -> SiteModel? {
        sites.first { $0.id == id }
    }
    
    func getSiteByName(_ name: String) -> SiteModel? {
        sites.first { $0.name == name }
    }
    
    func getServicesForSite(_ siteId: String) -> [ServiceModel] {
        siteServices[siteId] ?? []
    }
    
    func getServicesForSiteName(_ siteName: String) -> [String] {
        guard let site = getSiteByName(siteName) else { return [] }
        return getServicesForSite(site.id).map { $0.name }
    }
}
