//
//
//  FILE: LocationService.swift
//  AUTHOR: Can Sürmeli (c_surmeli@icloud.com - cansurmeli.com)
//  DESCRIPTION: How to use CLLocationManager as a singleton object with Swift. Modify according
//  to your needs.
//  SOURCE: https://github.com/cansurmeli/Singleton-CLLocationManager
//
//
//  IMPORTANT
//	  You MUST include one of the keys below in your Info.plist file with an appropiate description
//	according to the respected permission you've asked for. Otherwise CoreLocation won't function!
//
//	  - NSLocationWhenInUseUsageDescription - <your_description>
//	  - NSLocationAlwaysUsageDescription - <your_description>					(required by iBeacon usage)
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
  static let shared = LocationService()     // Swifty way of singleton :]

	// set the manager object right when it gets initialized
  private let manager: CLLocationManager = {
		$0.desiredAccuracy = kCLLocationAccuracyBestForNavigation
		$0.distanceFilter = 1
		$0.requestWhenInUseAuthorization()
								
		return $0
	}(CLLocationManager())
	
  private(set) var currentLocation: CLLocationCoordinate2D!
	private(set) var currentHeading: CLHeading!

  private override init() {
    super.init()

		// delegate MUST be set while initializing
    manager.delegate = self

    // updates MUST start here
    manager.startUpdatingLocation()
    manager.startUpdatingHeading()
  }

  // MARK: Location Updates
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    // If location data can be determined
    if let location = locations.last! as CLLocation! {
      currentLocation = location.coordinate
    }
  }

  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("Location Manager Error: \(error)")
  }

  // MARK: Heading Updates
  func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    currentHeading = newHeading
  }

  func locationManagerShouldDisplayHeadingCalibration(manager: CLLocationManager) -> Bool {
    return true
  }
}
