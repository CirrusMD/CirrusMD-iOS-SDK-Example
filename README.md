# CirrusMDSDK

[![CI Status](http://img.shields.io/travis/steam/CirrusMDSDK.svg?style=flat)](https://travis-ci.org/steam/CirrusMDSDK)
[![Version](https://img.shields.io/cocoapods/v/CirrusMDSDK.svg?style=flat)](http://cocoapods.org/pods/CirrusMDSDK)
[![License](https://img.shields.io/cocoapods/l/CirrusMDSDK.svg?style=flat)](http://cocoapods.org/pods/CirrusMDSDK)
[![Platform](https://img.shields.io/cocoapods/p/CirrusMDSDK.svg?style=flat)](http://cocoapods.org/pods/CirrusMDSDK)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.0+
- CirrusMDSDK works in both Swift and Objective-C projects

## Installation

The CirrusMDSDK installs as a prebuilt framework, `CirrusMDSDK.framework`.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CirrusMDSDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'CirrusMDSDK'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate CirrusMDSDK into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "CirrusMDSDK/CirrusMD-iOS-SDK-Example"
```

Run `carthage update` to build the framework and drag the built `CirrusMDSDK.framework` into your Xcode project.

Follow the instructions found on [Carthage](https://github.com/Carthage/Carthage) to add both an Input File and Output File in your Build Phase for Carthage.

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate CirrusMDSDK into your project manually.

#### NEED TO DOCUMENT THE STEPS FOR INTEGRATING IT MANUALLY HERE

## Author

CirrusMD

## License

CirrusMD-iOS-SDK-Example is available under the MIT license. See the LICENSE file for more info.

CirrusMDSDK is available under the XXXX license. See the LICENSE file for more info.
