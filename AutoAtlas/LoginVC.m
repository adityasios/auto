//
//  LoginVC.m
//  AutoAtlas
//
//  Created by webmazix on 10/31/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "LoginVC.h"

@interface LoginVC ()
@end
@implementation LoginVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self intializerMethod];
    [self viewSetUp];
}



#pragma mark - INIT METHOD
-(void)intializerMethod{
    objGlobal = [GlobalValues sharedManager];
    [self  setTapGesture];
    
}


-(void)setTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    tap.cancelsTouchesInView = YES;
}



#pragma mark - VIEW SET UP
-(void)viewSetUp{
    [self  setLbl];
    [self  setBtn];
    [self  setTxfd];
}

-(void)setLbl{
    self.lblRemember.font = kQuicksand_Regular12;
    self.lblRemember.textColor = UIColorFromRGB(kappleGrey);
    
    
    self.lblDonthvAcnt.font = kQuicksand_Regular12;
    self.lblDonthvAcnt.textColor = UIColorFromRGB(kappleDarkGrey);
    
    self.lblEmailBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    self.lblPswdBtm.backgroundColor = UIColorFromRGB(kappleGrey);
}



-(void)setBtn{
    
    
    //remember me
    self.btnRememberMe.layer.borderWidth = 1;
    self.btnRememberMe.layer.borderColor = UIColorFromRGB(kappleDarkGrey).CGColor;
    
    
    
    //forgot password
    self.btnForgotPswd.titleLabel.font = kQuicksand_Regular12;
    [self.btnForgotPswd   setTitleColor:UIColorFromRGB(kBlue) forState:UIControlStateNormal];
    
    
    
    //login
    self.btnLogin.layer.cornerRadius = 2.0;
    self.btnLogin.clipsToBounds = YES;
    self.btnLogin.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.btnLogin.titleLabel.font = kQuicksand_Bold14;
    [self.btnLogin setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    
    
    //sign up
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSForegroundColorAttributeName:UIColorFromRGB(kAutoAtlasGreen),
                            NSFontAttributeName:kQuicksand_Regular12
                            };
    NSAttributedString * atr = [[NSAttributedString  alloc]initWithString:@"Sign Up" attributes:dict1];
    self.btnsignUp.titleLabel.font = kQuicksand_Regular13;
    [self.btnsignUp   setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [self.btnsignUp setAttributedTitle:atr forState:UIControlStateNormal];
}


-(void)setTxfd{
    
    
    //user name
    self.txtFldUsername.font = kQuicksand_Regular12;
    self.txtFldPassword.font = kQuicksand_Regular12;
    [self.txtFldUsername setKeyboardType:UIKeyboardTypeEmailAddress];
    
    //password
    self.txtFldPassword.returnKeyType = UIReturnKeyDone;
    self.txtFldPassword.delegate = self;
    self.txtFldUsername.delegate = self;
    self.txtFldPassword.secureTextEntry = YES;
    
    
    //remember me
    NSString * stremail = [Validations  getObjectForKey:kemail];
    NSString * strpass = [Validations  getObjectForKey:kpassword_hash];
    NSString * strid = [Validations  getObjectForKey:kuser_id];
    if (stremail.length > 0 && strpass.length > 0 && strid.length == 0) {
        self.txtFldUsername.text = stremail;
        self.txtFldPassword.text = strpass;
        [self.btnRememberMe  setSelected:YES];
    }
}





#pragma mark - DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.txtFldUsername) {
        self.lblEmailBtm.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    }else{
        self.lblPswdBtm.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.txtFldUsername) {
        self.lblEmailBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    }else{
        self.lblPswdBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    }
}


-(void)dismissKeyboard {
    [self.txtFldPassword resignFirstResponder];
    [self.txtFldUsername resignFirstResponder];
}








#pragma mark  - ACTION
- (IBAction)btnLoginAction:(id)sender {
    [self  validateFields];
}




- (IBAction)btnRememberMeAction:(UIButton *)sender {
    if (sender.isSelected) {
        [sender  setSelected:NO];
    }else{
        [sender  setSelected:YES];
    }
}



- (IBAction)btnForgotPswdAction:(id)sender {
    [self.view  endEditing:YES];
    
    ForgotPasswordPopup *popin = [[ForgotPasswordPopup alloc] init];
    [popin setPopinTransitionStyle:BKTPopinTransitionStyleSpringySlide];
    [popin setPreferedPopinContentSize:CGSizeMake(SCREEN_WIDTH*.90, SCREEN_HEIGHT*.4)];
    
    //Set popin transition direction
    [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [self.navigationController presentPopinController:popin animated:YES completion:^{
        NSLog(@"Popin presented !");
    }];
}


- (IBAction)btnSignUpAction:(id)sender {
    if (self.intFromSignUp == 1) {
        [self.navigationController  popViewControllerAnimated:YES];
    }else{
        SignUpVC *signVc = [[SignUpVC alloc] initWithNibName:@"SignUpVC" bundle:nil];
        signVc.intFromLogin = 1;
        [self.navigationController pushViewController:signVc animated:YES];
    }
}


- (IBAction)btn_Google:(id)sender {
    [GIDSignIn sharedInstance].delegate = self;
    [GIDSignIn sharedInstance].uiDelegate = self;
    [[GIDSignIn sharedInstance] signIn];
}


- (IBAction)btnFacebookClicked:(id)sender{
    if ([FBSDKAccessToken currentAccessToken]) {
        [self  facebookGraphApiRequest];
    }else{
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login
         logInWithReadPermissions: @[@"public_profile",@"email"]
         fromViewController:self
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if (error) {
                 NSLog(@"error FB = %@",error.localizedDescription);
             } else if (result.isCancelled) {
                 NSLog(@"Cancelled");
             } else {
                 NSLog(@"Logged in");
                 if ([FBSDKAccessToken currentAccessToken]) {
                     [self  facebookGraphApiRequest];
                 }
             }
         }];
    }
}




#pragma mark - FACEBOOK REUEST
-(void)facebookGraphApiRequest{
    [DejalBezelActivityView  activityViewForView:self.view withLabel:@"Please Wait"];
    
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:@"id,name,email,first_name,last_name,picture" forKey:@"fields"];
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         [DejalBezelActivityView  removeViewAnimated:YES];
         if (!error) {
             NSLog(@"result :%@", result);
             [self  webCallForSocialSignIn:result withType:kfacebook];
         }else{
             [self  showAlertWithTitle:kError Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
         }
     }];
}



















#pragma mark - GOOGLE DELEGATE
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
}

- (void)signIn:(GIDSignIn *)signIn presentViewController:(UIViewController *)viewController{
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error {
    if (error) {
        [self  showAlertWithTitle:kError Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
    }else{
        
        NSLog(@"user = %@",user.userID);
        NSLog(@"email = %@",user.profile.email);
        NSLog(@"name = %@",user.profile.name);
        NSLog(@"givenName = %@",user.profile.givenName);
        
        NSMutableDictionary * mdict = [NSMutableDictionary  new];
        [mdict  setObject:user.userID forKey:kid];
        [mdict  setObject:user.profile.email forKey:kemail];
        [mdict setObject:user.profile.name forKey:kfirst_name];
        [mdict setObject:user.profile.givenName forKey:klast_name];
        [self  webCallForSocialSignIn:mdict withType:kgoogle];
    }
}






#pragma mark - VALIDATION CHECK
-(void)validateFields{
    
    if(![Validations isValidEmail:self.txtFldUsername.text]){
        [self  showAlertWithTitle:kAlert Withsubtitle:kemailValidate withIndex:kIndexMaxValue];
        return;
    }
    
    if(self.txtFldPassword.text.length < 5){
        [self  showAlertWithTitle:kAlert Withsubtitle:kpasswordValidate withIndex:kIndexMaxValue];
        return;
    }
    
    [self  webCallForSignin];
}


#pragma mark - WEBCALL FOR SIGNIN
-(void)webCallForSignin{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostSignIn];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara setObject:self.txtFldUsername.text forKey:kemail];
    [mdictPara  setObject:self.txtFldPassword.text forKey:kpassword_hash];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [BasicUtility  showLoaderInView:self.view];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        
        if (!error) {
            
            NSLog(@"Result = %@", result);
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                
                if ([[result objectForKey:kdata] isKindOfClass:[NSDictionary  class]]) {
                    NSDictionary * dictData = [result objectForKey:kdata];
                    [self  parsingDataForSignIn:dictData];
                }else{
                    [self  resetLoginFields];
                    [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
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
 
 {
 "first_name" = Hope;
 id = 445171002598819;
 "last_name" = Hope;
 name = Hope;
 picture =     {
 data =         {
 height = 50;
 "is_silhouette" = 0;
 url = "https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/19424144_322566554859265_8794466114467889544_n.jpg?oh=dca4d0a39e879dccd1589cc2ce881936&oe=5B4565A1";
 width = 50;
 };
 };
 }
 
 */

/*
 SOCIAL SIGN IN
 http://websitedevelopment101.com/autoatlas/api/user/social_signin
 POST
 key:8dfafb41e9b4c0b3decd875e7a231049
 first_name:megh
 email:meghapen@webmazix.com
 oauth_provider:facebook
 oauth_uid:dhgvssdttfdd
 last_name:deshuuu
 */


-(void)webCallForSocialSignIn:(NSDictionary *)dictSocial withType:(NSString *)type{
    NSLog(@"dictSocial = %@",dictSocial);
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostSocialSignIn];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    if ([type  isEqualToString:kfacebook]) {
        
        NSString * strid =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:kid]];
        NSString * strfirst =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:kfirst_name]];
        NSString * strlast =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:klast_name]];
        
        if ([dictSocial.allKeys containsObject:kemail]) {
            NSString * stremail =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:kemail]];
            [mdictPara setObject:stremail forKey:kemail];
        }
        
        [mdictPara  setObject:kkeyValue forKey:kkey];
        [mdictPara setObject:strfirst forKey:kfirst_name];
        [mdictPara setObject:strlast forKey:klast_name];
        [mdictPara setObject:kfacebook forKey:koauth_provider];
        [mdictPara setObject:strid forKey:koauth_uid];
        
    }else{
        
        
        NSString * strid =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:kid]];
        NSString * strfirst =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:kfirst_name]];
        NSString * strlast =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:klast_name]];
        NSString * stremail =  [NSString  stringWithFormat:@"%@",[dictSocial  objectForKey:kemail]];
        
        [mdictPara  setObject:kkeyValue forKey:kkey];
        [mdictPara setObject:strfirst forKey:kfirst_name];
        [mdictPara setObject:strlast forKey:klast_name];
        [mdictPara setObject:stremail forKey:kemail];
        [mdictPara setObject:kgoogle forKey:koauth_provider];
        [mdictPara setObject:strid forKey:koauth_uid];
    }
    
    
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        
        NSLog(@"Result = %@", result);
        
        
        if (!error) {
            
            NSLog(@"Result = %@", result);
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                
                if ([[result objectForKey:kdata] isKindOfClass:[NSDictionary  class]]) {
                    
                    NSDictionary * dictData = [result objectForKey:kdata];
                    NSString * strSocialProfile =  [NSString  stringWithFormat:@"%@",[dictData  objectForKey:ksocial_profile_updated]];
                    if (strSocialProfile.integerValue == 1) {
                        [self  parsingDataForSignIn:dictData];
                    }else{
                       [self  parsingDataForSocialSignIn:dictData];
                    }
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
 UPDATE USER DEVICE
 http://websitedevelopment101.com/autoatlas/api/user/register_user_device
 POST
 key:8dfafb41e9b4c0b3decd875e7a231049
 email:megha@webmazix.com
 fcm_id:2
 device_id:4
 device_type:IOS
 user_id:1
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
    
    
    //load profile image
    if (strProfile.length > 5) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL * urlImg = [NSURL  URLWithString:strProfile];
            NSData * dataImg = [NSData  dataWithContentsOfURL:urlImg];
            dispatch_async(dispatch_get_main_queue(), ^{
                if (dataImg) {
                    objGlobal.imgProfile = [UIImage  imageWithData:dataImg];
                    NSLog(@"IMAGE PRO = %@",objGlobal.imgProfile);
                }
            });
        });
    }
    
    
    objGlobal.str_userid = strUserId;
    objGlobal.str_FirstName = strFirstName;
    objGlobal.str_Email = strEmail;
    objGlobal.str_Phone = strPhone;
    objGlobal.str_Profile = strProfile;
    objGlobal.strCreated = strCreated;
    
    //save data
    [Validations saveObject:strUserId ForKey:kuser_id];
    [Validations saveObject:strFirstName ForKey:kfirst_name];
    [Validations saveObject:strEmail ForKey:kemail];
    [Validations saveObject:strPhone ForKey:kphone_no];
    [Validations saveObject:strProfile ForKey:kprofile_photo];
    [Validations saveObject:strCreated ForKey:kcreated_at];
    
    
    if (self.btnRememberMe.isSelected) {
        if (self.txtFldPassword.text.length > 1) {
            [Validations saveObject:kRemember ForKey:kremember_me];
            [Validations saveObject:self.txtFldPassword.text ForKey:kpassword_hash];
        }
    }
    
    [self  resetLoginFields];
    [self  presentVC];
}




-(void)parsingDataForSocialSignIn:(NSDictionary *)dictRes{
    
    NSString * strUserId =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kuser_id]];
    NSString * strFirstName =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kfirst_name]];
    NSString * strCreated =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kcreated_at]];
    NSString * strEmail =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:kemail]];
    NSString * strauthid =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:koauth_uid]];
    NSString * strauthpro =  [NSString  stringWithFormat:@"%@",[dictRes  objectForKey:koauth_provider]];
    

    
    
    if ([Validations  isObjectNull:strUserId]) {
        strUserId = @"";
        return;
    }
    
    if ([Validations  isObjectNull:strFirstName]) {
        strFirstName = @"";
    }
    
    if ([Validations  isObjectNull:strCreated]) {
        strCreated = @"";
    }
    
    if ([Validations  isObjectNull:strEmail]) {
        strEmail = @"";
    }
    
    
    if ([Validations  isObjectNull:strauthid]) {
        strauthid = @"";
    }
    
    if ([Validations  isObjectNull:strauthpro]) {
        strauthpro = @"";
    }
    
    objGlobal.str_userid = strUserId;
    objGlobal.str_FirstName = strFirstName;
    objGlobal.strCreated = strCreated;
    objGlobal.str_Email = strEmail;
    objGlobal.socialAuthId = strauthid;
    objGlobal.socialAuthType = strauthpro;
    [self  presentSocialSignIn];
}




#pragma mark - PRESENT VC
-(void)presentVC{
    UIStoryboard * story = [UIStoryboard   storyboardWithName:@"Profile" bundle:nil];
    LookingServiceVC * lookVC = [story  instantiateViewControllerWithIdentifier:@"LookingServiceVC"];
    UINavigationController   * nav = [[UINavigationController   alloc] initWithRootViewController:lookVC];
    [self   presentViewController:nav animated:YES completion:nil];
}


-(void)presentSocialSignIn{
    SocialSignIn * controller =  [[SocialSignIn alloc] initWithNibName:@"SocialSignIn" bundle: nil];
    controller.passSocialSignIn = ^(NSInteger intType) {
        [self  presentVC];
    };
    controller.providesPresentationContextTransitionStyle = YES;
    controller.definesPresentationContext = YES;
    [controller setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:controller animated:YES completion:nil];
}



#pragma mark -  ALERT METHODS
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



#pragma mark -  HELPER METHODS
-(void)resetLoginFields{
    self.txtFldPassword.text =nil;
    self.txtFldUsername.text =nil;
    [self.btnRememberMe  setSelected:NO];
}





/*
 user_id
 first_name
 last_name
 email
 phone_no
 profile_photo
 */

/*
 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
 MainViewController *mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
 [mainViewController setupWithType:0];
 
 UIWindow *window = UIApplication.sharedApplication.delegate.window;
 window.rootViewController = mainViewController;
 [UIView transitionWithView:window duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
 }];
 */



@end

