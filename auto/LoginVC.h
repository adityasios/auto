//
//  LoginVC.h
// aditya
//
//  Created by // aditya on 10/31/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GoogleSignIn;
#import <FBSDKLoginKit.h>
#import <FBSDKCoreKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "DejalActivityView.h"
#import "AlertConst.h"
#import "BasicUtility.h"
//3rd party
#import "MainViewController.h"

//other
#import "SignUpVC.h"
#import "LookingServiceVC.h"
#import "SocialSignIn.h"



//web service
#import "WebServiceConstant.h"
#import "Network.h"
#import "GlobalValues.h"
#import "ForgotPasswordPopup.h"



@interface LoginVC : UIViewController <UITextFieldDelegate,GIDSignInDelegate,GIDSignInUIDelegate>{
    GlobalValues* objGlobal;
    BOOL isRememberMeCheck;
   
    
    
}



@property (nonatomic) NSInteger intFromSignUp;

@property (strong, nonatomic) IBOutlet UITextField *txtFldUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtFldPassword;

@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIButton *btnForgotPswd;
@property (strong, nonatomic) IBOutlet UIButton *btnRememberMe;
@property (strong, nonatomic) IBOutlet UIButton *btnsignUp;

@property (strong, nonatomic) IBOutlet UILabel *lblEmailBtm;
@property (strong, nonatomic) IBOutlet UILabel *lblPswdBtm;
@property (strong, nonatomic) IBOutlet UILabel *lblRemember;
@property (strong, nonatomic) IBOutlet UILabel *lblDonthvAcnt;


- (IBAction)btnLoginAction:(id)sender;
- (IBAction)btnRememberMeAction:(id)sender;
- (IBAction)btnSignUpAction:(id)sender;
- (IBAction)btnForgotPswdAction:(id)sender;
- (IBAction)btnFacebookClicked:(id)sender;
- (IBAction)btn_Google:(id)sender;

-(void)intializerMethod;
-(void)viewSetUp;
-(void)setBtn;
-(void)setLbl;
-(void)setTxfd;
-(void)setTapGesture;

-(void)webCallForSignin;
-(void)parsingDataForSignIn:(NSDictionary *)dictRes;

-(void)webCallForSocialSignIn:(NSDictionary *)dictSocial withType:(NSString *)type;
-(void)parsingDataForSocialSignIn:(NSDictionary *)dictRes;


-(void)presentVC;
-(void)presentSocialSignIn;
-(void)resetLoginFields;
-(void)facebookGraphApiRequest;





@end
