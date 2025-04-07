//
//  LocationManager.swift
//  Gomu
//
//  Created by Asad on 27/03/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var coordinates : [CLLocationCoordinate2D] = []
    private var manager = CLLocationManager()
    private var elevations: [CLLocationDistance] = []
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.coordinates.append(location.coordinate)
            self.elevations.append(location.altitude)
        }
    }
    
    func startTracking() {
        print("Start")
        manager.startUpdatingLocation()
    }

    func stopTracking() {
        print("Paused")
        manager.stopUpdatingLocation()
    }
    
    func calculateTotalDistance() -> Double {
        
        guard coordinates.count > 1 else { return 0 }

        var totalDistance: Double = 0

        for i in 1..<coordinates.count {
            let start = CLLocation(latitude: coordinates[i - 1].latitude,
                                   longitude: coordinates[i - 1].longitude)
            let end = CLLocation(latitude: coordinates[i].latitude,
                                 longitude: coordinates[i].longitude)

            let distance = start.distance(from: end) // dalam meter
            totalDistance += distance
        }

        return totalDistance / 1000 // kilometer
    }
    
    func calculateElevationGain() -> Double {
        guard elevations.count > 1 else { return 0 }

        var totalGain: Double = 0

        for i in 1..<coordinates.count {
            let prev = elevations[i - 1]
            let curr = elevations[i]
            let gain = curr - prev
            if gain > 0 {
                totalGain += gain
            }
        }

        return totalGain // meter
    }

    
}
