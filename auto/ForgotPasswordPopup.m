//
//  ForgotPasswordPopup.m
//  Haus&Co
//
//  Created by // aditya on 1/18/17.
//  Copyright © 2017 // aditya. All rights reserved.

#import "ForgotPasswordPopup.h"

@interface ForgotPasswordPopup ()
@end
@implementation ForgotPasswordPopup



#pragma mark -  VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self intializerMethod];
    [self  viewSetUp];
}

#pragma mark - INTIALIZER METHOD
-(void)intializerMethod{
    objGlobal = [GlobalValues sharedManager];
}


#pragma mark - VIEW SET UP
-(void)viewSetUp{
    self.lblForgetPass.font = kQuicksand_Bold14;
    [self  setTxfd];
    [self  setBtn];
}

-(void)setTxfd{
    
    //email
    self.txfd_EmailAddress.clipsToBounds = YES;
    self.txfd_EmailAddress.layer.cornerRadius = 2;
    self.txfd_EmailAddress.layer.borderWidth = 1;
    self.txfd_EmailAddress.textColor = [UIColor blackColor];
    self.txfd_EmailAddress.font = kQuicksand_Regular14;
    self.txfd_EmailAddress.placeholder = kEnterEmail;
    
    UIColor *color = [UIColor lightGrayColor];
    self.txfd_EmailAddress.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter Email Address" attributes:@{NSForegroundColorAttributeName: color}];
    UIView * paddingView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
    self.txfd_EmailAddress.leftView = paddingView1;
    self.txfd_EmailAddress.leftViewMode = UITextFieldViewModeAlways;
    paddingView1.layer.borderColor = UIColorFromRGB(kappleLightGrey).CGColor;
}

-(void)setBtn{
    self.btnSubmit.backgroundColor = UIColorFromRGB(k adityaGreen);
    self.btnSubmit.titleLabel.font = kQuicksand_Bold14;
    [self.btnSubmit setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
}




#pragma mark - TEXTFIELD DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}










#pragma mark - BUTTON ACTION
- (IBAction)btn_Close:(id)sender {
    [self.view  endEditing:YES];
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{
        NSLog(@"Popin dismissed !");
    }];
}

- (IBAction)btn_Submit:(id)sender {
    [self.view  endEditing:YES];
    [self forgotPasswordValidation];
}


#pragma mark - VALIDATE
-(void)forgotPasswordValidation{
    
    self.txfd_EmailAddress.text = [Validations  removeWhiteSpace:self.txfd_EmailAddress.text];
    self.txfd_EmailAddress.text = [Validations  removeDoubleSpace:self.txfd_EmailAddress.text];
    
    if (self.txfd_EmailAddress.text.length == 0) {
        [self  showAlertWithTitle:@"Alert" Withsubtitle:@"Please Enter Email" withIndex:kIndexMaxValue];
        return;
    }
    
    else if (![Validations  isValidEmail:self.txfd_EmailAddress.text]) {
        [self  showAlertWithTitle:@"Alert" Withsubtitle:@"Please Enter Valid Email" withIndex:kIndexMaxValue];
        return;
    }else{
        [self forgotPasswordWebCall];
    }
}



#pragma mark - WEBCALL
-(void)forgotPasswordWebCall{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostForgotPassword];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara setObject:self.txfd_EmailAddress.text forKey:kemail];
    
    [BasicUtility  showLoaderInView:self.view];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            if (strStatus.integerValue == 1) {
                [self  showAlertWithTitle:kSuccess Withsubtitle:strMsg withIndex:100];
            }else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}







#pragma mark -  ALERT METHOD
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index{
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:@"OK"  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }else if(index == 100){
            [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{
                NSLog(@"Popin dismissed !");
            }];
        }else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


@end

