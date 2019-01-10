//
//  SocialSignIn.m
// aditya
//
//  Created by // aditya Kumar on 3/15/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "SocialSignIn.h"

@interface SocialSignIn ()

@end

@implementation SocialSignIn

#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self intializerMethod];
    [self viewSetUp];
}

#pragma mark - INIT METHOD
-(void)intializerMethod{
    objGlobal = [GlobalValues  sharedManager];
}


#pragma mark - VIEW SET UP
-(void)viewSetUp{
    self.view.backgroundColor = UIColorFromRGBWithAlpha(kappleLightGrey,0.2);
    [self  setLbl];
    [self  setImgV];
    [self  setBtn];
    [self  setView];
    [self  setTxfd];
}


-(void)setLbl{
    self.lblSocial.font = kQuicksand_Bold17;
    if ([objGlobal.socialAuthType  isEqualToString:kfacebook]) {
        self.lblSocial.textColor = UIColorFromRGB(kfbBlue);
    }else{
        self.lblSocial.textColor = UIColorFromRGB(kgoogleRed);
    }
}

-(void)setImgV{
    if ([objGlobal.socialAuthType  isEqualToString:kfacebook]) {
        self.imgVSocial.image = [UIImage  imageNamed:@"fb"];
    }else{
        self.imgVSocial.image = [UIImage  imageNamed:@"g+"];
    }
}


-(void)setBtn{
    
    //close
    if ([objGlobal.socialAuthType  isEqualToString:kfacebook]) {
        [self.btnClose  setImage:kfbclose forState:UIControlStateNormal];
    }else{
        [self.btnClose  setImage:kgclose forState:UIControlStateNormal];
    }
    
    
    //submit
    self.btnSubmit.layer.cornerRadius = 2.0;
    self.btnSubmit.clipsToBounds = YES;
    if ([objGlobal.socialAuthType  isEqualToString:kfacebook]) {
        self.btnSubmit.backgroundColor = UIColorFromRGB(kfbBlue);
    }else{
        self.btnSubmit.backgroundColor = UIColorFromRGB(kgoogleRed);
    }
    self.btnSubmit.titleLabel.font = kQuicksand_Bold14;
    [self.btnSubmit setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
}











-(void)setView{
    self.viewBg.layer.cornerRadius = 2;
    self.viewBg.clipsToBounds = YES;
    self.viewBg.layer.borderWidth = 0.5;
    if ([objGlobal.socialAuthType  isEqualToString:kfacebook]) {
        self.viewBg.layer.borderColor = UIColorFromRGB(kfbBlue).CGColor;
    }else{
        self.viewBg.layer.borderColor = UIColorFromRGB(kgoogleRed).CGColor;
    }
    self.viewBg.backgroundColor = [UIColor  whiteColor];
}


-(void)setTxfd{
    
    self.txfdName.layer.cornerRadius = 2;
    self.txfdName.clipsToBounds = YES;
    self.txfdName.layer.borderWidth = 1;
    self.txfdName.layer.borderColor = UIColorFromRGB(kappleLightGrey).CGColor;
    self.txfdName.backgroundColor = UIColorFromRGBWithAlpha(kappleLightGrey,0.1);
    self.txfdName.placeholder = @"name";
    self.txfdName.textAlignment = NSTextAlignmentCenter;
    if (objGlobal.str_FirstName.length > 0) {
        self.txfdName.text = objGlobal.str_FirstName;
        self.txfdName.userInteractionEnabled = NO;
    }
    
    
    self.txfdEmail.layer.cornerRadius = 2;
    self.txfdEmail.clipsToBounds = YES;
    self.txfdEmail.layer.borderWidth = 1;
    self.txfdEmail.layer.borderColor = UIColorFromRGB(kappleLightGrey).CGColor;
    self.txfdEmail.backgroundColor = UIColorFromRGBWithAlpha(kappleLightGrey,0.1);
    self.txfdEmail.placeholder = @"email";
    self.txfdEmail.textAlignment = NSTextAlignmentCenter;
    if (objGlobal.str_Email.length > 0) {
        self.txfdEmail.text = objGlobal.str_Email;
        self.txfdEmail.userInteractionEnabled = NO;
    }
}


#pragma mark - TEXTFIELD DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}



-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.txfdName) {
        if ([objGlobal.socialAuthType  isEqualToString:kfacebook]) {
            self.txfdName.layer.borderColor = UIColorFromRGB(kfbBlue).CGColor;
        }else{
            self.txfdName.layer.borderColor = UIColorFromRGB(kgoogleRed).CGColor;
        }
    }else{
        
        if ([objGlobal.socialAuthType  isEqualToString:kfacebook]) {
            self.txfdEmail.layer.borderColor = UIColorFromRGB(kfbBlue).CGColor;
        }else{
            self.txfdEmail.layer.borderColor = UIColorFromRGB(kgoogleRed).CGColor;
        }
    }
}



-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.txfdName) {
        self.txfdName.layer.borderColor = UIColorFromRGB(kappleLightGrey).CGColor;
    }else{
        self.txfdEmail.layer.borderColor = UIColorFromRGB(kappleLightGrey).CGColor;
    }
}



#pragma mark - BUTTON ACTION
- (IBAction)btnSubmitAction:(id)sender{
    [self.view  endEditing:YES];
    if (self.txfdName.text.length == 0) {
        [self  showAlertWithTitle:kError Withsubtitle:knameValidate withIndex:kIndexMaxValue];
        return;
    }
    
    if (![Validations  isValidEmail:self.txfdEmail.text]) {
        [self  showAlertWithTitle:kError Withsubtitle:kemailValidate withIndex:kIndexMaxValue];
        return;
    }
    
    if (objGlobal.socialAuthType.length == 0 || objGlobal.socialAuthId.length == 0) {
        [self  showAlertWithTitle:kError Withsubtitle:kValidateSocialType withIndex:kIndexMaxValue];
        return;
    }
    
    [self  webcallForSocialProfileUpdate];
}


- (IBAction)btnBackClicked:(id)sender{
    [self  dismissViewControllerAnimated:YES completion:nil];
}




#pragma mark - WEBCALL
-(void)webcallForSocialProfileUpdate{
    
    
    [self  showLoader];
    NSString *strPost = [KBaseURL stringByAppendingString:kPostSocialProfileUpdate];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:self.txfdName.text forKey:kfirst_name];
    [mdictPara  setObject:self.txfdEmail.text forKey:kemail];
    [mdictPara  setObject:objGlobal.socialAuthType forKey:koauth_provider];
    [mdictPara  setObject:objGlobal.socialAuthId forKey:koauth_uid];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [self  hideLoader];
        if (!error) {
            
            NSLog(@"Result = %@", result);
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            if (strStatus.integerValue == 1) {
                if ([[result objectForKey:kdata] isKindOfClass:[NSDictionary  class]]) {
                    NSDictionary * dictData = [result objectForKey:kdata];
                    [self  parsingDataForSignIn:dictData];
                }
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}






/*
SOCIAL  PROFILE UPDATED
http://localhost/autoatlas/api/user/social_profile_completed
key:8dfafb41e9b4c0b3decd875e7a231049
first_name:njkhkuh
email:nkljl2221@gamil.com
oauth_provider:facebook
oauth_uid:1
user_id:149
*/





#pragma mark - PARSING WEBCALL
-(void)parsingDataForSignIn:(NSDictionary *)dictRes{
    
    NSString * strUserId =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kuser_id]];
    NSString * strFirstName =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kfirst_name]];
    NSString * strEmail =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kemail]];
    NSString * strPhone =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kphone_no]];
    NSString * strProfile =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kprofile_photo]];
    NSString * strCreated =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kcreated_at]];
    
    
    if ([Validations  isObjectNull:strUserId]) {
        strUserId = @"";
        return;
    }
    
    if ([Validations  isObjectNull:strFirstName]) {
        strFirstName = @"";
    }
    
    if ([Validations  isObjectNull:strEmail]) {
        strEmail = @"";
    }
    
    if ([Validations  isObjectNull:strPhone]) {
        strPhone = @"";
    }
    
    if ([Validations  isObjectNull:strProfile]) {
        strProfile = @"";
    }
    
    if ([Validations  isObjectNull:strCreated]) {
        strCreated = @"";
    }
    
    
    objGlobal.str_userid = strUserId;
    objGlobal.str_FirstName = strFirstName;
    objGlobal.str_Email = strEmail;
    objGlobal.str_Phone = strPhone;
    objGlobal.str_Profile = strProfile;
    objGlobal.strCreated = strCreated;
    
    [self  dismissViewControllerAnimated:YES completion:^{
        self.passSocialSignIn(0);
    }];
    
}

















#pragma mark -  ALERT METHODS
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark -  LOADER METHOD
-(void)hideLoader{
    [self.activity  stopAnimating];
    [self.btnSubmit  setUserInteractionEnabled:YES];
    [self.txfdName setUserInteractionEnabled:YES];
    [self.txfdEmail setUserInteractionEnabled:YES];
}

-(void)showLoader{
    [self.activity  startAnimating];
    [self.btnSubmit  setUserInteractionEnabled:NO];
    [self.txfdName setUserInteractionEnabled:NO];
    [self.txfdEmail setUserInteractionEnabled:NO];
}













@end
