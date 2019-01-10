//
//  PrivacyPolicyVC.h
// aditya
//
//  Created by // aditya Pro1 on 23/02/18.
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
#import "BasicUtility.h"


@interface PrivacyPolicyVC : UIViewController

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnClear;
@property (strong, nonatomic) IBOutlet UIWebView * webView;

-(void)initMethod;
-(void)viewSetUp;

@end
