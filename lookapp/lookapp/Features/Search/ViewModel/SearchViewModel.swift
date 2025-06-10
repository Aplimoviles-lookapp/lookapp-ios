import Foundation
import MapKit

final class SearchViewModel: ObservableObject {
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 2.4456, longitude: -76.6069),
        span: MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
    )
    
    @Published var places: [PlaceModel] = []
    
    private let repository = SearchRepository()
    
    init() {
        loadPlaces()
    }
    
    func loadPlaces() {
        self.places = repository.getNearbyPlaces()
    }
    
    func zoomIn() {
        let newLatitudeDelta = max(region.span.latitudeDelta / 2, 0.002)
        let newLongitudeDelta = max(region.span.longitudeDelta / 2, 0.002)
        region.span = MKCoordinateSpan(latitudeDelta: newLatitudeDelta, longitudeDelta: newLongitudeDelta)
    }
    
    func zoomOut() {
        let newLatitudeDelta = min(region.span.latitudeDelta * 2, 1.0)
        let newLongitudeDelta = min(region.span.longitudeDelta * 2, 1.0)
        region.span = MKCoordinateSpan(latitudeDelta: newLatitudeDelta, longitudeDelta: newLongitudeDelta)
    }
}


