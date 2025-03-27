//
//  LocationManager.swift
//  Gomu
//
//  Created by Asad on 27/03/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    private var locationManager = CLLocationManager()
    
    @Published var locations : [CLLocationCoordinate2D] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.locations.append(location.coordinate)
            self.locationManager.startUpdatingLocation()
        }
    }
    
}
