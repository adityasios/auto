//
//  SocialSignIn.h
// aditya
//
//  Created by // aditya Kumar on 3/15/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "GlobalValues.h"
#import "AlertConst.h"
#import "WebServiceConstant.h"
#import "Network.h"

@interface SocialSignIn : UIViewController<UITextFieldDelegate>{
    GlobalValues * objGlobal;
}

@property (nonatomic, strong)void(^passSocialSignIn)(NSInteger intType);

@property (strong, nonatomic) NSString * strAuthPro;
@property (strong, nonatomic) NSString * strAuthId;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView * activity;
@property (strong, nonatomic) IBOutlet UIView * viewBg;
@property (strong, nonatomic) IBOutlet UIImageView * imgVSocial;
@property (strong, nonatomic) IBOutlet UILabel * lblSocial;
@property (strong, nonatomic) IBOutlet UITextField * txfdEmail;
@property (strong, nonatomic) IBOutlet UITextField * txfdName;
@property (strong, nonatomic) IBOutlet UIButton * btnClose;
@property (strong, nonatomic) IBOutlet UIButton * btnSubmit;


- (IBAction)btnSubmitAction:(id)sender;
- (IBAction)btnBackClicked:(id)sender;



-(void)intializerMethod;

-(void)viewSetUp;
-(void)setLbl;
-(void)setBtn;
-(void)setView;
-(void)setTxfd;
-(void)setImgV;

-(void)webcallForSocialProfileUpdate;
-(void)parsingDataForSignIn:(NSDictionary *)dictRes;

-(void)showLoader;
-(void)hideLoader;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;

@end

