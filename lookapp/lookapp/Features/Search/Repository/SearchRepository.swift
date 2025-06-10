//
//  SearchRepository.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//


import Foundation
import MapKit

final class SearchRepository {
    func getNearbyPlaces() -> [PlaceModel] {
        return [
            PlaceModel(name: "Barbería El Corte Fino", coordinate: CLLocationCoordinate2D(latitude: 2.4451, longitude: -76.6065)),
            PlaceModel(name: "Peluquería Estilo Popayán", coordinate: CLLocationCoordinate2D(latitude: 2.4440, longitude: -76.6072)),
            PlaceModel(name: "Barber Shop Central", coordinate: CLLocationCoordinate2D(latitude: 2.4465, longitude: -76.6050))
        ]
    }
}
