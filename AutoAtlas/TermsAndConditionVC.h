//
//  TermsAndConditionVC.h
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
#import "Network.h"
#import "BasicUtility.h"



@interface TermsAndConditionVC : UIViewController


@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnClear;
@property (strong, nonatomic) IBOutlet UIWebView * webView;


-(void)initMethod;
-(void)viewSetUp;

@end
