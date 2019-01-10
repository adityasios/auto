//
//  ProceedVC.h
//  AutoAtlas
//
//  Created by webmazix on 10/30/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "BasicUtility.h"

//other
#import "LoginVC.h"
#import "SignUpVC.h"

//3rd party
#import "LeftMenuVC.h"
#import "MainViewController.h"

//other
#import "HomeVC.h"
#import "SignupTermsVC.h"
#import "SignupPrivacyPolicyVC.h"
#import "GlobalValues.h"

@interface ProceedVC : UIViewController{
    GlobalValues *objGlobal;
}

@property (strong, nonatomic) IBOutlet UIImageView *imgLogo;
@property (strong, nonatomic) IBOutlet UIImageView *imgBackground;

@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UILabel *lblSigningUp;
@property (strong, nonatomic) IBOutlet UILabel *lblAnd;

@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;
@property (strong, nonatomic) IBOutlet UIButton *btnPrivacyPolicy;
@property (strong, nonatomic) IBOutlet UIButton *btnTerms;
@property (strong, nonatomic) IBOutlet UIButton *btnSkipToHome;


- (IBAction)btnSkipToHomeAction:(id)sender;
- (IBAction)btnLoginAction:(id)sender;
- (IBAction)btnSignUpAction:(id)sender;
- (IBAction)btnPrivacyPolicyAction:(id)sender;
- (IBAction)btnTermsAction:(id)sender;
- (IBAction)btnSliderAction:(id)sender;

-(void)viewSetUp;
-(void)setLbl;
-(void)setBtn;


@end
