//
//  CMDJTSImageViewController.h
//
//
//  Created by Jared Sinclair on 3/28/14.
//  Copyright (c) 2014 Nice Boy LLC. All rights reserved.
//

@import UIKit;

#import "CMDJTSImageInfo.h"

///--------------------------------------------------------------------------------------------------------------------
/// Definitions
///--------------------------------------------------------------------------------------------------------------------

@protocol CMDJTSImageViewControllerDismissalDelegate;
@protocol CMDJTSImageViewControllerOptionsDelegate;
@protocol CMDJTSImageViewControllerInteractionsDelegate;
@protocol CMDJTSImageViewControllerAccessibilityDelegate;
@protocol CMDJTSImageViewControllerAnimationDelegate;


typedef NS_OPTIONS(NSInteger, CMDJTSImageViewControllerBackgroundOptions) {
    CMDJTSImageViewControllerBackgroundOption_None = 0,
    CMDJTSImageViewControllerBackgroundOption_Scaled = 1 << 0,
    CMDJTSImageViewControllerBackgroundOption_Blurred = 1 << 1,
};

extern CGFloat const CMDJTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay;
extern CGFloat const CMDJTSImageViewController_DefaultBackgroundBlurRadius;

///--------------------------------------------------------------------------------------------------------------------
/// CMDJTSImageViewController
///--------------------------------------------------------------------------------------------------------------------

@interface CMDJTSImageViewController : UIViewController

@property (strong, nonatomic, readonly) CMDJTSImageInfo *imageInfo;

@property (strong, nonatomic, readonly) UIImage *image;

@property (assign, nonatomic, readonly) CMDJTSImageViewControllerBackgroundOptions backgroundOptions;

@property (weak, nonatomic, readwrite) id <CMDJTSImageViewControllerDismissalDelegate> dismissalDelegate;

@property (weak, nonatomic, readwrite) id <CMDJTSImageViewControllerOptionsDelegate> optionsDelegate;

@property (weak, nonatomic, readwrite) id <CMDJTSImageViewControllerInteractionsDelegate> interactionsDelegate;

@property (weak, nonatomic, readwrite) id <CMDJTSImageViewControllerAccessibilityDelegate> accessibilityDelegate;

@property (weak, nonatomic, readwrite) id <CMDJTSImageViewControllerAnimationDelegate> animationDelegate;

/**
 Designated initializer.
 
 @param imageInfo The source info for image and transition metadata. Required.
  
 @param backgroundOptions Currently, either scaled-and-dimmed, or scaled-dimmed-and-blurred. 
 The latter is like Tweetbot 3.0's background style.
 */
- (instancetype)initWithImageInfo:(CMDJTSImageInfo *)imageInfo
                  backgroundStyle:(CMDJTSImageViewControllerBackgroundOptions)backgroundOptions;

/**
 CMDJTSImageViewController is presented from viewController as a UIKit modal view controller.
 
 It's first presented as a full-screen modal *without* animation. At this stage the view controller
 is merely displaying a snapshot of viewController's topmost parentViewController's view.
 
 Next, there is an animated transition to a full-screen image viewer.
 */
- (void)showFromViewController:(UIViewController *)viewController;

/**
 Dismisses the image viewer. Must not be called while previous presentation or dismissal is still in flight.
 */
- (void)dismiss:(BOOL)animated;

@end

///--------------------------------------------------------------------------------------------------------------------
/// Dismissal Delegate
///--------------------------------------------------------------------------------------------------------------------

@protocol CMDJTSImageViewControllerDismissalDelegate <NSObject>

/**
 Called after the image viewer has finished dismissing.
 */
- (void)imageViewerDidDismiss:(CMDJTSImageViewController *)imageViewer;

@end

///--------------------------------------------------------------------------------------------------------------------
/// Options Delegate
///--------------------------------------------------------------------------------------------------------------------

@protocol CMDJTSImageViewControllerOptionsDelegate <NSObject>
@optional

/**
 The background color of the image view itself, not to be confused with the background
 color for the view controller's view. 
 
 You may wish to override this method if displaying an image with dark content on an 
 otherwise clear background color (such as images from the XKCD What If? site).
 
 The default color is `[UIColor clearColor]`.
 */
- (UIColor *)backgroundColorImageViewInImageViewer:(CMDJTSImageViewController *)imageViewer;

/**
 Defaults to `CMDJTSImageViewController_DefaultAlphaForBackgroundDimmingOverlay`.
 */
- (CGFloat)alphaForBackgroundDimmingOverlayInImageViewer:(CMDJTSImageViewController *)imageViewer;

@end

///--------------------------------------------------------------------------------------------------------------------
/// Interactions Delegate
///--------------------------------------------------------------------------------------------------------------------

@protocol CMDJTSImageViewControllerInteractionsDelegate <NSObject>
@optional

/**
 Called when the image viewer is deciding whether to respond to user interactions.
 
 You may need to return NO if you are presenting custom, temporary UI on top of the image viewer. 
 This method is called more than once. Returning NO does not "lock" the image viewer.
 */
- (BOOL)imageViewerShouldTemporarilyIgnoreTouches:(CMDJTSImageViewController *)imageViewer;

/**
 Called when the image viewer is deciding whether to display the Menu Controller, to allow the user to copy the image to the general pasteboard.
 */
- (BOOL)imageViewerAllowCopyToPasteboard:(CMDJTSImageViewController *)imageViewer;

@end

///--------------------------------------------------------------------------------------------------------------------
/// Accessibility Delegate
///--------------------------------------------------------------------------------------------------------------------


@protocol CMDJTSImageViewControllerAccessibilityDelegate <NSObject>
@optional

- (NSString *)accessibilityLabelForImageViewer:(CMDJTSImageViewController *)imageViewer;

- (NSString *)accessibilityHintZoomedInForImageViewer:(CMDJTSImageViewController *)imageViewer;

- (NSString *)accessibilityHintZoomedOutForImageViewer:(CMDJTSImageViewController *)imageViewer;

@end

///---------------------------------------------------------------------------------------------------
/// Animation Delegate
///---------------------------------------------------------------------------------------------------

@protocol CMDJTSImageViewControllerAnimationDelegate <NSObject>
@optional

- (void)imageViewerWillBeginPresentation:(CMDJTSImageViewController *)imageViewer withContainerView:(UIView *)containerView;

- (void)imageViewerWillAnimatePresentation:(CMDJTSImageViewController *)imageViewer withContainerView:(UIView *)containerView duration:(CGFloat)duration;

- (void)imageViewer:(CMDJTSImageViewController *)imageViewer willAdjustInterfaceForZoomScale:(CGFloat)zoomScale withContainerView:(UIView *)containerView duration:(CGFloat)duration;

- (void)imageViewerWillBeginDismissal:(CMDJTSImageViewController *)imageViewer withContainerView:(UIView *)containerView;

- (void)imageViewerWillAnimateDismissal:(CMDJTSImageViewController *)imageViewer withContainerView:(UIView *)containerView duration:(CGFloat)duration;

@end








