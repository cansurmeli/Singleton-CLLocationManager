# Singleton-CLLocationManager
Swift is not just a language with a simpler syntax made solely to run on Apple hardware. At it's core, it offers flexibility and power. It’s supposed to be expressive that reading it should  be straightforward.

One example of Swift’s expressiveness is writing a singleton object. It’s easy to understand and maintain compared to Objective-C. Therefore, even though it’s possible to write a singleton object as before like in Objective-C, this approach, namely `Class Constant` is strongly suggested.

If you’d like some more detailed explanation, I suggest you check out the resources section below.

## Requirements

- Xcode 6 or higher
- Swift 1.2 or above
- Apple LLVM Compiler
- iOS 6 or higher
- ARC

## Installation

Just copy the file `SingletonCoreLocation.swift’ into your project directory.

## Usage

Once the installation is complete, write the following expression to the place where you want the location updates to start.

`LocationService.sharedInstance`

It will initiate the class and start the location services.

Afterwards use the access or control methods to control the CLLocationManager.


## Resources

- [THE RIGHT WAY TO WRITE A SINGLETON](http://krakendev.io/blog/the-right-way-to-write-a-singleton)
- [Stack OverFlow Question - Using a dispatch_once singleton model in Swift](http://stackoverflow.com/questions/24024549/using-a-dispatch-once-singleton-model-in-swift)

## Contact

- [E-Mail](mailto: c_surmeli@icloud.com)
- [GitHub](https://www.github/cansurmeli)
- [Twitter](https://www.twitter.com/cansurmeli)
- [Web Site](http://www.cansurmeli.com)
