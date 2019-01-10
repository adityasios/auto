//
//  SubsricptionsVC.h
//  AutoAtlas
//
//  Created by webmazix on 11/24/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "Reachability.h"
#import "WebServiceConstant.h"
#import "DejalActivityView.h"
#import "BasicUtility.h"
#import "Network.h"
#import "GlobalValues.h"
#import "AlertConst.h"

//model
#import "VehicleListModel.h"
#import "SubscriptionListModel.h"

//other
#import "AllTransactionsVC.h"
#import "ActiveSubscriptionVC.h"

//customcell
#import "SubscriptionCell.h"
#import "MyReviewsCell.h"

@import StoreKit;

@interface SubsricptionsVC : UIViewController <UITableViewDelegate, UITableViewDataSource,SKProductsRequestDelegate,SKPaymentTransactionObserver>{
    GlobalValues *objGlobal;
    SKProductsRequest * productsRequest;
    NSMutableArray * marrSubPlan;
    NSArray * arrValidPro;
    NSNumberFormatter * numberFormat;
    NSString * strsubid;
    SubscriptionListModel *objSubSel;
}


@property (strong, nonatomic) IBOutlet UITableView * tblVwSubsrcptns;

@property (strong, nonatomic) IBOutlet UIView * viewSelectPlan;
@property (strong, nonatomic) IBOutlet UIView * viewCurrentPlan;
@property (strong, nonatomic) IBOutlet UIView * viewCrtPlanBg;


@property (strong, nonatomic) IBOutlet UISwitch *switchSelect;

@property (strong, nonatomic) IBOutlet UILabel *lblOneTime;
@property (strong, nonatomic) IBOutlet UILabel *lblMonthly;
@property (strong, nonatomic) IBOutlet UILabel *lblSelectUrPlan;
@property (strong, nonatomic) IBOutlet UILabel *lblYourCurentPlan;
@property (strong, nonatomic) IBOutlet UILabel *lbl1Vehicle;
@property (strong, nonatomic) IBOutlet UILabel *lblFree;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnBack;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnMenu;


- (IBAction)barBtnMenuAction:(id)sender;

-(void)initMethod;
-(void)initInAppPurchase;

-(void)setUpViews;
-(void)setViews;
-(void)setLbl;
-(void)setBtn;
-(void)setNavBar;

- (BOOL)canMakePurchases;
- (void)purchaseMyProduct:(SKProduct*)product;

-(void)webCallForGetSubscription:(NSString *)planType;
-(void)webCallForSubscriptionStatus:(NSString *)transId withPaymentStatus:(NSString *)payStatus withError:(NSString *)err;

-(void)parsingGetSubscription:(NSDictionary *)dict;

@end
