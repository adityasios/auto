//
//  ActiveSubscriptionVC.h
// aditya
//
//  Created by // aditya on 11/27/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActiveSubscrptnCell.h"
#import "Constant.h"
#import "Macros.h"

@interface ActiveSubscriptionVC : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *viewMainHeader;
@property (strong, nonatomic) IBOutlet UILabel *lblAutoRenewal;
@property (strong, nonatomic) IBOutlet UISwitch *switchSelect;
@property (strong, nonatomic) IBOutlet UILabel *lblActive;
@property (strong, nonatomic) IBOutlet UILabel *lblCancel;
@property (strong, nonatomic) IBOutlet UILabel *lblCurrentPlan;
@property (strong, nonatomic) IBOutlet UILabel *lblNoOfVehicles;
@property (strong, nonatomic) IBOutlet UILabel *lblPlanActive;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;

@property (strong, nonatomic) IBOutlet UILabel *lblSince;
@property (strong, nonatomic) IBOutlet UITableView *tblViewActiveSubsrcptns;
@property (strong, nonatomic) IBOutlet UIView *viewCurrentPlan;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnBack;

- (IBAction)barBtnBackAction:(id)sender;

-(void)setUpViews;
-(void)setViews;
-(void)setLbl;
-(void)setNavBar;
@end
