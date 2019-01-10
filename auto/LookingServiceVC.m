//
//  LookingServiceVC.m
// aditya
//
//  Created by // aditya on 11/23/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "LookingServiceVC.h"

@interface LookingServiceVC ()

@end

@implementation LookingServiceVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMethod];
    [self  initLocation];
    [self viewSetUp];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [locationManager stopUpdatingLocation];
}




#pragma mark - VC LIFE CYCLE
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
    [self  save_FCM_ID];
}



#pragma mark - INIT LOCATION
-(void)initLocation{
    if (locationManager == nil){
        
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        [locationManager requestWhenInUseAuthorization];
        
        if ([CLLocationManager locationServicesEnabled]){
            if ([CLLocationManager authorizationStatus]== kCLAuthorizationStatusDenied ||  [CLLocationManager authorizationStatus]== kCLAuthorizationStatusNotDetermined){
            }else  if ([CLLocationManager authorizationStatus]== kCLAuthorizationStatusAuthorizedAlways ||  [CLLocationManager authorizationStatus]== kCLAuthorizationStatusAuthorizedWhenInUse){
                
                locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
                locationManager.distanceFilter = 10.0;
                [locationManager startUpdatingLocation];
            }
        }else{
            [self showAlertWithTitle:@"Location Permission Denied" Withsubtitle:@"To re-enable, please go to Settings and turn on Location Service for this app." withIndex:kIndexMaxValue ];
        }
    }
}



-(void)save_FCM_ID{
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    if (refreshedToken.length > 0 && objGlobal.str_deviceId.length > 0) {
        [self  webcallForDeviceToken:refreshedToken];
    }else{
        [NSTimer scheduledTimerWithTimeInterval:1.0   target:self  selector:@selector(timerRegisterDeviceWebcall:) userInfo:nil   repeats:YES];
    }
}


#pragma mark - VIEW SET UP
-(void)viewSetUp {
    [self.navigationController  setNavigationBarHidden:YES animated:YES];
    [self setViews];
    [self setLbl];
    [self setBtn];
}


-(void)setViews {
    self.viewMain.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.viewLocationBtn.layer.cornerRadius = 2.0;
}


-(void)setLbl {
    
    self.lblLkngForService.font = kQuicksand_Bold18;
    self.lblLkngForService.textColor = UIColorFromRGB(kappleWhite);
    
    self.lblEnableLocation.font = kQuicksand_Regular15;
    self.lblEnableLocation.textColor = UIColorFromRGB(kappleWhite);
    self.lblEnableLocation.text = @"We need to enable your location to find \n dealers near you";
    
    self.lblOr.font = kQuicksand_Bold13;
}


-(void)setBtn {
    
    [self.btnChooseLocation setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    self.btnChooseLocation.titleLabel.font = kQuicksand_Bold15;
    
    
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSForegroundColorAttributeName:UIColorFromRGB(kappleWhite),
                            NSFontAttributeName:kQuicksand_Bold15
                            };
    NSAttributedString * atr = [[NSAttributedString  alloc]initWithString:@"choose your city" attributes:dict1];
    [self.btnChooseYourCity setAttributedTitle:atr forState:UIControlStateNormal];
}






#pragma mark - LOCATION MANAGER DELEGATE
- (void)locationManager:(CLLocationManager *)manager    didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    if ([CLLocationManager authorizationStatus]== kCLAuthorizationStatusAuthorizedAlways ||  [CLLocationManager authorizationStatus]== kCLAuthorizationStatusAuthorizedWhenInUse){
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locationManager.distanceFilter = 10.0;
        [locationManager startUpdatingLocation];
    }
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation * location = [locations  lastObject];
    [self  getUserCity:location];
    
    
    objGlobal.str_lat =  [NSString  stringWithFormat:@"%f",location.coordinate.latitude];
    objGlobal.str_lon =  [NSString  stringWithFormat:@"%f",location.coordinate.longitude];
    
    NSLog(@"LAT LM = %@",objGlobal.str_lat);
    NSLog(@"LON LM = %@",objGlobal.str_lon);
}


#pragma mark  - SELECTOR METHOD
-(void)timerRegisterDeviceWebcall:(NSTimer *)timer {
    intRegDeviceTimerCount = intRegDeviceTimerCount +1;
    
    if (intRegDeviceTimerCount == 80) {
        [timer  invalidate];
    }
    
    NSLog(@"intRegDeviceTimerCount = %ld",intRegDeviceTimerCount);
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSLog(@"refreshedToken = %@",refreshedToken);
    
    if (refreshedToken.length > 0 && objGlobal.str_deviceId.length > 0) {
        [timer  invalidate];
        [self  webcallForDeviceToken:refreshedToken];
    }
}



#pragma mark -  BUTTON ACTIONS
- (IBAction)btnchooseLocationAction:(id)sender {
    if (objGlobal.str_lon.floatValue == 0 && objGlobal.str_lat.floatValue == 0) {
        [self showAlertWithTitle:kAlert Withsubtitle:kLocationValidate withIndex:kIndexMaxValue ];
    }else{
        [self  presentMainVC];
    }
}



- (IBAction)btnChooseYourcityAction:(id)sender {
    
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGBWithAlpha(kAutoAtlasGreen, 1.0)];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:nil];
    GMSPlacePickerViewController *placePicker =
    [[GMSPlacePickerViewController alloc] initWithConfig:config];
    placePicker.delegate = self;
    [self presentViewController:placePicker animated:YES completion:nil];
}



#pragma mark - GMSPlacePickerViewController Delegate
- (void)placePicker:(GMSPlacePickerViewController *)viewController didPickPlace:(GMSPlace *)place {
    // Dismiss the place picker, as it cannot dismiss itself.
    
    objGlobal.str_lat = [NSString  stringWithFormat:@"%f",place.coordinate.latitude];
    objGlobal.str_lon = [NSString  stringWithFormat:@"%f",place.coordinate.longitude];
    
    NSLog(@"LAT LM = %@",objGlobal.str_lat);
    NSLog(@"LON LM = %@",objGlobal.str_lon);
    
    [viewController dismissViewControllerAnimated:YES completion:^{
        [self  presentMainVC];
    }];
}



- (void)placePickerDidCancel:(GMSPlacePickerViewController *)viewController {
    // Dismiss the place picker, as it cannot dismiss itself.
    [viewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark  - WEBCALL
-(void)webcallForDeviceToken:(NSString *)fcm_token{
    
    NSString * strPost = [KBaseURL  stringByAppendingString:kRegister_user_device];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary  new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:objGlobal.str_deviceId forKey:kdevice_id];
    [mdictPara  setObject:fcm_token forKey:kfcm_id];
    [mdictPara  setObject:kIOS forKey:kdevice_type];
    [Network  postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError * error) {
        if (!error) {
            NSLog(@"Result  FCM = %@",result);
            NSString * strStatus = [result  objectForKey:kstatus];
            NSString * strmsg = [result  objectForKey:kMessage];
            if (strStatus.intValue == 1) {
                NSLog(@"webcallForDeviceToken result = %@",result);
            }else{
                NSLog(@"webcallForDeviceToken strmsg = %@",strmsg);
            }
        }else{
            NSLog(@"error.localizedDescription = %@",error.localizedDescription);
        }
    }];
}




#pragma mark -  PRESENT VC
-(void)presentMainVC{
    MainViewController * mainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [mainViewController setupWithType:0];
    
    [mainViewController setModalPresentationStyle:UIModalPresentationCustom];
    [mainViewController setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentViewController:mainViewController animated:YES completion:nil];
}



#pragma mark -  HELPER METHODS
-(void)getUserCity:(CLLocation *)loc{
    CLGeocoder *reverseGeocoder = [[CLGeocoder alloc] init];
    [reverseGeocoder  reverseGeocodeLocation:loc completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *myPlacemark = [placemarks objectAtIndex:0];
        NSString * countryName = myPlacemark.country;
        NSString * cityName= myPlacemark.subAdministrativeArea;
        
        objGlobal.str_UserCity = cityName;
        objGlobal.str_UserCountry = countryName;
        
        NSLog(@"CountryName: %@ MyCity: %@", countryName, cityName);
    }];
}







#pragma mark -  ALERT METHODS
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        } else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}



/*
 MainViewController *mainViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
 [mainViewController setupWithType:0];
 
 UIWindow *window = UIApplication.sharedApplication.delegate.window;
 window.rootViewController = mainViewController;
 [UIView transitionWithView:window duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
 }];
 */




@end
