![cirrus-logo](https://user-images.githubusercontent.com/12459/33736599-70d3255e-db50-11e7-80db-74e5b3899b77.png)

# CirrusMDSDK

CirrusMDSDK is an embeddable SDK. It enables customers of CirrusMD to provide the CirrusMD patient chat experience in their own applications. While the example application will work in a sandboxed environment when built, integrating CirrusMDSDK into your own application will require you to be a CirrusMD customer. Integration requires a unique `secret` and SSO `token` to work correctly. Please contact your CirrusMD account representative for more information.

- [CHANGELOG](https://github.com/CirrusMD/CirrusMD-iOS-SDK-Example/blob/develop/CHANGELOG.md)
- [Example Application](#example-application)
- [Screen Shots](https://github.com/CirrusMD/CirrusMD-iOS-SDK-Example/wiki/Screenshots)
- [Requirements](#requirements)
- [Installation](#installing-cirrusmdsdk-in-your-own-project)
- [Basic Usage](#basic-usage)
- [Advanced Usage](#advanced-usage)
  - [Delegate (Custom Status Views and Callbacks)](#delegate)
  - [Push notifications](#push-notifications)
  - [Logout](#logout)
  - [CirrusMDConfig](#CirrusMDConfig)
  - [Titles and Colors](#titles-and-colors)
  - [Enable Settings View](#enable-settings-view)
  - [Enable Dependents](#enable-dependents)
  - [Enable User Log Out](#enable-user-log-out)
  - [External Channels](#external-channels)
  - [User Agent Prefix](#user-agent-prefix)
  - [Braze](#braze)
  - [Debugging](#debugging)
- [Module Stability Requirement](#module-stability-requirement)
- [Objective-C Requirement](#objective-c-requirement)
- [License](#license)

## Example Application

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Requires Xcode 12.0 or later
- Requires project Swift version to be 5.1 or later
- Requires `Build Settings > Build Options > Build Libraries for Distribution` to be set to `Yes`. More information on this requirement and a possible workaround can be found in the [Module Stability Requirement](#module-stability-requirement) documentation.
- Requires CocoaPods version 1.10.0 or later. This is related to the [Module Stability Requirement](#module-stability-requirement).
- Required project language is Swift or Objective-C
    - If the project is Objective-C `Build Settings > Build Options > Always Embed Swift Standard Libraries` must be set to `Yes`. More information on this requirement can be found in the [Objective-C Requirement](#objective-c-requirement) documentation

## Installing CirrusMDSDK in your own project

The CirrusMDSDK installs as a prebuilt framework, `CirrusMD.framework`.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CirrusMDSDK into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git' # <-- Make sure to add this line if it's not already in your Podfile
source 'https://github.com/CirrusMD/podspecs.git' # <-- Make sure to add this line

platform :ios, '13.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'CirrusMDSDK'
end
```

Then, run the following command:

```bash
$ pod install
```

### Manually (Not Suggested)

If you prefer not to use any of the aforementioned dependency managers, you can integrate CirrusMDSDK into your project manually.

Download the desired version of the SDK from https://cirrusmd-ios-sdk-release.s3.amazonaws.com/artifacts/v{VERSION}/CirrusMD.framework.zip where {VERSION} is replaced by the desired version. For example https://cirrusmd-ios-sdk-release.s3.amazonaws.com/artifacts/v4.0.0/CirrusMD.framework.zip.

Drag and drop the framework into your Xcode project.

You will also need to manually add all of the dependencies that are listed in the Podspec for the desired version, which can be found [here](https://github.com/CirrusMD/podspecs/tree/master/CirrusMDSDK).

**_Note_** If you install manually you may need to use [Git LFS](https://git-lfs.github.com/) or something similar in order to store the framework in your repository. This is because in it's raw form (before it is stripped and compiled) it is a fat framework that contains symbols and bitcode for all of the architectures (including simulator) so the framework file can be large (over 100mb). This is avoided when using Cocoapods since you can add the file to gitignore when using a dependency manager.

## Basic Usage

Basic usage of of the CirrusMDSDK is very simple.

1. Import CirrusMDSDK
1. Retrieve a token via SSO
1. Set the CirrusMD provided secret on the SDK
1. Set the SSO provided token on the SDK
1. Grab the viewController from CirrusMDSDK and present it

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
CirrusMD.singleton.setSecret("CIRRUSMD-PROVIDED-SECRET")
```

##### Obective-C

```obj-c
[CirrusMD.singleton setSecret: @"CIRRUSMD-PROVIDED-SECRET"];
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

CirrusMD.singleton.setToken("RETRIEVED_TOKEN") { result in
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
    `CirrusMDResultSuccess` one time after the token is set if successful.

    The completion block is called with `CirrusMDResultInvalidToken`,
    `CirrusMDResultNoSecretProvided` or `CirrusMDResultServiceUnavailable`
    every time the status changes.
*/

[CirrusMD.singleton setToken:"RETRIEVED_TOKEN"
                            completion:^(CirrusMDResult result)
{
    switch (result) {
        case CirrusMDResultSuccess:
            // The token is valid and the patient's profile loaded successfully.
            // Showing a MessageViewController will load properly.

        case CirrusMDResultInvalidToken:
            // The token is expired, incomplete, invalid and/or the patient was
            // unable to load. You must retrieve a new token before proceeding.

      case CirrusMDResultNoSecretProvided:
          // No secret has been set on the SDK. Set the secret and retry
          // setting the token.

        case CirrusMDResultServiceUnavailable:
            // CirrusMD servers are unreachable

    }
}];
```

5. Retrieve the CirrusMDSDK viewController and present it.

**_NOTE_** CirrusMDSDK's viewController MUST be embedded within a UINavigationController (either by pushing it onto an existing UINavigationController as demonstrated below or by being added to a new UINavigationController that can be presented modally).

##### Swift

```swift
let controller = CirrusMD.singleton.viewController

self.navigationController?.pushViewController(controller, animated: true)

// or

self.present(controller, animated: true) {...}
```

##### Obective-C

```obj-c
UIViewController *controller = CirrusMD.singleton.viewController;

[self.navigationController pushViewController:controller animated:YES];

// or

[self presentViewController:controller animated:YES completion:^{...}];
```

If the SDK has been provided with a valid secret and token the SSO user's channel's of care will display in the presented view controller.

## Advanced Usage

### Delegate
#### Custom Status Views

Ideally, your patients always see a working view when you present `CirrusMD.singleton.viewController`. However, there are certain times when we're unable to show the normal experience.

The first is when you have explicity called `logout()` or, if you have the Settings view enabled, when the user taps the Sign Out button in Settings. We recommend calling logout, _only_ when your patient logs out of your appication and correctly handling a user logging out as noted in [Other Delegate Callbacks](#other-delegate-callbacks). In that case they will not see the _logged out view_ because they will be logged out of your application as well. You should log them back into the SDK when they next log back into your application.

The second is when the SDK is unable to verify the secret and/or token or encounters a network error. In either case, an _error view_ is shown. We recommend you handle all errors passed to the last argument of `CirrusMD.singleton.setToken`'s completion handler prior to showing the `CirrusMD.singleton.viewController` if possible. Doing so will provide a better experience for your user. Some errors may happen after the `CirrusMD.singleton.viewController` is already on screen. In that case, _error view_ is displayed.

Two screens displayed by the SDK have default values that can be customized. The _logged out view_ and _error view_. We strongly recommend that you provide your own custom views for both cases. Because the CirrusMDSDK uses SSO to authenticate your patients, we are unable to provide logged out UI that helps the patient log back in. By providing your patients with a custom _logout out view_ you can, for example, provide relevant messaging and a button to log back in using the same SSO you implemented to log them in originally. Every time the _error view_ is shown the resolution is retrieving a new SSO token and setting it via `CirrusMD.singleton.setToken(:)`. Providing a custom _error view_ gives you the ability to display relevant messaging and interactions the user can take, most likely a button to re-attempt SSO.

Customization of both the _logged out view_ and _error view_ happens via the `CirrusMDDelegate`.

1. Implement `CirrusMDDelegate`
2. Provide custom views for any or all of the optional delegates.
3. Set a frame on the view you provide and it will be centered in the yellow area of the screen below.

##### Swift

```swift
// CirrusMDDelegate

func viewForError(code: CirrusMDResult) -> UIView {
    // return a custom logged out view
}

func viewForLoggedOut() -> UIView {
    // return a custom view appropriate for the CirrusMDResult
}
```

##### Obective-C

```obj-c
// CirrusMDDelegate

- (UIView *)viewForLoggedOut {
    // return a custom logged out view
}

- (UIView *)viewForErrorWithCode:(enum CirrusMDResult)code {
    // return a custom view appropriate for the CirrusMDResult
}
```

#### Delegate Callbacks

There are callbacks on `CirrusMDDelegate` for when a user is logged in or logged out of the SDK (for example when a user uses the Sign Out button in settings). These callbacks can be used to correcetly handle the CirrusMDSDK in your application. For example you can dismiss `CirrusMD.singleton.viewController` when a user logs out.

##### Swift
```swift
// CirrusMDDelegate

func userLoggedIn(credentialId: Int) {
    // Handle user logged into CirrusMDSDK
}

func userLoggedOut() {
    // Handle user logged out of CirrusMDSDK
}
```

##### Obective-C
```obj-c
// CirrusMDDelegate

- (void)userLoggedInCredentialId:(NSInteger)credentialId {
    // Handle user logged into CirrusMDSDK
}

- (void)userLoggedOut {
    // Handle user logged out of CirrusMDSDK
}
```

### Error handling

The SDK reports errors through the errorRecieved() delegate function. Currently this is just being used to report video errors. Expect further error reporting in the future.

### Swift
```swift
func errorReceived(error: NSError, attributes: [AnyHashable: String]?) {
    // Handle error and attributes
}
```

### Objective-C
```obj-c
- (void)errorReceivedWithError:(NSError *)error attributes:(NSDictionary<id<NSCopying>,NSString *> *)attributes {
    // Handle error and attributes
}
```

### Video connection status

The SDK reports the video session connection status, this can be used to report video related events. 

### Swift
```swift
func videoSessionConnectionStatus(attributes: [AnyHashable: String]?) {
    // Handle attributes
}
```

### Objective-C
```objc-c
- (void)videoSessionConnectionStatusWithAttributes:(NSDictionary<id<NSCopying>,NSString *> *)attributes {
    // Handle attributes
}
```

### Logout

You may wish to log the user out of the SDK when they sign out of your application. Logging the user out destroys the associated CirrusMD server session and unregisters the device from CirrusMD delivered push notifications if previously registred.

##### Swift

```swift
CirrusMD.singleton.logOut()
```

##### Obective-C

```obj-c
[CirrusMD.singleton logout];
```

### Push notifications

In order to enable push notifications for your patients you'll need to provide CirrusMD with the APNS certificate used for the Bundle Identifier associated with your application. Contact your account representative at CirrusMD to enable CirrusMD push notification delivery.

#### Registering for remote notifications

**_AFTER_** providing CirrusMD with your APNS Certificate, register for push notifications.

##### Swift

```swift
UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
    DispatchQueue.main.async {
        UIApplication.shared.registerForRemoteNotifications()
    }
}
```

##### Obective-C

```obj-c
[[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
    [UIApplication.sharedApplication registerForRemoteNotifications];
}];
```

Use the `deviceToken` provided by Apple when [application(\_:didRegisterForRemoteNotificationsWithDeviceToken:))](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1622958-application) is called.

##### Swift

```swift
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    CirrusMD.singleton.registerForRemoteNotifications(deviceToken)
}
```

##### Obective-C

```obj-c
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [CirrusMD.singleton registerForRemoteNotifications:deviceToken];
}
```

#### Unregistering for remote notifications

##### Swift

```swift
CirrusMD.singleton.unregisterForRemoteNotifications()
```

##### Obective-C

```obj-c
[CirrusMD.singleton unregisterForRemoteNotifications];
```

### Handling remote notifications

The SDK provides methods to help handle push notifications and their interactions.

The payload of the package sent by CirrusMD has the shape shown below:

```json
{
    "event": "message:new",
    "stream_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}
```

So the complete push notification payload should look like:

```json
{
    "aps": {
        "alert": "You have a new message.",
        "badge": 1,
        "sound": "default"
    },
    "data": {
        "event": "message:new",
        "stream_id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
    }
}
```

#### Displaying notifications

`shouldPresentNotification` returns a bool used to determine if a notification should be displayed based on if the CirrusMDSDK ViewContoller is being shown and which `streamId` is currently selected. This should be called in the `willPresent` function of `UNUserNotificationCenterDelegate`

`true` means the notification should be displayed. Either the view is not being shown or a different `streamId` is selected.

`false` means the notification should **not** be displayed. The view is being shown and is on the provided `streamId`.
##### Swift
```swift
func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    if CirrusMD.singleton.shouldPresentNotification(notification) {
        completionHandler([.alert, .sound, .badge])
    } else {
        completionHandler([])
    }
}
```

##### Objective-C
```obj-c
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    if ([CirrusMD.singleton shouldPresentNotification:notification]) {
        completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
    } else {
        completionHandler(UNNotificationPresentationOptionNone);
    }
}
```
#### Responding to tapped notifications

`didReceiveNotification` can be called in `didReceive` of `UNUserNotificationCenterDelegate` when a user taps a push notification.

If the CirrusMDSDK's view controller is being displayed, it will switch to the provided `streamId`.

If the CirrusMDSDK's view controller is not being displayed, the provided `streamId` will be presented when it is shown.

If the provided `streamId` is not found on the current user's profile, no action will be taken.

In addition to these actions, if the notification is for a video session, the video session will be launched once the user is presented with the corresponding stream.

**_Note_** You will also need to set the `launchOptions` on your `CirrusMDConfig` if you would like the CirrusMDSDK to respond to push notifications that were tapped by the user when your app is not running. An example of setting the `launchOptions` on your CirrusMDConfig can be seen in the [Braze](#braze) section of the documentation.

##### Swift
```swift
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    CirrusMD.singleton.didReceiveNotification(center: center, response: response, withCompletionHandler: completionHandler)
}
```

##### Objective-C
```obj-c
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    [CirrusMD.singleton didReceiveNotificationWithCenter:center response:response withCompletionHandler:completionHandler];
}
```

There are alternate versions of the `shouldPresentNotification` and `didReceiveNotification` that take the notification's userInfo payload or raw event and stream ID directly if you wish to implement your push notifications in a different or more custom way.

### CirrusMDConfig

All custom configuration of the CirrusMDSDK is done via the `CirrusMDConfig`. This allows the configuration of items such as titles, colors, optional features, etc.. All of the exact options are outlined below.

##### Swift

```swift
let config = CirrusMDConfig()
// Set the desired properties on the config here

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
// Set the desired properties on the config here

[CirrusMD.singleton setConfig:config];
```

### Titles and Colors

Some of the navigation titles in the SDK are configurable. To override the default set a title on your `CirrusMDConfig` object.
Many of the colors in the SDK are configurable. To override the colors set them in on your `CirrusMDConfig` object.

```swift
primary         // defaults to "#1a1a1a", used in avatar outlines and buttons
primaryDarkMode // defaults to primary, used in avatar outlines and buttons
offHours        // defaults to "#4a4a4a", used in the Patient Encounter Queue
unassigned      // defaults to "#0c4c78", used in the Patient Encounter Queue
assigned        // defaults to "#44db5e", used in the Patient Encounter Queue
error           // defaults to "#dd0000", will be used in the future
success         // defaults to "#44db5e", will be used in the future
warning         // defaults to "#daaf0f", used in the offline banner
```

##### Swift

```swift
let config = CirrusMDConfig()
config.title = "Custom Title Here" // defaults to "My Healthcare Services" if this is not set
config.primary = UIColor.black
config.primaryColorDarkMode = UIColor.purple

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
config.title = @"Custom Title Here"; // defaults to "My Healthcare Services" if this is not set
config.primary = @UIColor.blackColor;
config.primaryColorDarkMode = UIColor.purpleColor;

[CirrusMD.singleton setConfig:config];
```

### Enable Settings View

There is an optional Settings view that you can allow your users to have access to. The Settings view, when enabled, is accessed via a button in the navigation bar of the SDK. This Settings view allows the user to view and edit their profile, medical history, dependents, permissions, and Terms of Use / Privacy Policy. The Settings view also allows the user to manually log out of the CirrusMD. The availability of the Settings view is controlled by the `CirrusMDConfig`.

**_Note_** The Settings view defaults to be disabled.

##### Swift

```swift
let config = CirrusMDConfig()
config.enableSettings = true

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
config.enableSettings = YES;

[CirrusMD.singleton setConfig:config];
```

### Enable Dependents

The CirrusMDSDK can support a user having dependents that can chat under their guarantor's account. When dependents support is enabled and a user has dependents they will see a dependents button that allows them to switch to chatting as that dependent. Support for dependents is controlled by the `CirrusMDConfig`.

**_Note_** Dependent support defaults to being disabled.

##### Swift

```swift
let config = CirrusMDConfig()
config.enableDependents = true

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
config.enableDependents = YES;

[CirrusMD.singleton setConfig:config];
```

### Right Bar Button Items

The CirrusMDSDK can support custom right bar button items to be shown in the UINavigationController the CirrusMDSDK's view controller is embedded in. For example if you want to present the CirrusMDSDK view controller modally this can be used to add a "Done" button. The right bar button items are controlled by the `rightBarButtonItems` property on `CirrusMDConfig`.

##### Swift

```swift
let config = CirrusMDConfig()
let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(done))
config.rightBarButtonItems = [doneButton]

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)];
CirrusMD.singleton.config.rightBarButtonItems = @[doneButton];

[CirrusMD.singleton setConfig:config];
```

### Enable User Log Out

The CirrusMDSDK can support allowing the user to manually log themselves out of the SDK. If enabled a "Sign Out" option will exist in the Settings view as well as some error views. If this is enabled and the user does manually log out the `userLoggedOut` function on `CirrusMDDelegate` will be called. Support for manual user log out is controlled by the `CirrusMDConfig`.

**_Note_** User log out support defaults to being disabled.

##### Swift

```swift
let config = CirrusMDConfig()
config.enableUserLogOut = true

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
config.enableUserLogOut = YES;

[CirrusMD.singleton setConfig:config];
```

### External Channels

The SDK allows retrieval of and deep linking into specific channels.

The channels available to the authenticated user can be retrieved using the `channels` function on `CirrusMD`.

##### Swift
```swift
let channels = CirrusMD.singleton.channels()
```

##### Objective-C
```obj-c
NSArray<CirrusMDChannel*>* channels = [CirrusMD.singleton channels];
```

You can force the SDK to navigate (deep link) to one of the channels using the `navigateToChannel` function on `CirrusMD`.

##### Swift
```swift
let channel = CirrusMD.singleton.channels()[index]
CirrusMD.singleton.navigateToChannel(id: channel.id)
```

##### Objective-C
```obj-c
CirrusMDChannel* channel = [CirrusMD.singleton channels][index];
[CirrusMD.singleton navigateToChannelWithId: channel.id];
```

### User Agent Prefix

The CirrusMDSDK allows the addition of a prefix to the User Agent that is sent on network requests.

##### Swift

```swift
let config = CirrusMDConfig()
config.userAgentPrefix = "Custom User Agent Prefix"

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
config.userAgentPrefix = @"Custom User Agent Prefix";

[CirrusMD.singleton setConfig:config];
```

### Debugging

#### Debug View Controller

The CirrusMDSDK can you provide you with a view controller that displays various debug information. For example, the current patient's ID, the push notifications token, the session token, etc..

THIS VIEW CONTROLLER SHOULD NEVER BE PRESENTED TO AN END USER. It is for debugging purposes only.

The debug view controller can be accessed and presented manually or it can be accessed in Settings if `showDebugInSettings` is set to true on your `CirrusMDConfig`

##### Swift

```swift
// Manually accessing and presenting the debug view controller
let controller = CirrusMD.singleton.debugViewController()
self.navigationController?.pushViewController(controller, animated: true)

// Enabling showDebugInSettings on CirrusMDConfig
let config = CirrusMDConfig()
config.enableUserLogOut = true
CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
// Manually accessing and presenting the debug view controller
UIViewController *controller = [CirrusMD.singleton debugViewController];
[self.navigationController pushViewController:controller animated:YES];

// Enabling showDebugInSettings on CirrusMDConfig
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
config.enableUserLogOut = YES;
[CirrusMD.singleton setConfig:config];
```

#### Log Level

The default log level is none. For debugging purposes this can be changed to one of five different logging levels. When set to verbose the SDK will print extensive logging around network requests, network responses, state changes, and other useful information to the debugger's console and the device's console. When setting the log level for debugging purposes it should be done before calling any other functions on the SDK. The logLevel is set on the `CirrusMDConfig`

The levels add to each other with verbose showing all available logging.
```
public enum CirrusMDLogLevel: Int {
  case none
  case error
  case info
  case debug
  case networking
  case verbose
}
```

  - .none       // Shows no logs
  - .error      // Shows only errors marked by :bangbang:
  - .info       // Adds in info logs like Web Socket connection and Reachability marked by ℹ️
  - .debug      // Adds in debug information for specific views, actions, and push notifications marked by 🦋
  - .networking // Adds in all networking calls, both requests and responses marked by :open_umbrella:
  - .verbose    // Shows all logs including the ping back and forth to the Web Socket marked by 🗯️

##### Swift

```swift
let config = CirrusMDConfig()
config.logLevel = .verbose

CirrusMD.singleton.setConfig(config)
```

##### Obective-C

```obj-c
CirrusMDConfig* config = [[CirrusMDConfig alloc] init];
config.logLevel = CirrusMDLogLevelVerbose;

[CirrusMD.singleton setConfig:config];
```

#### Token State

Access `CirrusMD.singleton.tokenState` for the state of the token. The possible values are `invalid`, `valid`, and `unknown`. The `tokenState` can be used to troubleshoot issues with the SDK, `invalid` and `unknown` require retrieving a new token from the server. `unknown` usually indicates that a token has not yet been set.

##### Swift

```swift
let tokenState = CirrusMD.singleton.tokenState

switch tokenState {
case .invalid:
case .unknown:
case .valid
}
```

##### Obective-C

```obj-c
CirrusMDTokenState tokenState = CirrusMD.singleton.tokenState;

switch (tokenState) {
    case CirrusMDTokenStateInvalid:
    case CirrusMDTokenStateUnknown:
    case CirrusMDTokenStateValid:
}
```


## Localization Requirement

The CirrusMDSDK (version 10.1.0 and later) supports Spanish translations if the presenting application does as well. Instructions on localizing your application can be found [here](https://developer.apple.com/localization/).

## Module Stability Requirement

CirrusMDSDK is built using [Swift Module Stability](https://swift.org/blog/abi-stability-and-more/) so that it can be integrated into projects that are built with different versions of Swift, as long as that Swift version is 5.1 or later. Because of this `Build Settings > Build Options > Build Libraries for Distribution` must be set to `Yes`. Additionally this must be set before running `pod install` (or run `pod install` again after setting) due to how `Build Libraries for Distribution` is handled by [CocoaPods (version 1.10.0 and later)](https://github.com/CocoaPods/CocoaPods/issues/9232). If not set, the following error (or something similar) will appear:

    >dyld: Symbol not found: _$s18Kingfisher16ValidationResultO7successyA2CmFWC
    >  Referenced from: /Users/taylor-case/Library/Developer/CoreSimulator/Devices/E0BE558B-8E22-4554-9449-7B38089DB250/data/   >Containers/Bundle/Application/EBC8F562-9C70-4F58-9B71-B4AAC73E3B78/CirrusMDSDK-Pods.app/Frameworks/CirrusMD.framework/ >CirrusMDSDK
    >  Expected in: /Users/taylor-case/Library/Developer/CoreSimulator/Devices/E0BE558B-8E22-4554-9449-7B38089DB250/data/   >Containers/Bundle/Application/EBC8F562-9C70-4F58-9B71-B4AAC73E3B78/CirrusMDSDK-Pods.app/Frameworks/Kingfisher.    >framework/Kingfished
    > in /Users/taylor-case/Library/Developer/CoreSimulator/Devices/E0BE558B-8E22-4554-9449-7B38089DB250/data/Containers/Bundle/    >Application/EBC8F562-9C70-4F58-9B71-B4AAC73E3B78/CirrusMDSDK-Pods.app/Frameworks/CirrusMD.framework/CirrusMDSDK

### Workaround
Although it's not ideal, there is a possible workaround if you cannot set `Build Libraries for Distribution` to `Yes` on your app (or some of its other dependencies) for some reason. The workaround uses the `post_install` hook in your Podfile to set `Build Libraries for Distribution` to `Yes` on ONLY the CirrusMDSDK and it's dependencies and not your app or other dependencies.

```ruby
post_install do |installer|
  installer.pods_project.targets.each do |target|
    if CIRRUSMD_DEPENDENCIES.include?(target.name)
      target.build_configurations.each do |build_configuration|
        build_configuration.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
      end
    end
  end
end

CIRRUSMD_DEPENDENCIES = [
  'CirrusMDSDK',
  'CMDMBProgressHUD',
  'Kingfisher',
  'OpenTok',
  'SDWebImage',
  'SnapKit',
  'UDF',
]
```

## Objective-C Requirement

Because the CirrusMDSDK is implemented in Swift, when integrating it into an Objective-C project `Build Settings > Build Options > Always Embed Swift Standard Libraries` must be set to `Yes`. If not set the following error (or something similar) will appear:

   > dyld: Library not loaded: @rpath/libswiftAVFoundation.dylib
   > Referenced from: ../<YOUR-APP>.app/Frameworks/CirrusMD.framework/CirrusMDSDK
   > Reason: image not found

## Author

CirrusMD

## License

CirrusMD-iOS-SDK-Example is available under the MIT license. See the LICENSE file for more info.
