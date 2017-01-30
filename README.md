# Singleton-CLLocationManager
CoreLocation library of iOS provides various location specific information/operations such as determining current location, current heading	and interacting with iBeacons. All of these functions of CoreLocation are controlled through a `CLLocationManager` object.

As location services are an expensive operation in terms of battery consumption, this manager object should only be created once and shared	in between the project. This can be accomplished by a singleton object.

Swift is not just a language with a simpler syntax made solely to run on Apple hardware. At it's core, it offers flexibility and power. It’s supposed to be expressive that reading it should  be straightforward.

One example of Swift’s expressiveness is writing a singleton object. It’s easy to understand and maintain compared to Objective-C. Therefore, even though it’s possible to write a singleton object as before like in Objective-C, this approach, namely `Class Constant` is strongly suggested.

This code piece/class demonstration shows how to appropriately create a singleton object for `CLLocationManager` and customise it according to your needs with some best practices both for usage and readability in mind.

## Advantages
- ease of use/accessibility to the object
- separate from AppDelegate
- only created once, so that the object is not duplicated: avoiding unnecessary battery consumption via otherwise multiple `CLLocationManager` instances separately using the location hardware

## Requirements
- Xcode 8 or above
- Swift 3 or above
- Apple LLVM Compiler
- iOS 7 or above
- ARC

## Installation
Just copy the file `LocationService.swift’ into your project directory.

## Usage
Once the installation is complete, you should make a call to the `LocationService` class’ `sharedInstance` variable. Like so:

`_ = LocationService.sharedInstance`

 write the following expression to the place where you want the location updates to start.



This will initiate the class and start the location services.

Afterwards use the control methods to control the various aspects `CLLocationManager` or access to it’s variables to retrieve the information you need.

If you’re not going to use every aspect of this `CLLocationManager` object, customise it according to your needs as this demonstration fully lays out every aspect.

## Resources
- [THE RIGHT WAY TO WRITE A SINGLETON](http://krakendev.io/blog/the-right-way-to-write-a-singleton)
- [Stack OverFlow Question - Using a dispatch_once singleton model in Swift](http://stackoverflow.com/questions/24024549/using-a-dispatch-once-singleton-model-in-swift)

## Contact
- [E-Mail](mailto: c_surmeli@icloud.com)
- [GitHub](https://www.github/cansurmeli)
- [Twitter](https://www.twitter.com/cansurmeli)
- [Web Site](http://www.cansurmeli.com)
