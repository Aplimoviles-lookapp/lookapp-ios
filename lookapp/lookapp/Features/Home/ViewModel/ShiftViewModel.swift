import Foundation
import Combine
import SwiftUI

@MainActor
class ShiftViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var shiftUiState = ShiftUiState()
    @Published var sitios: [SiteModel] = []
    @Published var servicios: [String] = []
    @Published var showConfirmationDialog = false
    
    // MARK: - Dependencies
    private let shiftRepository = ShiftRepository.shared
    private let siteRepository = SiteRepository.shared
    private let serviceRepository = ServiceRepository.shared
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init() {
        setupSubscriptions()
        getSitios()
    }
    
    // MARK: - Setup
    private func setupSubscriptions() {
        // Observar cambios en sitios
        siteRepository.getAll()
            .receive(on: RunLoop.main)
            .sink { [weak self] sites in
                self?.sitios = sites
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Public Methods
    
    func getSitios() {
        // Los sitios se actualizan automáticamente a través del subscription
    }
    
    func onSelectNegocio(_ nombreNegocio: String) {
        shiftUiState.shiftDetails.negocio = nombreNegocio
        shiftUiState.shiftDetails.servicio = "" // Reset servicio
        
        // Obtener servicios para el negocio seleccionado
        servicios = siteRepository.getServicesForSiteName(nombreNegocio)
    }
    
    func onSelectServicio(_ nombreServicio: String) {
        shiftUiState.shiftDetails.servicio = nombreServicio
    }
    
    func insertShift() {
        Task {
            let shiftModel = shiftUiState.shiftDetails.toShiftModel()
            await shiftRepository.insertShift(shiftModel)
        }
    }
    
    func updateNombre(_ nombre: String) {
        shiftUiState.shiftDetails.nombre = nombre
    }
    
    func updateServicio(_ servicio: String) {
        shiftUiState.shiftDetails.servicio = servicio
    }
    
    func updateNegocio(_ negocio: String) {
        shiftUiState.shiftDetails.negocio = negocio
    }
    
    func updateFecha(_ fecha: Date) {
        shiftUiState.shiftDetails.fecha = fecha
    }
    
    func updateHorario(_ horario: String) {
        shiftUiState.shiftDetails.horario = horario
    }
    
    func clearForm() {
        shiftUiState.shiftDetails = ShiftDetails()
        servicios = []
    }
    
    func showDialog() {
        showConfirmationDialog = true
    }
    
    func dismissDialog() {
        showConfirmationDialog = false
    }
}

// MARK: - Data Models

struct ShiftUiState {
    var shiftDetails = ShiftDetails()
    var isEntryValid: Bool {
        !shiftDetails.nombre.isEmpty &&
        !shiftDetails.negocio.isEmpty &&
        !shiftDetails.servicio.isEmpty &&
        shiftDetails.fecha != nil &&
        !shiftDetails.horario.isEmpty
    }
}

struct ShiftDetails {
    var nombre: String = ""
    var servicio: String = ""
    var negocio: String = ""
    var fecha: Date? = nil
    var horario: String = ""
}

// MARK: - Extensions

extension ShiftDetails {
    func toShiftModel() -> ShiftModel {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        return ShiftModel(
            id: "", // Se generará en el repository
            nameAndLastName: nombre,
            businessName: negocio,
            serviceName: servicio,
            date: fecha?.formatted(date: .abbreviated, time: .omitted) ?? "",
            time: horario
        )
    }
}

extension ShiftModel {
    func toShiftUiState(isEntryValid: Bool = false) -> ShiftUiState {
        return ShiftUiState(
            shiftDetails: self.toShiftDetails()
        )
    }
    
    func toShiftDetails() -> ShiftDetails {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let parsedDate = dateFormatter.date(from: self.date)
        
        return ShiftDetails(
            nombre: nameAndLastName,
            servicio: serviceName,
            negocio: businessName,
            fecha: parsedDate,
            horario: time
        )
    }
}
