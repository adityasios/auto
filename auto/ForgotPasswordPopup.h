//
//  ForgotPasswordPopup.h
//  Haus&Co
//
//  Created by // aditya on 1/18/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Validations.h"
#import "Reachability.h"
#import "WebServiceConstant.h"
#import "DejalActivityView.h"
#import "Constant.h"
#import "Macros.h"
#import "SCLAlertView.h"
#import "BasicUtility.h"
#import "GlobalValues.h"
#import "AlertConst.h"

//lib
#import "Network.h"
#import "UIViewController+MaryPopin.h"


@interface ForgotPasswordPopup : UIViewController<UITextFieldDelegate>{
    GlobalValues *objGlobal;
}


@property (weak, nonatomic) IBOutlet UILabel * lblForgetPass;
@property (weak, nonatomic) IBOutlet UIButton *btn_Close;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;
@property (weak, nonatomic) IBOutlet UITextField *txfd_EmailAddress;

-(IBAction)btn_Close:(id)sender;
-(IBAction)btn_Submit:(id)sender;


-(void)intializerMethod;
-(void)viewSetUp;
-(void)setTxfd;
-(void)setBtn;
-(void)forgotPasswordWebCall;
-(void)forgotPasswordValidation;
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;
@end
