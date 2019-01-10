//
//  AppDelegate.h
// aditya
//
//  Created by // aditya on 10/30/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "GlobalValues.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

//lib
@import GooglePlaces;
@import GoogleMaps;
@import GoogleSignIn;
#import <SAMKeychain.h>
@import Firebase;
@import FirebaseInstanceID;
@import FirebaseMessaging;
@import UserNotifications;
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>


@interface AppDelegate : UIResponder<UIApplicationDelegate,UNUserNotificationCenterDelegate>{
    GlobalValues *objGlobal;
}


@property (strong, nonatomic) UIWindow *window;

-(void)getAllFontNames;
-(void)googleSetUp;
-(void)setCustomNotification;

@end

