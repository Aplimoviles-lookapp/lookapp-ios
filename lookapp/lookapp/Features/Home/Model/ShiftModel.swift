import Foundation

// MARK: - ShiftModel
struct ShiftModel: Identifiable, Codable {
    var id: String
    let nameAndLastName: String
    let businessName: String
    let serviceName: String
    let date: String
    let time: String
    
    init(
        id: String = UUID().uuidString,
        nameAndLastName: String,
        businessName: String,
        serviceName: String,
        date: String,
        time: String
    ) {
        self.id = id
        self.nameAndLastName = nameAndLastName
        self.businessName = businessName
        self.serviceName = serviceName
        self.date = date
        self.time = time
    }
}





// MARK: - Extensions for SwiftUI
extension ShiftModel: Equatable {
    static func == (lhs: ShiftModel, rhs: ShiftModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension SiteModel: Equatable {
    static func == (lhs: SiteModel, rhs: SiteModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension ServiceModel: Equatable {
    static func == (lhs: ServiceModel, rhs: ServiceModel) -> Bool {
        lhs.id == rhs.id
    }
}
