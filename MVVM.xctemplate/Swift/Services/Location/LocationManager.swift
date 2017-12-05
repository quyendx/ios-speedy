//
//  LocationManager.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  ___COPYRIGHT___
//

import CoreLocation

enum LocationRequestError: Error {
    case serviceNotEnabled
    case deniedOrRestricted
}

extension LocationRequestError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .serviceNotEnabled:
            return "Location service is not enabled"

        case .deniedOrRestricted:
            return "Location permission is denied or restricted"

        }
    }
}

class LocationManager: NSObject {
    static let manager = LocationManager()

    private var completion: ((_ location: CLLocation?, _ error: Error?) -> Void)?
    private lazy var locationManager: CLLocationManager = {
        [unowned self] in

        let manager = CLLocationManager()
        manager.delegate = self
        manager.distanceFilter = 500
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.pausesLocationUpdatesAutomatically = true

        return manager
    }()

    func requestUserLocation(completion: @escaping (_ location: CLLocation?, _ error: Error?) -> Void) {
        guard CLLocationManager.locationServicesEnabled() else {
            completion(nil, LocationRequestError.serviceNotEnabled)

            return
        }

        let authorizationStatus = CLLocationManager.authorizationStatus()
        switch authorizationStatus {
        case .denied, .restricted:
            completion(nil, LocationRequestError.deniedOrRestricted)

        case .authorizedWhenInUse:
            self.completion = completion
            locationManager.startUpdatingLocation()

        case .notDetermined:
            self.completion = completion
            locationManager.requestWhenInUseAuthorization()

        default:
            break
        }
    }

}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied, .restricted:
            completion?(nil, LocationRequestError.deniedOrRestricted)

        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()

        default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            manager.stopUpdatingLocation()

            completion?(location, nil)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completion?(nil, error)
    }
}
