//
//  FILE
//		LocationService.swift
//
//  AUTHOR
//		Can Sürmeli (c_surmeli@icloud.com - cansurmeli.com)
//
//  DESCRIPTION
//		How to use CLLocationManager as a singleton object with Swift. Modify according
//  to your needs.
//
//  SOURCE
//		https://github.com/cansurmeli/Singleton-CLLocationManager
//
//	APPLE DOC
//		https://developer.apple.com/documentation/corelocation/cllocationmanager
//
//
//
//  IMPORTANT
//	  You MUST include one of the keys below into your `Info.plist` file with an 
//	appropiate description string.
//		Otherwise CoreLocation won't function!!!
//
//	  - NSLocationWhenInUseUsageDescription - <your_description>
//	  - NSLocationAlwaysUsageDescription - <your_description>					(required by iBeacon usage)
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
	// Swifty way of creating a singleton
  static let shared = LocationService()

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

		// delegate MUST be set while initialization
    manager.delegate = self
  }
	
	// MARK: Control Mechanisms
	func startUpdatingLocation() {
		manager.startUpdatingLocation()
	}
	
	func stopUpdatingLocation() {
		manager.stopUpdatingLocation()
	}
	
	func startUpdatingHeading() {
		manager.startUpdatingHeading()
	}
	
	func stopUpdatingHeading() {
		manager.stopUpdatingHeading()
	}

  // MARK: Location Updates
	func locationManager(_ manager: CLLocationManager, 
											 didUpdateLocations locations: [CLLocation])
	{
    // If location data can be determined
		if let location = locations.last {
      currentLocation = location.coordinate
    }
  }

	func locationManager(_ manager: CLLocationManager, 
											 didFailWithError error: Error)
	{
    print("Location Manager Error: \(error)")
  }

  // MARK: Heading Updates
	func locationManager(_ manager: CLLocationManager, 
											 didUpdateHeading newHeading: CLHeading) 
	{
    currentHeading = newHeading
  }

	func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool {
    return true
  }
}
