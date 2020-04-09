![cirrus-logo](https://user-images.githubusercontent.com/12459/33736599-70d3255e-db50-11e7-80db-74e5b3899b77.png)

# CirrusMDSDK

CirrusMDSDK is an embeddable SDK. It enables customers of CirrusMD to provide the CirrusMD patient chat experience in their own applications. While the example application will work in a sandboxed environment when built, integrating CirrusMDSDK into your own application will require you to be a CirrusMD customer. Integration requires a unique `secret` and SSO `token` to work correctly. Please contact your CirrusMD account representative for more information.

![chat](https://user-images.githubusercontent.com/12459/33736363-9149bb00-db4f-11e7-89d6-50151ca1761f.png)

- [CHANGELOG](https://cirrusmd-ios-sdk-release.s3.amazonaws.com/CHANGELOG.html)
- [Example Application](#example-application)
- [Screen Shots](https://github.com/CirrusMD/CirrusMD-iOS-SDK-Example/wiki/Screenshots)
- [Requirements](#requirements)
- [Installation](#installing-cirrusmdsdk-in-your-own-project)
- [Basic Usage](#basic-usage)
- [Advanced Usage](#advanced-usage)
  - [Text](#text)
  - [Colors](#colors)
  - [Logout](#logout)
  - [Custom Status Views](#custom-status-views)
  - [Push notifications](#push-notifications)
  - [External Channels](#external-channels)
  - [Debugging](#debugging)
- [License](#license)

## Example Application

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0+
- Xcode 11.1, Swift 5.1
- CirrusMDSDK works in both Swift and Objective-C projects
    - If the project is Objective-C `Build Settings > Build Options > Always Embed Swift Standard Libraries` must be set to `Yes`

## Installing CirrusMDSDK in your own project

The CirrusMDSDK installs as a prebuilt framework, `CirrusMDSDK.framework`.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CirrusMDSDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git' # <-- Make sure to add this line if it's not already in your Podfile
source 'https://github.com/CirrusMD/podspecs.git' # <-- Make sure to add this line

platform :ios, '11.0' # must be >= 10.0
use_frameworks!

target '<Your Target Name>' do
    pod 'CirrusMDSDK'
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate CirrusMDSDK into your project manually.

Download the desired version of the SDK from [here](https://cirrusmd-ios-sdk-release.s3.amazonaws.com/CirrusMDSDK.json).

Drag and drop the framework into your Xcode project.

You will also need to manually add all of the dependencies that are listed in the Podspec for the desired version, which can be found [here](https://github.com/CirrusMD/podspecs/tree/master/CirrusMDSDK).

Note: If you install manually you may need to use [Git LFS](https://git-lfs.github.com/) or something similar in order to store the framework in your repository. This is because in it's raw form (before it is stripped and compiled) it is a fat framework that contains symbols and bitcode for all of the architectures (including simulator) so the framework file can be large (over 100mb). This is avoided when using Cocoapods since you can add the file to gitignore when using a dependency manager.

## Basic Usage

Basic usage of of the CirrusMDSDK is very simple.

1. import CirrusMDSDK
1. retrieve a token via SSO
1. set the CirrusMD provided secret on the SDK
1. set the SSO provided token on the SDK
1. ask the SDK for a messages controller and display it

### The details

1. import CirrusMDSDK

##### Swift

```swift
import CirrusMDSDK
```

##### Obective-C

```obj-c
#import <CirrusMDSDK/CirrusMDSDK-Swift.h>
```

2. Our team works with your technical staff to provide SSO for your patients using the CirrusMD platform. The CirrusMDSDK uses tokens retrieved via SSO from CirrusMD's SSO service. Each SSO integration is slightly customized based on your needs. In general, your backend service requests a token representing a patient from our SSO service which provides the token that should be set on the SDK.

**\* **_Do not cache CirrusMD provided JWTs_** \***

3. Set the CirrusMD provided secret. The secret is unique to your organization. To receive a valid client secret contact your account representative at CirrusMD. The secret must be set prior to setting the token in the next step. You must also set set the secret after logging out of the SDK.

##### Swift

```swift
CirrusMDSDKSession.singleton.setSecret("CIRRUSMD-PROVIDED-SECRET")
```

##### Obective-C

```obj-c
[CirrusMDSDKSession.singleton setSecret: @"CIRRUSMD-PROVIDED-SECRET"];
```

4. **_AFTER_** setting the secret on the SDK, set the token. This is your opportunity to verify that the token provided to the SDK is able to load a patient.

##### Swift

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

##### Obective-C

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

5. Retrieve a `MessageViewController` and present it.

##### Swift

```swift
let controller = CirrusMDSDKSession.singleton.messageViewController()

self.navigationController?.pushViewController(controller, animated: true)

// or

self.present(controller, animated: true) {...}
```

##### Obective-C

```obj-c
UIViewController *controller = [CirrusMDSDKSession.singleton messageViewController];

[self.navigationController pushViewController:controller animated:YES];

// or

[self presentViewController:controller animated:YES completion:^{...}];
```

If the SDK has been provided with a valid secret and token the SSO user's messages will display in the retrieved view controller. A user's first look at their messages will look something like this:

![welcome-message](https://user-images.githubusercontent.com/12459/33579479-304386aa-d907-11e7-99df-b5b163196fd7.png)

## Advanced Usage

### Text

Some of the text in the SDK is configurable. To override text provide a `CirrusMDSDKConfig` object.

```swift
title // defaults to "My Healthcare Services", used when a patient has multiple channels fo care
```

##### Swift

```swift
let config = CirrusMDSDKConfig()
config.title = "Custom Title Here"

CirrusMDSDKSession.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDSDKConfig* config = [[CirrusMDSDKConfig alloc] init];
config.title = @"Custom Title Here";

[CirrusMDSDKSession.singleton setConfig:config];
```

### Colors

Many of the colors in the SDK are configurable. To override the colors provide a `CirrusMDSDKColorConfig` object.

```swift
primary     // defaults to "#1a9af2", used in avatar outlines and buttons
offHours    // defaults to "#4a4a4a", used in the Patient Encounter Queue
unassigned  // defaults to "#0c4c78", used in the Patient Encounter Queue
assigned    // defaults to "#44db5e", used in the Patient Encounter Queue
error       // defaults to "#dd0000", will be used in the future
success     // defaults to "#44db5e", will be used in the future
warning     // defaults to "#daaf0f", used in the offline banner
```

##### Swift

```swift
let config = CirrusMDSDKColorConfig()
config.primary = "FF5733"

CirrusMDSDKSession.singleton.setColorConfig(config)
```

##### Obective-C

```obj-c
CirrusMDSDKColorConfig* config = [[CirrusMDSDKColorConfig alloc] init];
config.primary = @"FF5733";

[CirrusMDSDKSession.singleton setColorConfig:config];
```

### Logout

You may wish to log the user out of the SDK when they sign out of your application. Logging the user out destroys the associated CirrusMD server session and unregisters the device from CirrusMD delivered push notifications if previously registred.

##### Swift

```swift
CirrusMDSDKSession.singleton.logOut()
```

##### Obective-C

```obj-c
[CirrusMDSDKSession.singleton logout];
```

### Custom Status Views

Ideally, your patients always see a working messages view when you present a `MessagesViewController`. However, there are certain times when we're unable to show messages.

The first is when you have explicity called `logout()`. We recommend calling logout, _only_ when your patient logs out of your appication. In that case they will not see the _logged out view_ because they will be logged out of your application as well. You should log them back into the SDK when they next log back into your application.

The second is when the SDK is unable to verify the secret and/or token. In either case, an _error view_ is shown. We recommend you handle all errors passed to the last argument of `CirrusMDSDKSession.singleton.setToken`'s completion handler prior to showing the `MessagesViewController` if possible. Doing so will provide a better experience for your user. Some errors may happen after the `MessagesViewController` is already on screen. In that case, _error view_ is displayed.

Two screens displayed by the SDK have default values that can be customized. The _logged out view_ and _error view_. We strongly recommend that you provide your own custom views for both cases. Because the CirrusMDSDK uses SSO to authenticate your patients, we are unable to provide logged out UI that helps the patient log back in. By providing your patients with a custom _logout out view_ you can, for example, provide relevant messaging and a button to log back in using the same SSO you implemented to log them in originally. Every time the _error view_ is shown the resolution is retrieving a new SSO token and setting it via `CirrusMDSDKSession.singleton.setToken(:)`. Providing a custom _error view_ gives you the ability to display relevant messaging and interactions the user can take, most likely a button to re-attempt SSO.

By default they will look similar to the screens below:

The default logged out screen is shown after you call `CirrusMDSDKSession.singleton.logOut()`.

![logged-out](https://user-images.githubusercontent.com/12459/33667547-605ac368-da5a-11e7-8abc-bfd6457b6ee0.png)

The error screen can be shown for several reasons, such as providing an expired token or invalid secret.

![error-message](https://user-images.githubusercontent.com/12459/33579485-365a9a60-d907-11e7-85e8-603060b0ac1e.png)

Customization of both the _logged out view_ and _error view_ happens via the `CirrusMDSDKSession.delegate`.

1. Implement `CirrusMDSKSessionDelegate`
2. Provide custom views for any or all of the optional delegates.
3. Set a frame on the view you provide and it will be centered in the yellow area of the screen below.

![customized-message](https://user-images.githubusercontent.com/12459/33580171-6152b174-d909-11e7-90a6-ff551369382f.png)

##### Swift

```swift
CirrusMDSDKSession.singleton.delegate = self

func viewForError(code: CirrusMDSDKSessionResult) -> UIView {
    // return a custom logged out view
}
func viewForLoggedOut() -> UIView {
    // return a custom view appropriate for the CirrusMDSDKSessionResult
}
```

##### Obective-C

```obj-c
CirrusMDSDKSession.singleton.delegate = self;

- (UIView *)viewForLoggedOut {
    // return a custom logged out view
}

- (UIView *)viewForErrorWithCode:(enum CirrusMDSDKSessionResult)code {
    // return a custom view appropriate for the CirrusMDSDKSessionResult
}
```

### Push notifications

In order to enable push notifications for your patients you'll need to provide CirrusMD with the APNS certificate used for the Bundle Identifier associated with your application. Contact your account representative at CirrusMD to enable CirrusMD push notification delivery.

#### Registering for remote notifications

**_AFTER_** providing CirrusMD with your APNS Certificate, register for push notifications.

##### Swift

```swift
let settings = UIUserNotificationSettings(types: [.alert, .sound, .badge], categories: nil)
UIApplication.shared.registerUserNotificationSettings(settings)
UIApplication.shared.registerForRemoteNotifications()
```

##### Obective-C

```obj-c
UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:
  (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound) categories:nil];
[[UIApplication sharedApplication] registerUserNotificationSettings:settings];
[[UIApplication sharedApplication] registerForRemoteNotifications];
```

Use the `deviceToken` provided by Apple when [application(\_:didRegisterForRemoteNotificationsWithDeviceToken:))](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622958-application) is called.

##### Swift

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

##### Obective-C

```obj-c
/*
    `deviceToken` is the deviceToken provided by Apple when
                                `- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken` is called.
*/

[CirrusMDSDKSession.singleton registerforRemoteNotifications: deviceToken];
```

#### Unregistering for remote notifications

##### Swift

```swift
CirrusMDSDKSession.singleton.unregisterForRemoteNotifications()
```

##### Obective-C

```obj-c
[CirrusMDSDKSession.singleton unregisterForRemoteNotifications];
```

### Handling remote notifications

The SDK provides methods to help handle push notifications and their interactions.

The payload of the package sent by CirrusMD has the shape shown below, which are the values passed in to these methods:

```json
{
    "event": "message:new",
    "stream_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```

#### Displaying notifications

`shouldShowNotification` returns a bool used to determine if a notification should be displayed based on if the ViewContoller is being shown and which `streamId` is currently selected.

`true` means the notification should be displayed. Either the view is not being shown or a different `streamId` is selected.

`false` means the notification should **not** be displayed. The view is being shown and is on the provided `streamId`.
##### Swift
```swift
CirrusMDSDKSession.singleton.shouldShowNotification(streamId: String, eventType: String)
```

##### Objective-C
```obj-c
[CirrusMDSDKSession.singleton shouldShowNotificationWithStreamId:streamId eventType:eventType];
```
#### Selecting notifications

`onPushNotificationSelected` can be called when a user selects a push notification.

If the SDK view controller is being displayed, it will switch to the provided `streamId`.

If the view controller is not being displayed, the provided `streamId` will be presented when it is shown.

If the provided `streamId` is not found on the current user's profile, no action will be taken.

In addition to these actions, if the notification is for a video session, the video session will be launched once the user is presented with the corresponding stream.

##### Swift
```swift
CirrusMDSDKSession.singleton.onRemoteNotificationSelected(streamId: String, eventType: String)
```

##### Objective-C
```obj-c
[CirrusMDSDKSession.singleton onRemoteNotificationSelectedWithStreamId:streamId eventType:eventType];
```

### External Channels

The SDK allows retrieval of and deep linking into specific channels.

The channels available to the authenticated user can be retrieved using the `channels` function on `CirrusMDSDKSession`.

##### Swift
```swift
let channels = CirrusMDSDKSession.singleton.channels()
```

##### Objective-C
```obj-c
NSArray<CirrusMDChannel*>* channels = [CirrusMDSDKSession.singleton channels];
```

You can force the SDK to navigate (deep link) to one of the channels using the `navigateToChannel` function on `CirrusMDSDKSession`.

##### Swift
```swift
let channel = CirrusMDSDKSession.singleton.channels()[index]
CirrusMDSDKSession.singleton.navigateToChannel(id: channel.id)
```

##### Objective-C
```obj-c
CirrusMDChannel* channel = [CirrusMDSDKSession.singleton channels][index];
[CirrusMDSDKSession.singleton navigateToChannelWithId: channel.id];
```

### Debugging

#### Log Level

The default log level is none. For debugging purposes this can be changed to verbose. When set to verbose the SDK will print extensive logging around network requests, network responses, state changes, and other useful information to the debugger's console and the device's console. When setting the log level to verbose for debugging purposes it should be done before calling anything other functions on the SDK.

##### Swift

```swift
CirrusMDSDKSession.singleton.logLevel = .verbose
```

##### Obective-C

```obj-c
CirrusMDSDKSession.singleton.logLevel = CirrusMDLogLevelVerbose;
```

#### Token State

Access `CirrusMDSDKSession.singleton.tokenState` for the state of the token. The possible values are `invalid`, `valid`, and `unknown`. The `tokenState` can be used to troubleshoot issues with the SDK, `invalid` and `unknown` require retrieving a new token from the server. `unknown` usually indicates that a token has not yet been set.

##### Swift

```swift
let tokenState = CirrusMDSDKSession.singleton.tokenState

switch tokenState {
case .invalid:
case .unknown:
case .valid
}
```

##### Obective-C

```obj-c
CirrusMDSKSessionTokenState tokenState = CirrusMDSDKSession.singleton.tokenState;

switch (tokenState) {
    case CirrusMDSKSessionTokenStateInvalid:
    case CirrusMDSKSessionTokenStateUnknown:
    case CirrusMDSKSessionTokenStateValid:
}
```

## Troubleshooting

1. If you see the following error in an Objective-C project you likely haven't embedded the Swift Standard Libraries. Ensure `Build Settings > Build Options > Always Embed Swift Standard Libraries` is set to `Yes`.

   > dyld: Library not loaded: @rpath/libswiftAVFoundation.dylib
   > Referenced from: ../<YOUR-APP>.app/Frameworks/CirrusMDSDK.framework/CirrusMDSDK
   > Reason: image not found

## Author

CirrusMD

## License

CirrusMD-iOS-SDK-Example is available under the MIT license. See the LICENSE file for more info.

CirrusMDSDK is available under the XXXX license. See the LICENSE file for more info.
