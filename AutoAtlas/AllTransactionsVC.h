//
//  AllTransactionsVC.h
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "Reachability.h"
#import "WebServiceConstant.h"
#import "BasicUtility.h"
#import "Network.h"
#import "GlobalValues.h"


//customcell
#import "AllTranscnsCell.h"

//model
#import "TransListModel.h"


@interface AllTransactionsVC : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    GlobalValues *objGlobal;
    NSMutableArray * marrTransData;
    NSDateFormatter * dateFormat;
}

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnBack;
@property (strong, nonatomic) IBOutlet UITableView *tblViewAllTransactions;

-(void)initMethod;
-(void)viewSetUp;
-(void)setNavBar;

-(void)webCallForGetTransList;
-(void)parsingGetTransList:(NSArray *)arr;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;

- (IBAction)barBtnBackAction:(id)sender;

@end
