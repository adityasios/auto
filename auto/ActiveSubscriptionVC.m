//
//  ActiveSubscriptionVC.m
// aditya
//
//  Created by // aditya on 11/27/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "ActiveSubscriptionVC.h"

@interface ActiveSubscriptionVC ()

@end

@implementation ActiveSubscriptionVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    self.tblViewActiveSubsrcptns.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}


#pragma mark - VIEW SET UP
-(void)setUpViews {
    [self setViews];
    [self setLbl];
    [self setBtn];
    [self setNavBar];
}



-(void)setLbl {
    
    self.lblAutoRenewal.text = @"    Auto renewal \n on monthly basis";
    self.lblAutoRenewal.font = kQuicksand_Bold12;
    self.lblAutoRenewal.textColor = UIColorFromRGB(kappleWhite);
    
    self.lblActive.font = kQuicksand_Bold14;
    self.lblActive.textColor = UIColorFromRGB(kappleWhite);
    self.lblCancel.font = kQuicksand_Bold14;
    self.lblCancel.textColor = UIColorFromRGB(kappleWhite);
    
    self.lblCurrentPlan.textColor = UIColorFromRGB(kappleGrey);
    self.lblCurrentPlan.font = kQuicksand_Regular14;
    self.lblNoOfVehicles.textColor = UIColorFromRGB(k adityaGreen);
    self.lblNoOfVehicles.font = kQuicksand_Regular14;
    self.lblPlanActive.textColor =  UIColorFromRGB(k adityaGreen);
    self.lblPlanActive.font = kQuicksand_Regular14;
    self.lblSince.textColor = UIColorFromRGB(kappleLightGrey);
    self.lblSince.font = kQuicksand_Regular10;
    
    self.lblDate.textColor = UIColorFromRGB(kappleLightGrey);
    self.lblDate.font = kQuicksand_Regular10;
}

-(void)setBtn {
    [self.switchSelect addTarget:self action:@selector(flip:) forControlEvents:UIControlEventValueChanged];
}



-(void)setViews {
    self.viewMainHeader.backgroundColor = UIColorFromRGB(k adityaGreen);
    self.viewCurrentPlan.layer.cornerRadius = 8.0;
}


-(void)setNavBar {
    [self customNavTitle:@"Your active subscription"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(k adityaGreen);
}


-(void)customNavTitle:(NSString *)str{
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            kQuicksand_Bold12, NSFontAttributeName,
                                            [UIColor whiteColor], NSForegroundColorAttributeName,
                                            nil]
                                  forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnBack,titleBarButton];
    
}


-(void)flip:(id)sender {
    
    if ([self.switchSelect isOn]) {
        
        self.lblActive.textColor = UIColorFromRGB(kappleGrey);
        self.lblCancel.textColor = UIColorFromRGB(kappleWhite);
        [self.switchSelect setOn:NO];
    }
    else {
        
        self.lblCancel.textColor = UIColorFromRGB(kappleGrey);
        self.lblActive.textColor = UIColorFromRGB(kappleWhite);
        
        [self.switchSelect setOn:YES];
    }
}



#pragma mark - DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ActiveSubscrptnCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActiveSubscrptnCell" forIndexPath:indexPath];
    cell.lblTransactionNumber.font = kQuicksand_Regular12;
    cell.lblTransactionNumber.textColor = UIColorFromRGB(kappleDarkGrey);
    
    cell.lblPackageName.textColor = UIColorFromRGB(k adityaGreen);
    cell.lblPackageName.font = kQuicksand_Bold12;
    
    cell.lblSeperator.backgroundColor = UIColorFromRGB(kappleGrey);
    cell.lblDate.textColor = UIColorFromRGB(kappleLightGrey);
    cell.lblPrice.textColor = [UIColor blackColor];
    cell.lblPrice.font = kQuicksand_Bold16;
    cell.lblCancelled.font = kQuicksand_Bold10;
    
    if (indexPath.row%2 == 0) {
        cell.lblCancelled.textColor = [UIColor redColor];
        cell.lblCancelled.text = @"cancelled";
    }
    else {
        
        cell.lblCancelled.textColor = UIColorFromRGB(k adityaGreen);
        cell.lblCancelled.text = @"completed";
    }
    
    return cell;
}



#pragma mark  - ACTION METHOD
- (IBAction)barBtnBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
