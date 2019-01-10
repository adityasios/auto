//
//  ProfileBaseVC.h
//  AutoAtlas
//
//  Created by webmazix on 11/23/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"

//3rd party
#import "CarbonKit.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIView+WebCache.h>

//other
#import "VehicleListVC.h"
#import "MyReviewsVC.h"
#import "EditProfileVC.h"
#import "GlobalValues.h"
#import "BasicUtility.h"




@interface ProfileBaseVC : UIViewController <CarbonTabSwipeNavigationDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    GlobalValues *objGlobal;
    CarbonTabSwipeNavigation *carbonTabSwipeNavigation;
    NSArray *items;
}


@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constTop;

@property (strong, nonatomic) IBOutlet UIView * viewFooter;
@property (strong, nonatomic) IBOutlet UIView * tabBarView;
@property (strong, nonatomic) IBOutlet UIView * viewProfileImage;
@property (strong, nonatomic) IBOutlet UIView * viewProfileData;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnBack;
@property (strong, nonatomic) IBOutlet UIButton * btnEdit;
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;

@property (strong, nonatomic) IBOutlet UILabel *lblUserName;
@property (strong, nonatomic) IBOutlet UILabel *lblProfile;
@property (strong, nonatomic) IBOutlet UILabel *lblMobile;
@property (strong, nonatomic) IBOutlet UILabel *lblMobileNo;
@property (strong, nonatomic) IBOutlet UILabel *lblEmail;
@property (strong, nonatomic) IBOutlet UILabel *lblEmailAddress;

@property (strong, nonatomic) IBOutlet UIImageView * imgVProfile;


- (IBAction)btnEditAction:(id)sender;
- (IBAction)btnCameraAction:(id)sender;

-(void)initMethod;

-(void)viewSetup;
-(void)setImgV;
-(void)setLbl;
-(void)setViews;
-(void)customNavTitle:(NSString *)str;
-(void)setProfileData;

-(void)presentImagePicker;
-(void)webCallForPostProfileImage:(NSData *)dataImgProfile WithImage:(UIImage *)imgProfile;
-(void)parsingDataForProfileWithImage:(UIImage *)imgProfile WithResponse:(NSDictionary *)dictData;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index ;

@end
