# CirrusMDSDK

CirrusMDSK it an embeddable SDK. It enables customers of CirrusMD to provide the CirrusMD patient chat experience in their own applications.

## Example Application

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.0+
- CirrusMDSDK works in both Swift and Objective-C projects
- `Build Settings > Build Options > Always Embed Swift Standard Libraries` must be set to `Yes`

![embed-swift](https://user-images.githubusercontent.com/12459/33527866-2c576554-d815-11e7-8e58-794d61422289.png)

## Installing CirrusMDSDK in your own project

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

## Usage

1. Ensure your backend API service retrieves a valid token via CirrusMD's SSO API. TODO: Add the correct documentation for JWT retrieval here.
*** **_Do not cache CirrusMD provided JWTs_** ***

2. Initialize the SDK with the valid token and secret. This is your opportunity to verify that the token and secret provided to the SDK are able to load a patient.

#### Swift

```swift
/*
    The completion closure is retained throughout the life of the SDK. It is called with
    `CirrusMDSDKSessionResult.success` one time after the token is set if successful.

    The completion closure is called with `CirrusMDSDKSessionResult.invalidToken` or
    `CirrusMDSDKSessionResult.serviceUnavailable` every time the status changes to invalid
    or unavailable.
*/

CirrusMDSDKSession.singleton.setToken("PROVIDED_TOKEN", withSecret: "PROVIDED_SECRET") { result in
    switch result {
    case .success:
        // The token is valid and the patient's profile loaded successfully

    case .invalidToken:
        // The token is expired, incomplete, invalid and/or the patient was
        // unable to load. You must retrieve a new token before proceeding.

    case .serviceUnavailable:
        // CirrusMD servers are unreachable

    }
}
```

#### Objective-C

```obj-c
/*
    The completion block is retained throughout the life of the SDK. It is called with
    `CirrusMDSDKSessionResultSuccess` one time after the token is set if successful.

    The completion block is called with `CirrusMDSDKSessionResultInvalidToken` or
    `CirrusMDSDKSessionResultServiceUnavailable` every time the status changes to invalid
    or unavailable.
*/

[CirrusMDSDKSession.singleton setToken:"PROVIDED_TOKEN"
                            withSecret:"PROVIDED_SECRET"
                            completion:^(CirrusMDSDKSessionResult result)
{
    switch (result) {
        case CirrusMDSDKSessionResultSuccess:
            // The token is valid and the patient's profile loaded successfully

        case CirrusMDSDKSessionResultInvalidToken:
            // The token is expired, incomplete, invalid and/or the patient was
            // unable to load. You must retrieve a new token before proceeding.

        case CirrusMDSDKSessionResultServiceUnavailable:
            // CirrusMD servers are unreachable
    }
}];
```
3. Create a

## Author

CirrusMD

## License

CirrusMD-iOS-SDK-Example is available under the MIT license. See the LICENSE file for more info.

CirrusMDSDK is available under the XXXX license. See the LICENSE file for more info.
