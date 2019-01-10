//
//  SubmitReviews1.h
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "UIViewController+MaryPopin.h"
#import "WebServiceConstant.h"
#import "GlobalValues.h"
#import "Validations.h"
#import "BasicUtility.h"
#import "Network.h"
#import "AlertConst.h"

//model
#import "VendorDetail.h"
#import "VendorListModel.h"
#import "ServiceTypeModel.h"




//3rd party
#import "UIViewController+LGSideMenuController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <UIView+WebCache.h>
#import "HCSStarRatingView.h"





@interface SubmitReviews1 : UIViewController<UITextViewDelegate>{
    GlobalValues * objGlobalValue;
}

@property (nonatomic, strong)void(^passSubmitReview)(NSInteger index);
@property (strong, nonatomic) VendorDetail * objVendorDetail;
@property (strong, nonatomic) VendorListModel * objVendorList;
@property (strong, nonatomic) ServiceTypeModel * objServiceType;

@property (strong, nonatomic) IBOutlet HCSStarRatingView * viewForStarRating;
@property (strong, nonatomic) IBOutlet UIImageView *imgServiceProvider;

@property (strong, nonatomic) IBOutlet UITextView *txtViewComment;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblRateServiceProvider;
@property (strong, nonatomic) IBOutlet UILabel *lblLeaveComment;

@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;



- (IBAction)btnSubmitAction:(id)sender;
- (IBAction)btnCancelAction:(id)sender;

-(void)initMethod;

-(void)setUpViews;
-(void)setLbl;
-(void)setViews;
-(void)setBtn;
-(void)setImageView;

-(void)webcallForSubmitReview;

@end
