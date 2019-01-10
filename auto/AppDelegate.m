//
//  AppDelegate.m
// aditya
//
//  Created by  on 10/30/17.
//  Copyright © 2017 . All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@end
@implementation AppDelegate



#pragma mark - APP DELEGATE
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //crashlaytics
    [Fabric with:@[[Crashlytics class]]];
    
    //google set up
    [self  googleSetUp];
    
    //fb set up
    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    
    
    //fcm
    [self getUniqueDeviceId];
    [self  registerForRemoteNotification];
    [FIRApp configure];
    [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(tokenRefreshNotification:) name:kFIRInstanceIDTokenRefreshNotification object:nil];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[FIRMessaging messaging] disconnect];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    
    if ([url.scheme  isEqualToString:kfb146329546061636]) {
        BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:app
                                                                      openURL:url
                                                            sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                                   annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
        return handled;
    }else{
        return [[GIDSignIn sharedInstance] handleURL:url
                                   sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                          annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
    }
    
}















#pragma mark - GOOGLE SET UP
-(void)googleSetUp{
    
    //autocomplete
    [GMSPlacesClient provideAPIKey:kGoogle_API_KEY];
    [GMSServices provideAPIKey:kGoogle_API_KEY];
    
    //signin
    [GIDSignIn sharedInstance].clientID = kGoogle_CLIENT_ID;
}






#pragma mark - REGISTER FOR REMOTE NOTIFICATION
-(void)registerForRemoteNotification{
    
    [UNUserNotificationCenter currentNotificationCenter].delegate = self;
    UNAuthorizationOptions authOptions = UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge;
    
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
        [self  setCustomNotification];
        if( !error ){
            dispatch_async(dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        }else{
            NSLog(@"error.localizedDescription  =%@",error.localizedDescription);
        }
    }];
}



-(void)setCustomNotification{
    UNNotificationAction * btnRemind = [UNNotificationAction actionWithIdentifier:kremind title:kRemindLater options:UNNotificationActionOptionDestructive];
    UNNotificationAction * btnCancel = [UNNotificationAction actionWithIdentifier:kcancel title:kCancel options:UNNotificationActionOptionNone];
    UNNotificationCategory * category = [UNNotificationCategory categoryWithIdentifier:kcatfcm actions:@[btnRemind,btnCancel] intentIdentifiers:@[] options:UNNotificationCategoryOptionNone];
    NSSet *categories = [NSSet setWithObject:category];
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:categories];
}







-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
    NSLog(@"deviceToken: %@", deviceToken);
    
    NSString * token = [NSString stringWithFormat:@"%@", deviceToken];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
    token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
}


#pragma mark  - NOT SEL REFRESH TOKEN
- (void)tokenRefreshNotification:(NSNotification *)notification {
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSLog(@"refreshedToken %@", refreshedToken);
    [self connectToFcm];
}




#pragma mark - REMOTE NOTIFICATION DELEGATE
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    //Called when a notification is delivered to a foreground app.
    NSLog(@"Userinfo willPresentNotification  %@",notification.request.content.userInfo);
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
}


-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler{
    
    NSLog(@"Userinfo didReceiveNotificationResponse  %@",response.notification.request.content.userInfo);
    NSLog(@"response.actionIdentifier  %@",response.actionIdentifier);
    
    if ([response.actionIdentifier  isEqualToString:UNNotificationDefaultActionIdentifier]) {
        NSLog(@"UNNotificationDefaultActionIdentifier");
    }else if ([response.actionIdentifier  isEqualToString:kcancel]){
        NSLog(@" inside kcancel");
    }else if ([response.actionIdentifier  isEqualToString:kremind]){
        NSLog(@" inside kremind");
    }
    completionHandler();
}







#pragma mark - HELPER METHOD
-(void)getAllFontNames{
   
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily){
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont){
            NSLog(@"Font name: %@", [fontNames objectAtIndex:indFont]);
        }
    }
}



- (void)connectToFcm {
    // Won't connect since there is no token
    if (![[FIRInstanceID instanceID] token]) {
        return;
    }
    
    // Disconnect previous FCM connection if it exists.
    [[FIRMessaging messaging] disconnect];
    [[FIRMessaging messaging] connectWithCompletion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Unable to connect to FCM. %@", error);
        } else {
            NSLog(@"Connected to FCM.");
        }
    }];
}



-(void)getUniqueDeviceId{
    objGlobal = [GlobalValues  sharedManager];
    NSString * strDevice = [SAMKeychain passwordForService:ktoken account:kHeader_Bearer];
    if (strDevice.length == 0) {
        NSString* Identifier = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
        BOOL isSaved =   [SAMKeychain  setPassword:Identifier forService:ktoken account:kHeader_Bearer];
        if (isSaved) {
            objGlobal.str_deviceId = Identifier;
        }
    }else{
        objGlobal.str_deviceId = strDevice;
    }
}


@end
