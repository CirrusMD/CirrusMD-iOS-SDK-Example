# CirrusMD iOS SDK Changelog

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

