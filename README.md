# RumbleStrip

[![CI Status](http://img.shields.io/travis/davidrothera/RumbleStrip.svg?style=flat)](https://travis-ci.org/davidrothera/RumbleStrip)
[![Version](https://img.shields.io/cocoapods/v/RumbleStrip.svg?style=flat)](http://cocoapods.org/pods/RumbleStrip)
[![License](https://img.shields.io/cocoapods/l/RumbleStrip.svg?style=flat)](http://cocoapods.org/pods/RumbleStrip)
[![Platform](https://img.shields.io/cocoapods/p/RumbleStrip.svg?style=flat)](http://cocoapods.org/pods/RumbleStrip)

RumbleStrip is a lightweight feedback tool which allows your users to 'Rage Shake' to give feedback.

## Usage

Once you have the pod installed, usage is very simple:

1. Import RumbleStrip in your AppDelegate

   ```obj-c
   #import <RumbleStrip/RumbleStrip.h>
   ```
2. Enable RumbleStrip

   ```obj-c
   - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
       [RumbleStrip enableRumble];
       return YES;
   }
   ```
   
Once you have RumbleStrip installed and enabled you can "shake" to device to initiate RumbleStrip.

At present it will show a dialog to the user asking if they would like to provide feedback, if they say yes they will be directed to an e-mail template with a screenshot and other diagnostic information attached.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

RumbleStrip doesn't have many requirements other than a couple of Apple provided libraries.

* iOS8 or higher - this is to support Frameworks (for Swift)
* MessageUI framework
* Audiotoolbox framework

## Installation

RumbleStrip is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RumbleStrip"
```

## Author

David Rothera, david.rothera@gmail.com

## License

RumbleStrip is available under the MIT license. See the LICENSE file for more info.
