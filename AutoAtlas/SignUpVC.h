//
//  SignUpVC.h
//  AutoAtlas
//
//  Created by webmazix on 10/31/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>


//constnat
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "DejalActivityView.h"


//other
#import "LoginVC.h"
#import "LookingServiceVC.h"


//webconstnat
#import "WebServiceConstant.h"
#import "Network.h"
#import "GlobalValues.h"
#import "SignupTermsVC.h"
#import "SignupPrivacyPolicyVC.h"

@interface SignUpVC : UIViewController <UITextFieldDelegate>{
    GlobalValues* objGlobal;
}




@property (nonatomic) NSInteger intFromLogin;


@property (strong, nonatomic) IBOutlet UITextField *txtFldName;
@property (strong, nonatomic) IBOutlet UITextField *txtfldEmail;
@property (strong, nonatomic) IBOutlet UITextField *txtFldPswd;
@property (strong, nonatomic) IBOutlet UITextField *txtFldCnfrmPswd;

@property (strong, nonatomic) IBOutlet UILabel *lblNameBtm;
@property (strong, nonatomic) IBOutlet UILabel *lblEmailBtm;
@property (strong, nonatomic) IBOutlet UILabel *lblPswdBtm;
@property (strong, nonatomic) IBOutlet UILabel *lblCnfrmBtm;
@property (strong, nonatomic) IBOutlet UILabel *lblAcceptOur;

@property (strong, nonatomic) IBOutlet UILabel *lblAnd;
@property (strong, nonatomic) IBOutlet UILabel *lblDntHvAccnt;

@property (strong, nonatomic) IBOutlet UIButton *btnPrivacyPolicy;
@property (strong, nonatomic) IBOutlet UIButton *btnSignUp;
@property (strong, nonatomic) IBOutlet UIButton *btnSignInBottom;
@property (strong, nonatomic) IBOutlet UIButton *btnAcceptTerms;
@property (strong, nonatomic) IBOutlet UIButton *btnTermsOfUse;


- (IBAction)btnSignUpAction:(id)sender;
- (IBAction)btnPrivacyPolicyAction:(id)sender;
- (IBAction)btnSignInBottomAction:(id)sender;
- (IBAction)btnAcceptTermsAction:(id)sender;
- (IBAction)btnTermsOfUseAction:(id)sender;


-(void)intializerMethod;
-(void)viewSetUp;
-(void)setBtn;
-(void)setLbl;
-(void)setTxfd;
-(void)setTapGesture;
-(void)presentVC;
-(void)parsingDataForSignUp:(NSDictionary *)dictRes;

@end
