//
//  LeftMenuVC.h
// aditya
//
//  Created by // aditya on 10/31/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleSignIn;
#import <FBSDKLoginKit.h>
#import <FBSDKCoreKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "GlobalValues.h"

//custom cell
#import "Customcell.h"


//3rd party
#import "MainViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIView+WebCache.h>


//other
#import "NotificationsVC.h"
#import "ProfileBaseVC.h"
#import "AddNewVehicle.h"
#import "MyFavoritesVC.h"
#import "HomeVC.h"
#import "LoginVC.h"
#import "PrivacyPolicyVC.h"
#import "SupportVC.h"
#import "TermsAndConditionVC.h"
#import "ChangePassVC.h"


@interface LeftMenuVC : UIViewController <UITableViewDelegate, UITableViewDataSource,LGSideMenuDelegate> {
    NSArray * arrMenu;
    NSArray * arrMenuExtra;
    GlobalValues * objGlobal;
}


@property (strong, nonatomic) IBOutlet UIView *viewHeader;
@property (strong, nonatomic) IBOutlet UIImageView *imgProfileHeader;

@property (strong, nonatomic) IBOutlet UILabel *lblNameHeader;
@property (strong, nonatomic) IBOutlet UILabel *lblPlaceHeader;

@property (strong, nonatomic) IBOutlet UITableView *tblViewLeft;


-(void)intializerMethod;
-(void)initNotification;

-(void)viewSetUp;
-(void)setLbl;
-(void)setViews;
-(void)setImgV;
-(void)setHeaderData;
-(void)logOut;

-(void)shareApp;
-(void)rateApp;
-(void)showTermsCondition;
-(void)showPrivacyPolicy;
-(void)showSupport;

-(void)fbLogOut;
-(void)webcallForLogOut;

@end
