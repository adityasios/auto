//
//  EditProfileVC.m
// aditya
//
//  Created by sahil bhatia on 26/11/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "EditProfileVC.h"

@interface EditProfileVC ()

@end

@implementation EditProfileVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self intializerMethod];
    [self setUpViews];
    
}



#pragma mark - INIT METHOD
-(void)intializerMethod{
    objGlobal = [GlobalValues sharedManager];
    self.view.backgroundColor = UIColorFromRGBWithAlpha(kappleBlack,0.7);
}



#pragma mark - VIEW SET UP
-(void)setUpViews {
    self.activityView.tintColor = UIColorFromRGB(k adityaGreen);
    [self setLbl];
    [self setBtn];
    [self setTxtFld];
    [self textFieldDoneButton];
}



-(void)setLbl {
    self.lblProfile.font = kQuicksand_Bold16;
    self.lblProfile.textColor = [UIColor  darkTextColor];
    
    self.lblMobile.font = kQuicksand_Bold14;
    self.lblMobile.textColor = UIColorFromRGB(kappleDarkGrey);
    
    self.lblEmail.font = kQuicksand_Bold14;
    self.lblEmail.textColor = UIColorFromRGB(kappleDarkGrey);
}



-(void)setBtn {
    
    self.btnSave.titleLabel.font = kQuicksand_Bold12;
    self.btnSave.backgroundColor = UIColorFromRGB(k adityaGreen);
    self.btnSave.layer.cornerRadius = 4.0;
    [self.btnSave setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    
    self.btnCancel.titleLabel.font = kQuicksand_Bold12;
    self.btnCancel.backgroundColor = UIColorFromRGB(kappleDarkGrey);
    self.btnCancel.layer.cornerRadius = 4.0;
    [self.btnCancel setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
}


-(void)setTxtFld{
    
    //mobile
    self.txtFldMobile.font = kQuicksand_Regular14;
    self.txtFldMobile.delegate = self;
    [self.txtFldMobile setKeyboardType:UIKeyboardTypePhonePad];
    if (objGlobal.str_Phone.length > 2) {
        self.txtFldMobile.text = objGlobal.str_Phone;
    }
    
    //email
    self.txtFldEmail.font = kQuicksand_Regular14;
    self.txtFldEmail.delegate = self;
    [self.txtFldEmail setKeyboardType:UIKeyboardTypeEmailAddress];
    if (objGlobal.str_Email.length > 2) {
        self.txtFldEmail.text = objGlobal.str_Email;
    }
}


-(void)textFieldDoneButton{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(txfdDoneButtonPressed)];
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    self.txtFldMobile.inputAccessoryView = keyboardToolbar;
}


#pragma mark - TEXTFIELD DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [self animateTextField: YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    [self animateTextField:NO];
}


-(void)dismissKeyboard {
    [self.txtFldMobile resignFirstResponder];
    [self.txtFldEmail resignFirstResponder];
}


#pragma mark - BUTTON ACTION
- (IBAction)btnSaveAction:(id)sender {
    [self.view  endEditing:YES];
    [self validateField];
}

- (IBAction)btnCancelAction:(id)sender {
    [self.view  endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - SELECTOR ACTION
-(void)txfdDoneButtonPressed{
    [self.txtFldMobile resignFirstResponder];
}



#pragma mark - WEBCALL
-(void)validateField{
    
    
    self.txtFldMobile.text = [Validations  removeWhiteSpace:self.txtFldMobile.text];
    self.txtFldEmail.text = [Validations  removeWhiteSpace:self.txtFldEmail.text];
    
    self.txtFldMobile.text = [Validations  removeDoubleSpace:self.txtFldMobile.text];
    self.txtFldEmail.text = [Validations  removeDoubleSpace:self.txtFldEmail.text];
    
    
    //mobile no
    if (self.txtFldMobile.text.length > 14 || self.txtFldMobile.text.length < 6) {
        [self  showAlertWithTitle:kError Withsubtitle:kValidateMobileNo withIndex:kIndexMaxValue];
        return;
    }
 
    
    NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    if ([self.txtFldMobile.text rangeOfCharacterFromSet:notDigits].location != NSNotFound)
    {
        [self  showAlertWithTitle:kError Withsubtitle:kValidateMobile_No withIndex:kIndexMaxValue];
        return;
    }
    
    //email
    if(![Validations  isValidEmail:self.txtFldEmail.text]){
        [self  showAlertWithTitle:kError Withsubtitle:kemailValidate withIndex:kIndexMaxValue];
        return;
    }
    

    
    
    //no chnage
    if ([self.txtFldEmail.text isEqualToString:objGlobal.str_Email] && [self.txtFldMobile.text isEqualToString:objGlobal.str_Phone]) {
        [BasicUtility  showToastinView:self.view WithDesc:kNoEdit];
        return;
    }
    
    
    
    [self  updateProfile];
}



/*
UPDATE PROFILE
http://websitedevelopment101.com/ aditya/api/user/update_profile
key:8dfafb41e9b4c0b3decd875e7a231049
email:megha1@// aditya.com
mobile:9876543210
user_id:62
*/



#pragma mark - WEBCALL
-(void)updateProfile{
    
    
    [self  showLoader];
    NSString *strPost = [KBaseURL stringByAppendingString:kPostUpdateProfile];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara setObject:self.txtFldEmail.text forKey:kemail];
    [mdictPara  setObject:self.txtFldMobile.text forKey:kmobile];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [self  hideLoader];
        if (!error) {
            NSLog(@"Result = %@", result);
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            if (strStatus.integerValue == 1) {
                [BasicUtility  showToastinView:self.view WithDesc:kProfileUpdated];
                NSDictionary * dictData = [result objectForKey:kdata];
                [self  parsingUpdateProfile:dictData];
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
    
}


#pragma mark - WEBCALL PARSING
-(void)parsingUpdateProfile:(NSDictionary *)dict{
    
    NSString * strEmail = [NSString  stringWithFormat:@"%@",[dict objectForKey:kemail]];
    NSString * strMobile = [NSString  stringWithFormat:@"%@",[dict objectForKey:kmobile]];
    
    
    if ([Validations  isObjectNull:strEmail]) {
        strEmail = @"";
    }
    
    if ([Validations  isObjectNull:strMobile]) {
        strMobile = @"";
    }
    
    objGlobal.str_Email = strEmail;
    objGlobal.str_Phone = strMobile;
    
    [Validations saveObject:strEmail ForKey:kemail];
    [Validations saveObject:strMobile ForKey:kphone_no];
    
    
    self.passEditProfile(1);
    [self  dismissViewControllerAnimated:YES completion:nil];
}










/*
 2018-03-09 21:29:07.757374+0530  aditya[1468:483270] Result = {
 data =     {
 email = "// aditya@gmail.com";
 "first_name" = // aditya;
 id = 135;
 mobile = "<null>";
 "profile_photo" = "http://websitedevelopment101.com/ aditya/assets/uploads/user_images/b5a0fc5609a7bc514d86b13f14057e24.jpg";
 "user_id" = 135;
 };
 message = succeed;
 status = 1;
 }
 */



#pragma mark - HELPER METHOD
- (void) animateTextField:(BOOL) up{
    if(up){
        self.bottomViewConstraint.constant = SCREEN_HEIGHT/2;
        [UIView animateWithDuration:0.5  animations:^{
            [self.view layoutIfNeeded];
        }];
    }else{
        self.bottomViewConstraint.constant = 00.00;
        [UIView animateWithDuration:0.5 animations:^{
            [self.view layoutIfNeeded];
        }];
    }
}




#pragma mark - LOADER METHOD
-(void)showLoader{
    [self.activityView  startAnimating];
    [self.btnSave  setUserInteractionEnabled:NO];
    [self.btnCancel  setUserInteractionEnabled:NO];
    [self.txtFldEmail  setUserInteractionEnabled:NO];
    [self.txtFldMobile  setUserInteractionEnabled:NO];
}

-(void)hideLoader{
    [self.activityView  stopAnimating];
    [self.btnSave  setUserInteractionEnabled:YES];
    [self.btnCancel  setUserInteractionEnabled:YES];
    [self.txtFldEmail  setUserInteractionEnabled:YES];
    [self.txtFldMobile  setUserInteractionEnabled:YES];
}




#pragma mark - ALERT METHOD
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        } else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
