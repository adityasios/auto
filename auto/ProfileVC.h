//
//  ProfileVC.h
// aditya
//
//  Created by // aditya on 11/3/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Messages;
@import MessageUI;


//constant
#import "Constant.h"
#import "Macros.h"
#import "WebServiceConstant.h"
#import "GlobalValues.h"
#import "BasicUtility.h"
#import "AlertConst.h"

//custom cell
#import "ServicesCustomCell.h"
#import "SpecialsCustomCell.h"

//other
#import "SubmitReviews1.h"
#import "Network.h"
#import "AvailabilityVC.h"
#import "MyReviewsVC.h"
#import "VendorRev.h"


//model
#import "VendorListModel.h"
#import "VendorDetail.h"

//3rd party
#import "UIViewController+LGSideMenuController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIView+WebCache.h>
#import "HCSStarRatingView.h"
#import "ActionSheetStringPicker.h"


@interface ProfileVC : UITableViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,MFMailComposeViewControllerDelegate> {
    GlobalValues * objGlobalValue;
    VendorDetail * objVendorDetail;
}



@property (nonatomic, strong)void(^passFavUnFav)(NSInteger intType,NSInteger index);
@property (strong, nonatomic) VendorListModel * objVendorList;



@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnBack;

@property (strong, nonatomic) IBOutlet UIImageView * imgVVendor;
@property (strong, nonatomic) IBOutlet UIImageView * imgVMTA;

@property (strong, nonatomic) IBOutlet UILabel * lblVendorName;
@property (strong, nonatomic) IBOutlet UILabel * lblRating;
@property (strong, nonatomic) IBOutlet UILabel * lbldistance;
@property (strong, nonatomic) IBOutlet UILabel * lblEmail;
@property (strong, nonatomic) IBOutlet UILabel * lblPhone;
@property (strong, nonatomic) IBOutlet UILabel * lblWeb;
@property (strong, nonatomic) IBOutlet UILabel * lblAboutUs;
@property (strong, nonatomic) IBOutlet UILabel * lblAboutUsText;
@property (strong, nonatomic) IBOutlet UILabel * lblAvailability;
@property (strong, nonatomic) IBOutlet UILabel * lblCheckAvailability;
@property (strong, nonatomic) IBOutlet UILabel * lblServices;
@property (strong, nonatomic) IBOutlet UILabel * lblReviews;
@property (strong, nonatomic) IBOutlet UILabel * lblSpecial;

@property (strong, nonatomic) IBOutlet UILabel * lblOffer1Title;
@property (strong, nonatomic) IBOutlet UILabel * lblOffer1Valid;

@property (strong, nonatomic) IBOutlet UILabel * lblOffer2Title;
@property (strong, nonatomic) IBOutlet UILabel * lblOffer2Valid;


@property (strong, nonatomic) IBOutlet UIButton * btnStar;
@property (strong, nonatomic) IBOutlet UIButton * btnLoc;
@property (strong, nonatomic) IBOutlet UIButton * btnFav;

@property (strong, nonatomic) IBOutlet HCSStarRatingView * viewStar;

@property (strong, nonatomic) IBOutlet UICollectionView * colView;

- (IBAction)barBtnBackAction:(id)sender;
- (IBAction)btnShareAction:(id)sender;
- (IBAction)btnPhoneAction:(id)sender;
- (IBAction)btnLocAction:(id)sender;
- (IBAction)btnFavAction:(id)sender;


-(void)initMethod;

-(void)viewSetUp;
-(void)setLbl;
-(void)setBtn;
-(void)setViews;
-(void)setImageView;
-(void)setServicePicker:(id)sender;
-(void)showSubmitReview:(ServiceTypeModel *)objService;
-(void)setOfferData;

-(void)setNavBar;
-(void)webcallForVendorDetail;
-(void)setVendorDetailWebData:(VendorDetail*)objVendorDetail;
-(void)webcallForVendorFavUnFavWithType:(NSInteger)type;
-(void)resetFavUnFavImageWithType:(NSInteger)type;



@end
