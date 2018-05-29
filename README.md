# Singleton-CLLocationManager
CoreLocation library of iOS provides various location specific information/operations such as determining the current location, current heading, interacting with iBeacons and etc. All of these functions of CoreLocation are controlled through a `CLLocationManager` object.

As location services are an expensive operation in terms of hardware resources, this manager object should only be created once and shared	in between the project. This can only be accomplished by a singleton object.

Swift is not just a language with a simpler syntax made solely to run on Apple hardware. At it's core, it offers flexibility and power. It’s supposed to be expressive that reading it should  be straightforward.

One example of Swift’s expressiveness is writing a singleton object. It’s easy to understand and maintain compared to Objective-C. Therefore, even though it’s possible to write a singleton object as before like in Objective-C, this approach, namely `Class Constant` is strongly suggested!

This code piece/class demonstration shows how to appropriately create a singleton object for `CLLocationManager` and customize it according to your needs with some best practices both for usage and readability in mind.

## Advantages
- ease of use
- separate from the AppDelegate
- only created once, so that the object is not duplicated: avoiding unnecessary battery consumption via otherwise multiple `CLLocationManager` instances separately using the hardware

## Requirements
- Xcode 8 or above
- Swift 3 or above
- Apple LLVM Compiler
- iOS 7 or above
- ARC

## Installation
Just copy the file `LocationService.swift’ into your project directory.

## Usage
Once the installation is complete, you should make a call to the `LocationService` class and start it accordingly. e.g.:

`LocationService.shared.startUpdatingLocation()`

For instance, the above will initiate the location updates and then anywhere in your project, with the following command, you can retrieve the location data:

`LocationService.shared.currentLocation`

Feel free to modify the class according to your needs.

Also, do keep in mind that location updates may take couple of seconds to retrieve so initially you may not be able to retrieve anything.

## Resources
- [THE RIGHT WAY TO WRITE A SINGLETON](http://krakendev.io/blog/the-right-way-to-write-a-singleton)
- [Stack OverFlow Question - Using a dispatch_once singleton model in Swift](http://stackoverflow.com/questions/24024549/using-a-dispatch-once-singleton-model-in-swift)

## Contact
- [E-Mail](mailto: c_surmeli@icloud.com)
- [GitHub](https://www.github/cansurmeli)
- [Twitter](https://www.twitter.com/cansurmeli)
- [Web Site](http://www.cansurmeli.com)
