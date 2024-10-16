# CirrusMD iOS SDK Changelog

# 11.7.0

## Built with: Xcode 15.4.0

### Changes:
- Updated Pods:
  - AmazonChimeSDK 0.25.2 (https://github.com/aws/amazon-chime-sdk-ios/releases)
  - AmazonChimeSDKMedia 0.21.0 (https://github.com/aws/amazon-chime-sdk-ios/releases)
  - Kingfisher 7.12.0 (https://github.com/onevcat/Kingfisher/releases)
- Added `CirrusMDPinnedBanner`, `CirrusMDActionModal`, `CirrusMDContactOption`, and `CirrusMDContactIcon` to SDK configuration
- Added Pinned banner view to `EventStreamViewController`, `PatientStreamPickerViewController`, and `SettingsTableViewController`
- Added Pinned Banner Action Modal for when the banner is tapped
- Redesigned `PatientGoalsViewController` to show goals by status updated via a `UISegmentedControl`
- Added the `Inactive` goal status to the `PatientGoalsViewController`
- Added design tweaks for past due goals
- Added `PatientGoalDetailViewController` that opens when tapping on a goal
- Added `ActionMessage` functionality to `PatientGoalDetailViewController`
- Adds the above to the Support UI in settings and will use these strings if they are available and if not fall back to the current configuration.

### Bug Fixes:


# 11.6.0

## Built with: Xcode 15.2.0

### Changes:
- Updated Pods:
  - AmazonChimeSDK 0.25.0 (https://github.com/aws/amazon-chime-sdk-ios/releases)
  - AmazonChimeSDKMedia 0.20.0 (https://github.com/aws/amazon-chime-sdk-ios/releases)
  - Kingfisher 7.11.0 (https://github.com/onevcat/Kingfisher/releases)
  - Removed AmazonChimeSDK-No-Bitcode
  - Removed AmazonChimeSDKMedia-No-Bitcode
- Integrated Markdown Parsing
- Added support for in app Appstore review prompt
- Added ability to change data sharing preference from settings `Data Sharing` view

### Bug Fixes:
- Updated landscape rotational support for SDK
- Improved settings profile, medical and family design to get closer to parity with Android
- Fixed iPad navigation for family dependent profile settings

# 11.5.0

## Built with: Xcode 15.2.0

### Changes:
- Added remote notification support for lab results
- Added `Find Local Care` card to stream picker view
- `Find Local Care` feature implemented to find in network local medical resources 

### Bug Fixes:
- Fixed bug in pin code view where the information label was not being updated properly

# 11.4.0

## Built with: Xcode 15.2.0

### Changes:
- Dropped iOS 13 support
- Adds the ability to support lab orders and lab results as PDF files
- Adds support for iOS Share sheet for images and PDFs so users can save files
- Adds new gesturers to image view like double tap to zoom, single tap to hide UI, and swipe down to close image
- Upgraded image picker to support latest iOS version as popover

### Bug Fixes:

# 11.3.0

## Built with: Xcode 15.0.1

### Changes:
- Updated Pods:
  - Kingfisher 7.9.1 (Xcode compatibility)
- Added Maestro test to project
- Adds Transcription Feature and Closed Captions for video chat
- Adds an api call to turn on transcription
- Adds new buttons and menu to the bottom bar for video chat to facilitate the new features.
- Updated Pods:
  - AmazonChimeSDK-No-Bitcode 0.23.3 (Xcode compatibility)
  
### Bug Fixes:
- Fixed Photo Picker permissions bug

# 11.2.0

## Built with: Xcode 14.3.1

### Changes:
- Added a new Patient Health Goal feature:
    - Added a new message view for Patient Health Goals, that show up in the chat stream.
    - New scrollable Patient Health Goals screen, where patients can see all Active, Upcoming, and Completed goals.
- Updated AmazonChimeSDK-No-Bitcode to 0.23.3

### Bug Fixes:
- Fixed issue where inactive stream messages can consume the entire screen (when message is long, or accessibility font is being used), causing a bad user experience. The new behavior involves having a collapsable message, which the user can expand and collapse.
- Fixes animations with Stream Info to reduce flashing and clean up execution order

### Known Issues:
- We are currently tracking an issue when building this SDK on Xcode 15.0 related to dark mode. Any customer planning to build on Xcode 15 should wait for 11.3.0 of our SDK.

# 11.1.0

## Built with: Xcode 14.3.1

### Changes:
- Updated Home Screen UI to make starting a chat more clear
- `SnapKit` dependency has been removed
- iPad navigation enhancements

### Bug Fixes:


# 11.0.0

## Built with: Xcode 14.3.0

### Changes:
- CMDMBProgressHUD dependency has been removed
- OpenTok dependency has been replaced with AmazonChimeSDK-No-Bitcode for enhanced reliability and compliance
- CirrusMD SDK and it's dependancies now fully support ARM Mac simulators natively starting with this release

### Bug Fixes:
- Fix for larger font accessibility

# 10.5.0

## Built with: Xcode 14.2.0

### Changes:
- Adds Pharmacy search module to assessments
- Removed UDF dependency

### Bug Fixes:

# 10.4.1

## Built with: Xcode 14.2.0

### Changes:
- Rolled back OpenTok pod to `2.23.1`, the latest was causing intermittent issues with video

### Bug Fixes:

# 10.4.0

## Built with: Xcode 14.2.0

### Changes:
- Enhanced patient address capture
- Assessments now show required fields text and all required fields in assessments are now marked with `*`
- Updated all dependancies
- Display `no_stream_access_message` when there are no active streams over the Patient Stream Picker

### Bug Fixes:
- Fix to scrolling of assessments on iPad

# 10.3.0

## Built with: Xcode 14.2.0

### Changes:
- Full support for Dark Mode
- New Logging system with multiple log levels and more readable logs
- The SDK is now shipped as an XCFrameowrk, resulting in a much smaller install size

### Bug Fixes:
- Some fixes to accessibility

# 10.2.0

## Built with: Xcode 13.4.1

### Changes:
- Spanish translation improvements

### Bug Fixes:

# 10.1.1

## Built with: Xcode 13.4.1

### Changes:
- Removed `CMDKTVJSONWebToken` dependency and replaced it with a native solution

### Bug Fixes:

# 10.1.0

## Built with: Xcode 13.4.1

### Changes:
- Added Spanish Localization support
- Added `Language` button in settings that deeplinks to CirrusMD settings page where the user can update their preferred language
- Added a Spanish translations confirmation alert to SDK landing view for when user changes their preferred language to Spanish from English
- Translated messages appear in chat stream if a message has been translated

### Bug Fixes:
- Fixed issue where action buttons stay active when encounter is dismissed by provider

# 10.0.0

## Built with: Xcode 13.3.1

### Changes:
- Added assessments feature, which will allow patients to receive and submit GAD7, PHQ9, and ACT questionnaires. Mobile Clients that are on 10.0.0+ will receive a native experience questionnaire, while older versions will receive a URL link to complete the assessment outside of the SDK experience.

### Bug Fixes:

# 9.5.0

## Built with:

### Changes:
- Added account delete feature, which enables users to disable their account, and request that their account be deleted. NOTE: This is used internally for the CirrusMD developer team. We DO NOT recommend setting this flag to true, without consent from CirrusMD. Please talk to your CirrusMD Account Manager before enabling this feature
- Added New DE&I fields can be updated in user's profile settings. DE&I can now be controlled via CirrusMD's manage
- Cross channel transfer feature allows users to transfer to new chat, if and when the provider transfers the patient.
- Video chat/call requests now appear as an in-chat message, so users can now join a video call effortlessly.

### Bug Fixes:

# 9.4.0

## Built with:

### Changes:
- Added Payor Plans to Patient to support Insurance verification
- Added Insurance verification capability
- Improvements to video error reporting

### Bug Fixes:
- Improvements to button handling of larger font accessibility
- Improved layout of Queue Status and State Selection stream elements

# 9.3.1

### Bug Fixes:
- Fixed bug in settings where a patient was limited in the number of characters they could enter for important patient medical fields

# 9.3.0

### Changes:
- Added the ability for the user to set a preferred name, preferred pronouns, and gender Identity, in profile settings
- Preferred name for Patient (not Dependent) is now displayed in the chat, stream picker, and family picker.
- Added pronouns text to event stream message author label

### Bug Fixes:
- Fixed bug in Patient Satisfaction Survey where the text input question would not grow with multi line feedback text

# 9.2.0

### Changes:
- Updates for Xcode 13 and iOS 15
- Updated the Kingfisher dependency to 6.3.1
- Updated the OpenTok dependency to 2.20.1
- Should now gracefully handle provider-deleted messages in the Event Stream (chat view)
- Done button now displays when patient initially reaches the final survey screen regardless of if the required questions are answered
- Added an 'ask location' feature that will allow users to select the US State in which they currently are located, in order to get matched up with a provider
- Email field in the technical support section of settings is dynamic
- Support tab in settings only displays when email or hotline data is present

### Bug Fixes:
- Fixed layout bug's caused by iOS 15
- Fixed Patient Satisfaction Survey reopening after completion caused by iOS 15

# 9.1.0

### Changes:
- Updated to Xcode 12.5
- Removed support for Buoy pre-encounter messages 

### Bug Fixes:
- Larger font accessibility improvements to patient satisfaction survey
- Changed 'dependent' verbiage to 'minor dependent'
- The Avatar, patient name, and the chevron icon (shown on the Channels of care) should now be one clickable unit that will navigate the user to the patient selector

# 9.0.0

### Changes:
- Removed Starscream dependency.
- Removed Appboy-iOS-SDK (aka Braze) dependency.
- Removed brazeOptions from CirrusMDConfig.
- Updated OpenTok dependency.

### New Features:
- Changed design on the stream picker view to navigate to My Family view.
-  Added a 'Add Minor Dependent' button to My Family Settings view, which is enabled/disabled in Manage. This new button navigates the user to a form that allows the user to add a minor dependent.
- Added Minor Dependent form to allow users to add their minor dependents, using first name, last name, DOB, and zipcode.

### Bug Fixes:
- Fixed an issue with parsing metadata on streams.
- Fixed an issue where the patient sat survey done button may not show for users with slow connections.
- Fixed an isse where dark mode could cause white on white text in patient satisfaction survey.
- Fixed an issue where an erroneous error message could display when exiting a queue.
- Fixed an issue with the handling of streams with image uploads disabled.

# 8.0.1

### Changes:
- Updated the Appboy (aka Braze) dependency to version 4.0.2

# 8.0.0

### New Features:
- Module Stability. No more Xcode/Swift version matching. From now on CirrusMDSDK versions will work with all versions of Xcode (12.0 and up) and Swift (5.1 and up).
- Renamed CirrusMDSDK to CirrusMD for improved brevity/readability and to better match our Android SDK
- Removed the ObjectMapper dependency
- Added patient satisfaction survey capability, after a user completes an encounter
- Accessibility updates and improvements

### Bug Fixes:
- Fixed an issue where patients would be pushed all the way back to the channels of care view when ending a video session instead of landing back in the chat view

# 7.X.X
### 7.4.0
Built with: Xcode 12.4, Swift 5.3.2

### 7.3.0
Built with: Xcode 12.3, Swift 5.3.2

### 7.2.0
Built with: Xcode 12.2, Swift 5.3.1

### 7.1.0
Built with: Xcode 12.1, Swift 5.3

### 7.0.0
Built with: Xcode 12.0.1, Swift 5.3

### New Features:
- Added rightBarButtonItems property to CirrusMDSDKConfig, which adds right bar button items to the navigation bar that the CirrusMDSDK view controller is presented in. For example this can be used to add a "Done" button when presenting the SDK modally.
- Moved settings button from the navigation bar down to the user header view to accomdate the new rightBarButtonItems feature
- Added a confirmation alert when the user is signing out to prevent accidental sign outs
- Added a security feature that allows the SDK to recover from certificate pinning failures
- Removed the ReachabilitySwift dependency
- Removed the 'Then' dependency
- Removed the RNCrypto dependency
- Moved to a custom podspec of Starscream with the correct iOS deployment target
- Moved to a custom podspec of KTVJSONWebToken with the correct iOS deployment target
- Moved to a custom podspec of MBProgressHUD with the correct iOS deployment target
- Moved to a custom podspec of ObjectMapper with the correct iOS deployment target and swift version
- Updated dependencies

### Bug Fixes:
- Fixed layout issues with extra large accessibility font sizes
- Fixed an issue where the plan name and/or details could be missing for some channels on the channels of care view
- Fixed an issue where the red dot (unread message indicator) could appear for a stream on the channels of care view before a provider had been assigned or sent a message, most common when chatting as a dependent
- Fixed constraint failures in the patient stream and encounter view controllers. This did not impact the user experience but was dirtying the app output logs when developing with the CirrusMDSDK.
- Fixed an issue where the dependents button could incorrectly show or hide when signing out as one user and then signing in as a different user

# 6.X.X
### 6.2.0
Built with: Xcode 12.2, Swift 5.3.1

### 6.1.0
Built with: Xcode 12.1, Swift 5.3

### 6.0.0
Built with: Xcode 12.0.1, Swift 5.3

### New Features:
- Integrated the Braze SDK and added brazeOptions to CirrusMDSDKConfig to control the Braze SDK. By default brazeOptions is nil and thus the Braze SDK will not be initialized or used in any way.
- Added "Marketing Messages" opt out in Settings. Only appears if Braze SDK is enabled.
- Renamed shouldShowRemoteNotification to shouldPresentNotification and onRemoteNotificationSelected to didReceiveNotification to better match the Apple UserNotifications framework patterns.
- Added additional shouldPresentNotification and didReceiveNotification that allow consumers to pass the exact payloads recieved in their UNUserNotificationCenterDelegate. This simplifies the integration. 
    - Note: didReceiveNotification(center: UNUserNotificationCenter, response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) should be always be used when the Braze SDK is enabled by setting the brazeOptions on CirrusMDSDKConfig.
- Added launchOptions to the CirrusMDSDKConfig. This allows the CirrusMDSDK to handle notification that were received while the app was not running and thus were passed to the app on launch. Previously the parent app would have to manually hand these off to the CirrusMDSDK in a non-obvious manner.
- Added support for messages with headlines.

### Bug Fixes:
- Fixed an issue where the edit profile picture pop-over on iPad was misplaced and/or empty


# 5.X.X
### 5.4.0
Built with: Xcode 12.1, Swift 5.3

### 5.3.0
Built with: Xcode 12.0.1, Swift 5.3

### 5.2.0
Built with: Xcode 11.7, Swift 5.2.4

### 5.1.0
Built with: Xcode 11.6, Swift 5.2.4

### 5.0.0
Built with: Xcode 11.5, Swift 5.2.4

### New Features:
- Added the enableUserLogOut property to CirrusMDSDKConfig which controls whether the "Sign Out" option exists inside of the SDK which allows the user to manually sign out of the CirrusMDSDK. For example the Sign Out option can exist in the Settings view or in 401 error alerts. The manual user Sign Out actions are what trigger the userLoggedOut function on CirrusMDSDKDelegate. The enableUserLogOut property defaults to false.
- Added the showDebugInSettings property to CirrusMDSDKConfig which controls whether the "Debug" option shows in the Settings view. This item in Settings presents the same view controller that can be manually accessed at CirrusMDSDK.singleton.debugViewController(). The showDebugInSettings property defaults to false.
- Implemented a new queue status UI where the all of the information is presented directly in the stream view
- Add a new queue status to inform patients when there is a queue in a stream and how many patients are in that queue before they send a message
- Added an "Exit Queue" button to the queue status UI that allows the patient to leave the queue
- Implemented a new UI to inform the patient when the stream is in off-hours
- Removed the message input bar when the stream is off-hours so that the patient cannot send a message
- Improved the UI and UX of the Profile view to make it easier for users to edit their profile
- Added the patient concern hotline to the Support view under Settings
- Added the userAgentPrefix property to CirrusMDSDKConfig that allows the addition of a custom prefix to the User Agent that the SDK sends. This defaults to nil which means there will be no custom prefix on the User Agent.
- Improved/standardized the User Agent sent by the SDK
- Improved the empty streams state on iPad
- Improved WebSocket error handling

### Bug Fixes:
- Fixed a label on the channels of care view getting cut off when the system accessibility was set to larger font sizes (note: fixed for the normal accessibility font sizes. Extra large accessibility font sizes not supported.)
- Fixed an issue that could cause the same alert to be shown more than once
- Fixed an issue where a provider's initials could be missing on the channels of care view


# 4.X.X
### 4.0.0
Built with: Xcode 11.5, Swift 5.2.4

### 4.1.0
Built with: Xcode 11.6, Swift 5.2.4

### 4.2.0
Built with: Xcode 11.7, Swift 5.2.4

### New Features:

- Renamed CirrusMDSDKSession to CirrusMDSDK
- Refactored messagesViewController() to viewController for a cleaner syntax and to better communicate that it is a single view controller that is not recreated when accessing
- Moved the logLevel setting into CirrusMDSDKConfig
- Moved all of the color settings into CirrusMDSDKConfig and removed CirrusMDSDKColorConfig 
- Added a Settings view where the user can edit their profile and see some other options. This is accessed from a button in the navigation bar on channels of care. This is turned on and off by the enableSettings property in the config. This defaults to being disabled.
- Added a Support section to Settings to allow users to contact support.
- Added support for dependents. This allows the user to switch to a dependent so that the dependent may communicate with a provider. This feature is turned on and off by the enableDependents property in the config. This defaults to being disabled.
- Added a userLoggedOut function to CirrusMDSDKDelegate so that the parent app can recieve a call back when the user uses the Settings view to log out.
- Added a current user header to the channels of care view that shows the current user's image and name. This changes to a dependent's image and name when switching to to a dependent.
- Added userLoggedIn function to CirrusMDSDKDelegate
- Added a debugViewController function that returns a view controller that displays debug information
- Added support for cross channel transfers
- Added UI styling for multiple action message types such as transfers
- Added UI to display the inactive message on inactive streams
- Added support for eVisit messages in streams
- Changed color settings to be UIColors instead of hex strings
- Improved the broadcasting of the patient's typing events
- When presenting any navigation controllers the SDK will match the styling of the navigation controller being used to present the primary view controller of the SDK. If the primary view controller is not presented in a navigation controller the SDK will fall back to standard colors
- Made the result of onRemoteNotificationSelected discardable
- Added the SDK version to the User Agent
- Removed the JTSImageViewController dependency and replaced it with a homegrown solution
- Minor dependency updates

### Bug Fixes:
- Fixed empty white space between keyboard and input bar
- Fixed a race condition that could result in a freeze and/or crash on iPad
- Fixed a bug that could present an unexpected failure alert when registering for push notifications
- Fixed attachment icon. It should now be a paperclip, for parity with web. 
- Fixed an issue where links would not show up in welcome messages if the parent app's global tint was set to white
- Fixed an issue where the tokentState would report as valid before it had been confirmed for the particular user being loaded
- Set the date picker used to edit Date of Birth to use the wheels style on iOS 14
- Fixed an issue where a stream would still show a provider's info in the channels of care view after an encounter had been completed
- Fixed an issue where a pre-encounter alert could pop up when an encounter is completed and the patient is still viewing the stream
- Updated the max image size and JPEG quality to match the API


# 1.9.4

Built with:
- Xcode 11.6, Swift 5.2

Enhancements:

- Updated build to Xcode 11.6

# 1.9.3

Built with:
- Xcode 11.3.1, Swift 5.1

Note:
- This is the same change as 1.9.2 but it is built off of 1.9.0 with Xcode 11.3.1 and Swift 5.1

Enhancements:

- Updated pinned SSL certificates

# 1.9.2

Built with:
- Xcode 11.4, Swift 5.2

Enhancements:

- Updated pinned SSL certificates

--- 
# DEPRECATED: All builds below this line are deprecated and will not work starting on 10/02/2020

# 1.9.1

Built with:
- Xcode 11.4, Swift 5.2

Enhancements:

- Updated build to Xcode 11.4 and Swift 5.2

# 1.9.0

Built with:
- Xcode 11.3.1, Swift 5.1

Enhancements:

- Added new logging options. You can now set logLevel on CirrusMDSDKSession to none or verbose. When set to verbose the SDK will print extensive logging to the debugger's console and the device's console for debugging purposes. The logLevel defaults to none.
- Fixed cases where a stream would automatically be pushed when it wasn't supposed to be.

# 1.8.3

Built with:
- Xcode 11.3.1, Swift 5.1

Enhancements:

- Do not show pre-encounter alert (patient billing alert) if the header and body are empty

# 1.8.2

Built with:

- Xcode 11.3, Swift 5.1

Enhancements:

- Fixed an issue that could cause errors around dependency modules when building

# 1.8.1

Built with:

- Xcode 11.3, Swift 5.1

Enhancements:

- Added Provider Bio view to applicable streams
- Fixed an issue that could cause a crash when requesting permission to access the camera or photo library

# 1.8.0 / 2019-11-26

Built with:

- Xcode 11.2.1, Swift 5.1

Enhancements:

- Added support for high deductible patient billing alerts

# 1.7.1 / 2019-11-12

Built with:

- Xcode 11.1, Swift 5.1

Enhancements:

- Fixed an issue where errant HTTP failure alerts would occasionally appear

# 1.7.0 / 2019-9-11

Built with:

- Xcode 11.1, Swift 5.1

Enhancements: 

- Updated to Xcode 11 and Swift 5.1
- Added video chat support
- Fixed an issue around empty avatar image URLs
- Fixed an issue that would allow users to send a message to an inactive stream
- Fixed an issue where push tokens that we converted to strings would be malformed on some devices
- Fixed a UI issue when the parent app is in dark mode

# 1.6.0 / 2019-6-18

Built with:

- Xcode 10.3, Swift 5.0

Enhancements: 

- Added external channels support
- Added push notification support

# 1.5.0 / 2019-6-18

Built with:

- Xcode 10.2.1, Swift 5.0

Enhancements: 

- Added the ability to enable/disable adding attachments via the back end

Bug fixes:

- Fixed an issue with the queue/stream not updating on encounter updates

# 1.4.3 / 2019-05-21

Built with:

- Xcode 10.2.1, Swift 5.0

Enhancements: 

- Updated dependencies for Swift 5

# 1.4.2 / 2019-04-26

Built with:

- Xcode10.1, Swift 4.2

This is the last release that will support Swift < 5.0

# 1.4.1 / 2019-02-11

* Internal release details. No code changes. 

# 1.4.0 / 2019-01-31

Bug fixes:

* Websocket activity no longer occurs when the app is not active.

# 1.3.0 / 2018-10-19

Enhancements:

* Restores Swift 4.2 support
* Ability to access multiple programs of care
* Show the plan name in the navigation bar instead of the provider group ame

Bug fixes:

* Fix User Agent string typo

# 1.2.0 / 2018-10-10

Enhancements:

* Downgraded to Swift 4.1 

This was a special release for a specific customer. Please do not use this
version in your production application.

# 1.1.0 / 2018-10-01

Enhancements:

* Swift 4.2 support
* Accessibility additions
* Ability to configure colors
* Removed image cropping/editing before uploads
* Progress Notes are now consistent with Android and Web
* Removed icons from PEQ status
* Removed "attached an image:" text from uploaded images
* Removed the hi-five icon from the welcome screen

Bug Fixes:

* Fixed a bug when dismissing images, the underlying cell is no longer grey
* Fixed a bug that prevented image thumbnails from displaying for some users

# 1.0.5 / 2018-08-08

Bug Fixes:

* Improved camera and photo library permission handling
* Updated VoiceOver labels
* Explicit text input tint color is black

# 1.0.2 / 2018-07-24

Bug Fixes:

* Resize uploaded images to a max width and/or height of 4000 pixels
* Remove dependency on libswiftaccelerate

# 1.0.1 / 2018-07-19

Bug Fixes:

* Updates AlertController presentation logic

# 1.0.0 / 2018-07-11

Enhancements:

* Adds accessibility labels, hints, and announcements

# 0.2.2 / 2018-01-19

Enhancements:

* Add support for unknown and hot patient states to encounter
* Show message's created at in the message stream

Bug Fixes:

* Various UI bug fixes and tweaks

# 0.2.0 / 2017-12-08

Enhancements:

* Add Camera and Library usage descriptions to plist
* Update the logged out icon
* Show error when no token is found

# 0.1.0 / 2017-11-27

Enhancements:

* First release of CirrusMDSDK

