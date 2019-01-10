//
//  SignUpVC.m
//  AutoAtlas
//
//  Created by webmazix on 10/31/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "SignUpVC.h"

@interface SignUpVC ()

@end

@implementation SignUpVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self intializerMethod];
    [self viewSetUp];
}

-(void)viewDidAppear:(BOOL)animated{
      [[self navigationController] setNavigationBarHidden:YES animated:NO];
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
    self.lblAcceptOur.font = kQuicksand_Regular11;
    self.lblAcceptOur.textColor = UIColorFromRGB(kappleGrey);
    
    self.lblAnd.font = kQuicksand_Regular11;
    self.lblAnd.textColor = UIColorFromRGB(kappleGrey);
    
    self.lblDntHvAccnt.font = kQuicksand_Regular11;
    self.lblDntHvAccnt.textColor = UIColorFromRGB(kappleDarkGrey);
    
    
    self.lblNameBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    self.lblPswdBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    self.lblEmailBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    self.lblCnfrmBtm.backgroundColor = UIColorFromRGB(kappleGrey);
}


-(void)setBtn{
    
    self.btnAcceptTerms.layer.borderWidth = 1;
    self.btnAcceptTerms.layer.borderColor = UIColorFromRGB(kappleDarkGrey).CGColor;
    
    self.btnTermsOfUse.titleLabel.font = kQuicksand_Regular11;
    self.btnPrivacyPolicy.titleLabel.font = kQuicksand_Regular11;
    
    self.btnSignInBottom.titleLabel.font = kQuicksand_Regular13;
    [self.btnSignInBottom   setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    
    self.btnSignUp.layer.cornerRadius = 2.0;
    self.btnSignUp.clipsToBounds = YES;
    self.btnSignUp.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.btnSignUp.titleLabel.font = kQuicksand_Bold14;
    [self.btnSignUp setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSForegroundColorAttributeName:UIColorFromRGB(kAutoAtlasGreen),
                            NSFontAttributeName:kQuicksand_Regular12
                            };
    NSAttributedString * atr = [[NSAttributedString  alloc]initWithString:@"Sign In" attributes:dict1];
    [self.btnSignInBottom setAttributedTitle:atr forState:UIControlStateNormal];
}


-(void)setTxfd{
    self.txtFldName.font = kQuicksand_Regular12;
    self.txtfldEmail.font = kQuicksand_Regular12;
    self.txtFldPswd.font = kQuicksand_Regular12;
    self.txtFldCnfrmPswd.font = kQuicksand_Regular12;
    [self.txtfldEmail setKeyboardType:UIKeyboardTypeEmailAddress];
    self.txtFldPswd.returnKeyType = UIReturnKeyDone;
    self.txtFldCnfrmPswd.returnKeyType = UIReturnKeyDone;
    self.txtFldName.delegate = self;
    self.txtfldEmail.delegate = self;
    self.txtFldPswd.delegate = self;
    self.txtFldCnfrmPswd.delegate = self;
    self.txtFldPswd.secureTextEntry = YES;
    self.txtFldCnfrmPswd.secureTextEntry = YES;
}


#pragma mark - DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.txtFldName) {
        self.lblNameBtm.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    }else if (textField == self.txtfldEmail){
        self.lblEmailBtm.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    }else if (textField == self.txtFldPswd) {
        self.lblPswdBtm.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    }else {
        self.lblCnfrmBtm.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    }
}




-(void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField == self.txtFldName) {
        self.lblNameBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    }else if (textField == self.txtfldEmail){
        self.lblEmailBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    }else if (textField == self.txtFldPswd) {
        self.lblPswdBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    }else {
        self.lblCnfrmBtm.backgroundColor = UIColorFromRGB(kappleGrey);
    }
}



-(void)dismissKeyboard {
    [self.txtFldName resignFirstResponder];
    [self.txtfldEmail resignFirstResponder];
    [self.txtFldPswd resignFirstResponder];
    [self.txtFldCnfrmPswd resignFirstResponder];
}





#pragma mark - BUTTON ACTION
- (IBAction)btnAcceptTermsAction:(UIButton *)sender {
    if (sender.isSelected) {
        [sender  setSelected:NO];
    }else{
        [sender  setSelected:YES];
    }
}


- (IBAction)btnTermsOfUseAction:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
    SignupTermsVC *newVehicleVC = [story instantiateViewControllerWithIdentifier:@"SignupTermsVC"];
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:newVehicleVC animated:YES];
}

- (IBAction)btnSignUpAction:(id)sender {
    [self.view endEditing:YES];
    [self validateForm];
}

- (IBAction)btnPrivacyPolicyAction:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
    SignupPrivacyPolicyVC *newVehicleVC = [story instantiateViewControllerWithIdentifier:@"SignupPrivacyPolicyVC"];
     [[self navigationController] setNavigationBarHidden:NO animated:YES];
    [self.navigationController pushViewController:newVehicleVC animated:YES];
}


- (IBAction)btnSignInBottomAction:(id)sender {
    if (self.intFromLogin == 1) {
        [self.navigationController  popViewControllerAnimated:YES];
    }else{
        LoginVC *logVc = [[LoginVC alloc] initWithNibName:@"LoginVC" bundle:nil];
        logVc.intFromSignUp = 1;
        [self.navigationController pushViewController:logVc animated:YES];
    }
}



#pragma mark -  VALIDATE WEBCALL
-(void)validateForm{
    
    self.txtFldName.text = [Validations  removeWhiteSpace:self.txtFldName.text];
    self.txtFldName.text = [Validations  removeDoubleSpace:self.txtFldName.text];
    
    self.txtfldEmail.text = [Validations  removeWhiteSpace:self.txtfldEmail.text];
    self.txtfldEmail.text = [Validations  removeDoubleSpace:self.txtfldEmail.text];
    
    self.txtFldPswd.text = [Validations  removeWhiteSpace:self.txtFldPswd.text];
    self.txtFldPswd.text = [Validations  removeDoubleSpace:self.txtFldPswd.text];
    
    self.txtFldCnfrmPswd.text = [Validations  removeWhiteSpace:self.txtFldCnfrmPswd.text];
    self.txtFldCnfrmPswd.text = [Validations  removeDoubleSpace:self.txtFldCnfrmPswd.text];
    
    
    if(self.txtFldName.text.length <4){
        [self  showAlertWithTitle:kAlert Withsubtitle:knameValidate withIndex:kIndexMaxValue];
        return;
    }
    
    
    
    if(![Validations isValidEmail:self.txtfldEmail.text]){
        [self  showAlertWithTitle:kAlert Withsubtitle:kemailValidate withIndex:kIndexMaxValue];
        return;
    }
    
    
    
    if(self.txtFldPswd.text.length < 5){
        [self  showAlertWithTitle:kAlert Withsubtitle:kpasswordValidate  withIndex:kIndexMaxValue];
        return;
    }
    
    
    if (![self.txtFldPswd.text  isEqualToString:self.txtFldCnfrmPswd.text]) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kpasswordReConfirm  withIndex:kIndexMaxValue];
        return;
    }
    
    
    if (!self.btnAcceptTerms.isSelected) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kAcceptTerms  withIndex:kIndexMaxValue];
        return;
    }
    
    
    
    if ([BasicUtility  isInternetAvailable]) {
        [self  webCallForSignUp];
    }else{
        [self  showAlertWithTitle:kNotNetAvailable Withsubtitle:kInternetError withIndex:kIndexMaxValue];
    }
}








#pragma mark - WEBCALL
- (void)webCallForSignUp {
    
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostSignUp];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara setObject:self.txtfldEmail.text forKey:kemail];
    [mdictPara  setObject:self.txtFldName.text forKey:kfirst_name];
    [mdictPara  setObject:self.txtFldPswd.text forKey:kpassword_hash];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
   
    [BasicUtility  showLoaderInView:self.view];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        
        if (!error) {
            NSLog(@"RESULT  = %@", result);
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                NSDictionary * dictData = [result objectForKey:kdata];
                [self  parsingDataForSignUp:dictData];
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}


#pragma mark - SIGN UP
-(void)parsingDataForSignUp:(NSDictionary *)dictRes{
    
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
    
    [self  presentVC];
}


#pragma mark - PRESENT VC
-(void)presentVC{
    
    UIStoryboard * story = [UIStoryboard   storyboardWithName:@"Profile" bundle:nil];
    LookingServiceVC * lookVC = [story  instantiateViewControllerWithIdentifier:@"LookingServiceVC"];
    UINavigationController   * nav = [[UINavigationController   alloc] initWithRootViewController:lookVC];
    [self   presentViewController:nav animated:YES completion:^{
        [self.navigationController  popToRootViewControllerAnimated:YES];
    }];
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






/*
2018-01-16 22:51:25.829278+0530 AutoAtlas[2962:589146] RESULT  = {
    data =     {
        "created_at" = "2018-01-16 22:51:22";
        email = "test1@gmail.com";
        "first_name" = "test one";
        hash = 71b8e9c6495293eee5f56c04e2acd426;
        "image_display_name" = "<null>";
        "last_name" = "<null>";
        "oauth_provider" = "";
        "oauth_uid" = "";
        otp = 0;
        password = 251396e1b209a270fb4015d763407daf6e6cdb084842d5ad03f9a0a4bb6233b6bf1dec4527bb51d5a3c44e27582754e153402c423132316eb1a5042042110ced;
        "phone_no" = "<null>";
        "profile_image" = "<null>";
        "social_profile_updated" = 0;
        status = Active;
        "subscription_expiry_date" = "<null>";
        "subscription_id" = 1;
        token = badc07d7479bd51a0dea72f871c75ea9;
        "total_vehicles" = 10;
        "used_vehicle" = 0;
        "user_id" = 91;
        "user_profile_id" = 4;
    };
    message = "Your account created successfully.";
    status = 1;
}
*/












@end
