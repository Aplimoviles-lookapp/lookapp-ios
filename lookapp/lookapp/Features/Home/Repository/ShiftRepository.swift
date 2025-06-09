//
//  ShiftRepository.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//
import Foundation
import Combine

@MainActor
class ShiftRepository: ObservableObject {
    static let shared = ShiftRepository()
    
    @Published private(set) var shifts: [ShiftModel] = []
    
    private init() {}
    
    
    func insertShift(_ shift: ShiftModel) async {
        
        try? await Task.sleep(nanoseconds: 500_000_000)
        
        var newShift = shift
        newShift.id = generateId()
        shifts.append(newShift)
    }
    
    func getAll() -> AnyPublisher<[ShiftModel], Never> {
        $shifts.eraseToAnyPublisher()
    }
    
    func getShiftById(_ id: String) -> ShiftModel? {
        shifts.first { $0.id == id }
    }
    
    func deleteShift(_ id: String) async {
        shifts.removeAll { $0.id == id }
    }
    
    func updateShift(_ shift: ShiftModel) async {
        if let index = shifts.firstIndex(where: { $0.id == shift.id }) {
            shifts[index] = shift
        }
    }
    
    
    private func generateId() -> String {
        "shift_\(UUID().uuidString.prefix(8))"
    }
}
