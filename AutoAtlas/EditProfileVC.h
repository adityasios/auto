//
//  EditProfileVC.h
//  AutoAtlas
//
//  Created by sahil bhatia on 26/11/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "DejalActivityView.h"
#import "WebServiceConstant.h"
#import "Network.h"
#import "GlobalValues.h"
#import "AlertConst.h"
#import "DejalActivityView.h"
#import "BasicUtility.h"

@interface EditProfileVC : UIViewController <UITextFieldDelegate>{
    GlobalValues * objGlobal;
}

@property (nonatomic, strong)void(^passEditProfile)(NSInteger index);

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView * activityView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomViewConstraint;


@property (weak, nonatomic) IBOutlet UILabel *lblProfile;
@property (weak, nonatomic) IBOutlet UILabel *lblMobile;
@property (weak, nonatomic) IBOutlet UILabel *lblBtmTxtFld1;
@property (weak, nonatomic) IBOutlet UILabel *lblBtmTxtFld2;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;


@property (weak, nonatomic) IBOutlet UITextField *txtFldMobile;
@property (weak, nonatomic) IBOutlet UITextField *txtFldEmail;

@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

- (IBAction)btnSaveAction:(id)sender;
- (IBAction)btnCancelAction:(id)sender;

-(void)setUpViews;
-(void)setLbl;
-(void)setBtn;
-(void)setTxtFld;
-(void)textFieldDoneButton;
-(void)updateProfile;
-(void)parsingUpdateProfile:(NSDictionary *)dict;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;


-(void)showLoader;
-(void)hideLoader;

@end
