//
//  ProceedVC.m
//  AutoAtlas
//
//  Created by webmazix on 10/30/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "ProceedVC.h"

@interface ProceedVC ()

@end

@implementation ProceedVC

#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewSetUp];
}



#pragma mark - VIEW SET UP
-(void)viewSetUp {
    [self setBtn];
    [self setLbl];
    [self.navigationController  setNavigationBarHidden:YES animated:NO];
}




-(void)setBtn {
    
    
    //login
    self.btnLogin.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.btnLogin.layer.cornerRadius = 2.0;
    self.btnLogin.titleLabel.font = kQuicksand_Bold12;
    
    //signup
    self.btnSignUp.layer.cornerRadius = 2.0;
    self.btnSignUp.layer.borderColor = UIColorFromRGB(kappleDarkGrey).CGColor;
    self.btnSignUp.layer.borderWidth = 1.0;
    self.btnSignUp.titleLabel.font = kQuicksand_Regular12;
    [self.btnSignUp setTitleColor:UIColorFromRGB(kappleDarkGrey) forState:UIControlStateNormal];
    
    
    //skip to home
    self.btnSkipToHome.titleLabel.font = kQuicksand_Regular12;
    [self.btnSkipToHome setTitleColor:UIColorFromRGB(kappleDarkGrey) forState:UIControlStateNormal];
    self.btnSkipToHome.hidden = YES;
    
    
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSForegroundColorAttributeName:UIColorFromRGB(kAutoAtlasGreen),
                            NSFontAttributeName:kQuicksand_Regular12
                            };
    
    
    
    NSAttributedString * atr = [[NSAttributedString  alloc]initWithString:@"Terms of Use" attributes:dict1];
    NSAttributedString *atr1 = [[NSAttributedString alloc]initWithString:@"Privacy Policy" attributes:dict1];
    [self.btnTerms setAttributedTitle:atr forState:UIControlStateNormal];
    [self.btnPrivacyPolicy setAttributedTitle:atr1 forState:UIControlStateNormal];
}


-(void)setLbl {
    
    self.lblAnd.textColor = UIColorFromRGB(kappleLightGrey);
    self.lblAnd.font = kQuicksand_Regular12;
    
    self.lblSigningUp.textColor = UIColorFromRGB(kappleLightGrey);
    self.lblSigningUp.font = kQuicksand_Regular12;
    
    self.lblTitle.textColor = UIColorFromRGB(kappleDarkGrey);
    self.lblTitle.font = kQuicksand_Bold16;
}


#pragma mark  - ACTION METHOD
- (IBAction)btnSliderAction:(id)sender {
}

- (IBAction)btnSkipToHomeAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    MainViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [mainViewController setupWithType:0];
    
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    window.rootViewController = mainViewController;
    [UIView transitionWithView:window duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
    }];
}

- (IBAction)btnLoginAction:(id)sender {
    LoginVC *logVc = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
    [self.navigationController pushViewController:logVc animated:YES];
}

- (IBAction)btnSignUpAction:(id)sender {
    SignUpVC *signVc = [[SignUpVC alloc] initWithNibName:@"SignUpVC" bundle:nil];
    [self.navigationController pushViewController:signVc animated:YES];
}

- (IBAction)btnPrivacyPolicyAction:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
    SignupPrivacyPolicyVC *newVehicleVC = [story instantiateViewControllerWithIdentifier:@"SignupPrivacyPolicyVC"];
    [self.navigationController pushViewController:newVehicleVC animated:YES];
}



- (IBAction)btnTermsAction:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
    SignupTermsVC *newVehicleVC = [story instantiateViewControllerWithIdentifier:@"SignupTermsVC"];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:newVehicleVC animated:YES];
}



@end
