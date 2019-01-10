//
//  ChangePassVC.h
// aditya
//
//  Created by // aditya Kumar on 3/21/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>


//constant
#import "Constant.h"
#import "Macros.h"
#import "GlobalValues.h"
#import "Validations.h"
#import "AlertConst.h"
#import "WebServiceConstant.h"
#import "Network.h"
#import "BasicUtility.h"


@interface ChangePassVC : UIViewController<UITextFieldDelegate>{
    GlobalValues * objGlobal;
}

@property (strong, nonatomic) IBOutlet UITextField * txfdOld;
@property (strong, nonatomic) IBOutlet UITextField * txfdNew;
@property (strong, nonatomic) IBOutlet UITextField * txfdConfirm;

@property (strong, nonatomic) IBOutlet UILabel * lblOld;
@property (strong, nonatomic) IBOutlet UILabel * lblNew;
@property (strong, nonatomic) IBOutlet UILabel * lblConfirm;

@property (strong, nonatomic) IBOutlet UIButton *btnSubmit;

- (IBAction)btnSubmitClicked:(id)sender;


-(void)initMethod;

-(void)setUI;
-(void)customBackButton;
-(void)setBtn;
-(void)setLbl;
-(void)setTxfd;
-(void)setTapGesture;

-(void)webcallForChangePassword;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;

@end
