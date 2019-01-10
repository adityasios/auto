//
//  SupportVC.h
// aditya
//
//  Created by // aditya Pro1 on 23/02/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Messages;
@import MessageUI;

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "Reachability.h"
#import "WebServiceConstant.h"
#import "DejalActivityView.h"
#import "Network.h"
#import "BasicUtility.h"

//custom cell
#import "SupportCell.h"


@interface SupportVC : UIViewController<UITableViewDataSource,UITableViewDelegate,MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnClear;
@property (strong, nonatomic) IBOutlet UITableView *  tblv;


-(void)initMethod;

-(void)viewSetUp;
-(void)setNavBar;
-(void)customNavTitle:(NSString *)str;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;

@end
