//
//  VendorRev.h
// aditya
//
//  Created by // aditya Kumar on 3/15/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "Reachability.h"
#import "WebServiceConstant.h"
#import "DejalActivityView.h"
#import "Network.h"
#import "GlobalValues.h"
#import "BasicUtility.h"

//model
#import "VendorListModel.h"
#import "VendorRevModel.h"

//custom cell
#import "VendorRevCell.h"

//3rd party
#import  <SDWebImage/UIImageView+WebCache.h>
#import  <UIView+WebCache.h>
#import "UIImageView+WebCache.h"





@interface VendorRev : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    GlobalValues * objGlobal;
    BOOL isPaginationAllow;
    
    NSInteger  intPage;
    
    NSMutableArray * marrData;
    UIActivityIndicatorView * activityView;
    NSDateFormatter * dateformat;
}


@property (nonatomic, strong)void(^passNavBtn)(NSInteger intType);

@property (strong, nonatomic) IBOutlet UITableView * tblv;
@property (strong, nonatomic) VendorListModel * objVendorList;


-(void)initMethod;
-(void)viewSetUp;
-(void)customBackButton;
-(void)setActivityView;


-(void)webCallForGetReviewList;
-(void)parsingWebCall:(NSDictionary *)dict;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;

@end
