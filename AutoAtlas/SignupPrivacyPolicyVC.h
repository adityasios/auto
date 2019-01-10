//
//  SignupPrivacyPolicyVC.h
//  AutoAtlas
//
//  Created by WebMazix Pro1 on 23/02/18.
//  Copyright © 2018 webmazix. All rights reserved.
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
#import "AlertConst.h"


@interface SignupPrivacyPolicyVC : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView * webView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btn_Back;

- (IBAction)btnBack:(id)sender;

-(void)initMethod;
-(void)viewSetUp;

@end
