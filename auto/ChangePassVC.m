//
//  ChangePassVC.m
// aditya
//
//  Created by // aditya Kumar on 3/21/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "ChangePassVC.h"

@interface ChangePassVC ()

@end

@implementation ChangePassVC

#pragma mark -  VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self  setUI];
}

#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues  sharedManager];
    [self  setTapGesture];
}

-(void)setTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    tap.cancelsTouchesInView = YES;
}


#pragma mark - SET UI
-(void)setUI{
    [self  customBackButton];
    [self  setLbl];
    [self  setTxfd];
    [self  setBtn];
}


-(void)customBackButton{
    
    UIImage* buttonImage = [UIImage imageNamed:@"bk"];
    CGRect frame = CGRectMake(10, 0, 20, 20);
    UIButton *bckButton = [[UIButton alloc] initWithFrame:frame];
    bckButton.contentEdgeInsets = UIEdgeInsetsMake(-8, -8, -8, -8);
    [bckButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [bckButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backbarButton = [[UIBarButtonItem alloc] initWithCustomView:bckButton];
    
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:@"Change Password"];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kQuicksand_Bold14, NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[backbarButton,titleBarButton];
}


-(void)setLbl{
    self.lblOld.font = kQuicksand_Bold14;
    self.lblOld.textColor = UIColorFromRGB(kappleBlack);
    
    self.lblNew.font = kQuicksand_Bold14;
    self.lblNew.textColor = UIColorFromRGB(kappleBlack);
    
    self.lblConfirm.font = kQuicksand_Bold14;
    self.lblConfirm.textColor = UIColorFromRGB(kappleBlack);
}




-(void)setTxfd{
    
    self.txfdOld.layer.cornerRadius = 4;
    self.txfdOld.clipsToBounds = YES;
    self.txfdOld.layer.borderWidth = 1;
    self.txfdOld.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    
    UIView * viewOld = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, self.txfdOld.frame.size.height)];
    viewOld.backgroundColor = self.txfdOld.backgroundColor;
    self.txfdOld.leftView = viewOld;
    self.txfdOld.leftViewMode = UITextFieldViewModeAlways;
    
    
    
    self.txfdNew.layer.cornerRadius = 4;
    self.txfdNew.clipsToBounds = YES;
    self.txfdNew.layer.borderWidth = 1;
    self.txfdNew.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    
    
    UIView * viewNew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, self.txfdNew.frame.size.height)];
    viewNew.backgroundColor = self.txfdOld.backgroundColor;
    self.txfdNew.leftView = viewNew;
    self.txfdNew.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.txfdConfirm.layer.cornerRadius = 4;
    self.txfdConfirm.clipsToBounds = YES;
    self.txfdConfirm.layer.borderWidth = 1;
    self.txfdConfirm.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    
    
    UIView * viewConfirm = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, self.txfdConfirm.frame.size.height)];
    viewConfirm.backgroundColor = self.txfdConfirm.backgroundColor;
    self.txfdConfirm.leftView = viewConfirm;
    self.txfdConfirm.leftViewMode = UITextFieldViewModeAlways;
}


-(void)setBtn{
    self.btnSubmit.layer.cornerRadius = 2.0;
    self.btnSubmit.clipsToBounds = YES;
    self.btnSubmit.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.btnSubmit.titleLabel.font = kQuicksand_Bold14;
    [self.btnSubmit setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
}


#pragma mark - DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.layer.borderColor = UIColorFromRGB(kAutoAtlasGreen).CGColor;
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    textField.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
}



#pragma mark - SEL ACTION
- (void)backButtonClicked:(id)sender {
    [self.navigationController  popViewControllerAnimated:YES];
}

-(void)dismissKeyboard {
    [self.view  endEditing:YES];
}


#pragma mark - ACTION
- (IBAction)btnSubmitClicked:(id)sender{
    
    self.txfdOld.text = [Validations  removeWhiteSpace:self.txfdOld.text];
    self.txfdNew.text = [Validations  removeDoubleSpace:self.txfdNew.text];
    self.txfdConfirm.text = [Validations  removeDoubleSpace:self.txfdConfirm.text];
    
    if (self.txfdOld.text.length == 0) {
        [self  showAlertWithTitle:kError Withsubtitle:kValidateOldPass withIndex:kIndexMaxValue];
        return;
    }
    
    if (self.txfdNew.text.length == 0) {
        [self  showAlertWithTitle:kError Withsubtitle:kValidateOldPass withIndex:kIndexMaxValue];
        return;
    }
    
    
    if (![self.txfdConfirm.text isEqualToString:self.txfdNew.text]) {
        [self  showAlertWithTitle:kError Withsubtitle:kValidateConfirmPass withIndex:kIndexMaxValue];
        return;
    }
    
    [self  webcallForChangePassword];
    
}


#pragma mark - WEBCALL
-(void)webcallForChangePassword{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostChnangePass];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:objGlobal.str_Email forKey:kemail];
    [mdictPara  setObject:self.txfdOld.text forKey:kold_password];
    [mdictPara  setObject:self.txfdNew.text forKey:knew_password];
    
    NSLog(@"mdictPara = %@",mdictPara);
    
    [BasicUtility  showLoaderInView:self.view];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                [self  showAlertWithTitle:kMessage Withsubtitle:strMsg withIndex:kIndex10];
            }else {
                [self  showAlertWithTitle:kError Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:kError Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}






/*
CHANGE PASSWORD
user/change_password
POST
yes
key:8dfafb41e9b4c0b3decd875e7a231049
email:
old_password
new_password
*/


#pragma mark - ALERT METHOD
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        } else if (index == kIndex10){
            [self.navigationController  popViewControllerAnimated:YES];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}











@end
