//
//  PlaceModel.swift
//  lookapp
//
//  Created by Telematica on 9/06/25.
//
import Foundation
import MapKit

struct PlaceModel: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
