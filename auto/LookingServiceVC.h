//
//  LookingServiceVC.h
// aditya
//
//  Created by // aditya on 11/23/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GooglePlaces;
@import GoogleMaps;
@import GooglePlacePicker;
@import Firebase;

//constant
#import "Constant.h"
#import "Macros.h"
#import "GlobalValues.h"

//other
#import "CurrentLocationVC.h"
#import "MainViewController.h"
#import <CoreLocation/CoreLocation.h>



@interface LookingServiceVC : UIViewController<CLLocationManagerDelegate,GMSPlacePickerViewControllerDelegate>{
    CLLocationManager* locationManager;
    GlobalValues *objGlobal;
    NSInteger intRegDeviceTimerCount;
}


@property (strong, nonatomic) IBOutlet UIView *viewMain;

@property (strong, nonatomic) IBOutlet UILabel *lblLkngForService;
@property (strong, nonatomic) IBOutlet UILabel *lblEnableLocation;
@property (strong, nonatomic) IBOutlet UILabel *lblOr;

@property (strong, nonatomic) IBOutlet UIView *viewLocationBtn;

@property (strong, nonatomic) IBOutlet UIButton *btnChooseYourCity;
@property (strong, nonatomic) IBOutlet UIButton *btnChooseLocation;


- (IBAction)btnchooseLocationAction:(id)sender;
- (IBAction)btnChooseYourcityAction:(id)sender;

-(void)initMethod;
-(void)initLocation;
-(void)viewSetUp;

-(void)setViews;
-(void)setLbl;
-(void)setBtn;

-(void)presentMainVC;
-(void)getUserCity:(CLLocation *)loc;

-(void)save_FCM_ID;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index ;


@end
