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
platform :ios, '11.0' # must be >= 9.0
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

## Basic Usage

1. Ensure your backend API service retrieves a valid token via CirrusMD's SSO API. TODO: Add the correct documentation for JWT retrieval here.
*** **_Do not cache CirrusMD provided JWTs_** ***

2. Set the CirrusMD provided secret. The secret is unique to your organization. To receive a valid client secret contact your account representative at CirrusMD. The secret must be set prior to setting the token in the next step. You must also set set the secret after logging out of the SDK.

#### Swift

```swift
CirrusMDSDKSession.singleton.setSecret("CIRRUSMD-PROVIDED-SECRET")
```

#### Objective-C

```obj-c
[CirrusMDSDKSession.singleton setSecret: @"CIRRUSMD-PROVIDED-SECRET"];
```

3. **_AFTER_** setting the secret on the SDK, set the token. This is your opportunity to verify that the token provided to the SDK is able to load a patient.

#### Swift

```swift
/*
    The completion closure is retained throughout the life of the SDK. It is called with
    `.success` one time after the token is set if successful.

    The completion closure is called with `.invalidToken`, `.noSecretProvided` or
    `.serviceUnavailable` every time the status changes.
*/

CirrusMDSDKSession.singleton.setToken("RETRIEVED_TOKEN") { result in
    switch result {
    case .success:
        // The token is valid and the patient's profile loaded successfully.
        // Showing a MessageViewController will load properly.

    case .invalidToken:
        // The token is expired, incomplete, invalid and/or the patient was
        // unable to load. You must retrieve a new token before proceeding.

    case .noSecretProvided:
        // No secret has been set on the SDK. Set the secret and retry
        // setting the token.

    case .serviceUnavailable:
        // CirrusMD servers are unreachable.

    }
}
```

#### Objective-C

```obj-c
/*
    The completion block is retained throughout the life of the SDK. It is called with
    `CirrusMDSDKSessionResultSuccess` one time after the token is set if successful.

    The completion block is called with `CirrusMDSDKSessionResultInvalidToken`,
    `CirrusMDSDKSessionResultNoSecretProvided` or `CirrusMDSDKSessionResultServiceUnavailable`
    every time the status changes.
*/

[CirrusMDSDKSession.singleton setToken:"RETRIEVED_TOKEN"
                            completion:^(CirrusMDSDKSessionResult result)
{
    switch (result) {
        case CirrusMDSDKSessionResultSuccess:
            // The token is valid and the patient's profile loaded successfully.
            // Showing a MessageViewController will load properly.

        case CirrusMDSDKSessionResultInvalidToken:
            // The token is expired, incomplete, invalid and/or the patient was
            // unable to load. You must retrieve a new token before proceeding.

      case CirrusMDSDKSessionResultNoSecretProvided:
          // No secret has been set on the SDK. Set the secret and retry
          // setting the token.

        case CirrusMDSDKSessionResultServiceUnavailable:
            // CirrusMD servers are unreachable

    }
}];
```

4. Retrieve a `MessageViewController` present it.

#### Swift

```swift
let controller = CirrusMDSDKSession.singleton.messageViewController()

self.navigationController?.pushViewController(controller, animated: true)

// or

self.present(controller, animated: true) {...}
```

#### Objective-C

```obj-c
UIViewController *controller = [CirrusMDSDKSession.singleton messageViewController];

[self.navigationController pushViewController:controller animated:YES];

// or

[self presentViewController:controller animated:YES completion:^{...}];
```

If the SDK has been provided with a valid secret and token the SSO user's messages will display in the retrieved view controller. It will look something like this:



## Advanced Usage

### Push notifications
In order to enable push notifications for your patients you'll need to provide CirrusMD with the APNS certificate used for the Bundle Identifier associated with your application. contact your account representative at CirrusMD to enable CirrusMD push notification delivery.

#### Registering for remote notifications
**_AFTER_** providing CirrusMD with your APNS Certificate, register for push notifications.

#### Swift

```swift
/*
    `deviceToken` is the deviceToken provided by Apple when
    `application(
      _ application: UIApplication,
      didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    )` is called.
*/

CirrusMDSDKSession.singleton.registerforRemoteNotifications(deviceToken)
```

#### Objective-C

```obj-c
/*
    `deviceToken` is the deviceToken provided by Apple when
                                `- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken` is called.
*/

[CirrusMDSDKSession.singleton registerforRemoteNotifications: deviceToken];
```

#### Unregistering for remote notifications

#### Swift

```swift
CirrusMDSDKSession.singleton.unregisterforRemoteNotifications()
```

#### Objective-C

```obj-c
[CirrusMDSDKSession.singleton unregisterforRemoteNotifications];
```

## Author

CirrusMD

## License

CirrusMD-iOS-SDK-Example is available under the MIT license. See the LICENSE file for more info.

CirrusMDSDK is available under the XXXX license. See the LICENSE file for more info.
