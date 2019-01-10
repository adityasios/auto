//
//  TermsAndConditionVC.m
// aditya
//
//  Created by // aditya Pro1 on 23/02/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "TermsAndConditionVC.h"

@interface TermsAndConditionVC ()

@end

@implementation TermsAndConditionVC



#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self  viewSetUp];
    [self webCallForGetTermsAndConditions];
}


#pragma mark - INIT METHOD
-(void)initMethod{
}


#pragma mark - VIEW SET UP
-(void)viewSetUp{
    [self setNavBar];
}


-(void)setNavBar {
    [self customNavTitle:@"Terms & Conditions"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(k adityaGreen);
}


-(void)customNavTitle:(NSString *)str{
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kQuicksand_Bold14, NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnClear,titleBarButton];
}



#pragma mark - WEBCALL
-(void)webCallForGetTermsAndConditions{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"terms" ofType:@"htm"]isDirectory:NO]]];
}




#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        } else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


@end

