//
//
//  Can Sürmeli (c_surmeli@icloud.com - cansurmeli.com)
//  LocationService.swift
//  How to use CLLocationManager as a singleton object with Swift.
//  https://github.com/cansurmeli/Singleton-CLLocationManager
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
  static let sharedInstance = LocationService()     // Swift way of singleton :]

  private var locationManager: CLLocationManager!
  private var currentLocation: CLLocationCoordinate2D!

  private override init() {
    super.init()

    locationManager = CLLocationManager()

    // iBeacons require always authorization!!! - modify according to your needs
    locationManager.requestAlwaysAuthorization()

    locationManager.delegate = self

    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.headingFilter = kCLHeadingFilterNone
    locationManager.distanceFilter = 1

    // updates MUST start here otherwise data state won't be intact!!!
    locationManager.startUpdatingLocation()
    locationManager.startUpdatingHeading()
  }

  // MARK: Control Methods
  func startUpdatingLocation() {
    locationManager.startUpdatingLocation()
    print("Location updates are started.")
  }

  func stopUpdatingLocation() {
    locationManager.stopUpdatingLocation()
    print("Location updates are stopped.")
  }

  func startUpdatingHeading() {
    locationManager.startUpdatingHeading()
    print("Compass updates are started.")
  }

  func stopUpdatingHeading() {
    locationManager.stopUpdatingHeading()
    print("Compass updates are stopped.")
  }

  // MARK: CoreLocation Location Updates
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    // If location data can be determined
    if let location = locations.last! as CLLocation! {
      currentLocation = location.coordinate
    }
  }

  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("Location Manager: \(error)")
  }

  // MARK: CoreLocation Heading Updates
  func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print(newHeading)
  }

  func locationManagerShouldDisplayHeadingCalibration(manager: CLLocationManager) -> Bool {
    return true
  }

  // MARK: Access Methods
  func getCurrentLocation() -> CLLocationCoordinate2D! {
    return currentLocation
  }

  func getCurrentDirection() -> StepDirection! {
    return currentDirection
  }
}
