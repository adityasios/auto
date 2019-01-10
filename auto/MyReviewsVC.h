//
//  MyReviewsVC.h
// aditya
//
//  Created by // aditya on 11/23/17.
//  Copyright © 2017 // aditya. All rights reserved.
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

//custom cell
#import "MyReviewsCell.h"

//model
#import "VehicleListModel.h"
#import "ReviewListModel.h"


//3rd party
#import  <SDWebImage/UIImageView+WebCache.h>
#import  <UIView+WebCache.h>
#import "UIImageView+WebCache.h"



@interface MyReviewsVC : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    GlobalValues *objGlobal;
    NSMutableArray * reviewListArray;
    NSDateFormatter * dateFormatter;
}

@property (strong, nonatomic) IBOutlet UITableView * tblViewReviews;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView * activity;

-(void)initMethod;
-(void)customBackButton;
-(void)webCallForGetReviewList;
-(void)parsingWebCall:(NSDictionary *)dict;

@end
