//
//  NotificationsVC.h
// aditya
//
//  Created by // aditya on 11/23/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NotificationCell.h"
#import "Constant.h"
#import "Macros.h"
#import "GlobalValues.h"
#import "LookingServiceVC.h"
#import "NotModel.h"


@interface NotificationsVC : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    GlobalValues * objGlobalValue;
    NSInteger intPage;
    BOOL isPaginationAllow;
    
    
    NSMutableArray * marrNotifications;
    NSDateFormatter * dateformat;
}


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView * activity;

@property (strong, nonatomic) IBOutlet UIBarButtonItem * btnBack;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnClear;

@property (strong, nonatomic) IBOutlet UITableView * tblViewNotifications;

@property (strong, nonatomic) IBOutlet UIButton * btnViewActivities;
@property (strong, nonatomic) IBOutlet UIView * viewMainNoNotification;

@property (strong, nonatomic) IBOutlet UILabel *lblNoNotices;
@property (strong, nonatomic) IBOutlet UILabel *lblUpToDate;



-(void)initMethod;
-(void)viewSetUp;
-(void)setNavBar;
-(void)setBtn;
-(void)setLbl;

-(void)webCallForNotList;
-(void)parsingWebCallForNotList:(NSArray *)arrList;


- (IBAction)btnGoToHomeAction:(id)sender;
- (IBAction)btnclickAction:(id)sender;
- (IBAction)barBtnBackAction:(id)sender;

@end
