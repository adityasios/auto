//
//  LeftMenuVC.m
// aditya
//
//  Created by // aditya on 10/31/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "LeftMenuVC.h"

@interface LeftMenuVC ()

@end

@implementation LeftMenuVC

#pragma mark -  VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  intializerMethod];
    [self  viewSetUp];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"SET HEADER -  %s",__PRETTY_FUNCTION__);
    [self  setHeaderData];
}


#pragma mark - INIT METHOD
-(void)intializerMethod{
    objGlobal = [GlobalValues  sharedManager];
    arrMenu = [NSArray arrayWithObjects:@"HOME",@"ADD NEW VEHICLE", @"SUBSCRIPTIONS", @"MY PROFILE", @"MY FAVORITES", @"NOTIFICATIONS",@"CHANGE PASSWORD", @"LOGOUT",nil];
    arrMenuExtra = [NSArray arrayWithObjects:@"Share this App",@"Rate in the App Store",@"Terms & Conditions", @"Privacy Policy",@"Support",nil];
    [self  initNotification];
}



-(void)initNotification{
    [[NSNotificationCenter  defaultCenter]  addObserver:self selector:@selector(willShowLeftMenu:) name:LGSideMenuWillShowLeftViewNotification object:nil];
}








#pragma mark - VIEW SET UP
-(void)viewSetUp{
    [self  setViews];
    [self  setLbl];
    [self  setImgV];
    
}

-(void)setViews{
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = UIColorFromRGB(k adityaGreen);
    self.tblViewLeft.backgroundColor = UIColorFromRGB(k adityaGreen);
    self.viewHeader.backgroundColor = UIColorFromRGB(k adityaGreen);
}



-(void)setLbl {
    self.lblNameHeader.font = kQuicksand_Bold13;
    self.lblNameHeader.textColor = UIColorFromRGB(kappleWhite);
    
    self.lblPlaceHeader.textColor = UIColorFromRGB(kappleWhite);
    self.lblPlaceHeader.font = kQuicksand_Regular13;
}


-(void)setImgV{
    self.imgProfileHeader.clipsToBounds = YES;
    self.imgProfileHeader.layer.cornerRadius = 40;
    self.imgProfileHeader.layer.borderWidth = 2;
    self.imgProfileHeader.layer.borderColor = UIColorFromRGB(kappleWhite).CGColor;
    self.imgProfileHeader.contentMode = UIViewContentModeScaleAspectFill;
}



-(void)setHeaderData{
    
    
    //profile image
    if (objGlobal.str_Profile.length > 5) {
        if (objGlobal.imgProfile) {
            self.imgProfileHeader.image = objGlobal.imgProfile;
        }else{
            
            NSURL * urlImg = [NSURL  URLWithString:objGlobal.str_Profile];
            [self.imgProfileHeader  sd_setShowActivityIndicatorView:YES];
            [self.imgProfileHeader  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [self.imgProfileHeader  sd_setImageWithURL:urlImg placeholderImage:kPlaceHolderUser_L completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                objGlobal.imgProfile = image;
            }];
        }
    }else{
        self.imgProfileHeader.image = kPlaceHolderUser_M;
    }
    
    //name
    self.lblNameHeader.text = objGlobal.str_FirstName.capitalizedString;
    
    //loc
    if (objGlobal.str_UserCity.length == 0 && objGlobal.str_UserCountry.length == 0) {
        self.lblPlaceHeader.hidden = YES;
    }else if (objGlobal.str_UserCity.length > 0 && objGlobal.str_UserCountry.length == 0){
        self.lblPlaceHeader.text = [NSString  stringWithFormat:@"%@",objGlobal.str_UserCity];
    }else if (objGlobal.str_UserCity.length == 0 && objGlobal.str_UserCountry.length > 0){
        self.lblPlaceHeader.text = [NSString  stringWithFormat:@"%@",objGlobal.str_UserCountry];
    }else if (objGlobal.str_UserCity.length > 0 && objGlobal.str_UserCountry.length > 0){
        self.lblPlaceHeader.numberOfLines = 2;
        self.lblPlaceHeader.text = [NSString  stringWithFormat:@"%@ \n%@",objGlobal.str_UserCity,objGlobal.str_UserCountry];
    }
}







#pragma mark - TABLE VIEW DATA SOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return (arrMenu.count+arrMenuExtra.count);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < arrMenu.count) {
        Customcell *cell = [tableView dequeueReusableCellWithIdentifier:@"Customcell" forIndexPath:indexPath];
        
        
        cell.lblText.text = [arrMenu objectAtIndex:indexPath.row];
        cell.lblText.textColor = UIColorFromRGB(kappleWhite);
        cell.lblText.font = kQuicksand_Bold14;
        return cell;
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Customcell2" forIndexPath:indexPath];
        cell.textLabel.text = [arrMenuExtra objectAtIndex:(indexPath.row-arrMenu.count)];
        cell.textLabel.textColor = UIColorFromRGB(kappleWhite);
        cell.textLabel.font = kQuicksand_Bold14;
        UIView* separatorLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, 1)];
        separatorLineView.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:separatorLineView];
        return cell;
    }
}

#pragma mark - DELEGATE TABLE VIEW
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainViewController * mainViewController = (MainViewController *)self.sideMenuController;
    
    if (indexPath.row < arrMenu.count) {
        Customcell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.backgroundColor = UIColorFromRGBWithAlpha(k adityaGreen, 0.5);
    }else{
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.backgroundColor = UIColorFromRGBWithAlpha(k adityaGreen, 0.5);
    }
    
    
    
    if (indexPath.row == 0) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
        HomeVC * homeVC = [story instantiateViewControllerWithIdentifier:@"HomeVC"];
        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:homeVC animated:YES];
        [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
    } else if (indexPath.row == 1) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
        AddNewVehicle *addVC = [story instantiateViewControllerWithIdentifier:@"AddNewVehicle"];
        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:addVC animated:YES];
        [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
    }else if (indexPath.row == 2) {
        
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Services" bundle:nil];
        SubsricptionsVC *subVC = [story instantiateViewControllerWithIdentifier:@"SubsricptionsVC"];
        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:subVC animated:YES];
        [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
        
    }else if (indexPath.row==3){
        UIStoryboard * story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
        ProfileBaseVC *profileVC = [story  instantiateViewControllerWithIdentifier:@"ProfileBaseVC"];
        
        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:profileVC animated:YES];
        [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
    }else  if (indexPath.row == 4) {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Services" bundle:nil];
        MyFavoritesVC *favVC = [story instantiateViewControllerWithIdentifier:@"MyFavoritesVC"];
        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:favVC animated:YES];
        [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
        
    }else if (indexPath.row==5) {
        NotificationsVC *notification = [self.storyboard instantiateViewControllerWithIdentifier:@"NotificationsVC"];
        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:notification animated:YES];
        [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
        
    }else if (indexPath.row==6) {
        
        ChangePassVC * changeVC = [[ChangePassVC  alloc]initWithNibName:@"ChangePassVC" bundle:nil];
        UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
        [navigationController pushViewController:changeVC animated:YES];
        [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
        
    }else if(indexPath.row == 7){
        [self  logOut];
    }else if(indexPath.row == 8){
        [self  shareApp];
    }else if(indexPath.row == 9){
        [self  rateApp];
    }else if(indexPath.row == 10){
        [self  showTermsCondition];
    }else if(indexPath.row == 11){
        [self  showPrivacyPolicy];
    }else if(indexPath.row == 12){
        [self  showSupport];
    }
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 35.0;
}


#pragma mark -  NOT SELECTOR
-(void)willShowLeftMenu:(NSNotification*)not{
    NSLog(@"__%s__",__PRETTY_FUNCTION__);
    [self  setHeaderData];
}




/*
 LOG OUT
 api/user/user_logout   ,
 device_id:138,
 */

#pragma mark -  WEBCALL
-(void)webcallForLogOut{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostUserLogOut];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara setObject:objGlobal.str_deviceId forKey:kdevice_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            NSLog(@"result = %@",result);
        } else {
            NSLog(@"error = %@",error.localizedDescription);
        }
    }];
}




#pragma mark -  HELPER METHODS

-(void)fbLogOut{
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
    [FBSDKAccessToken setCurrentAccessToken:nil];
}


-(void)logOut{
    
    objGlobal.str_userid = @"";
    objGlobal.str_FirstName = @"";
    objGlobal.str_Email = @"";
    objGlobal.str_Phone = @"";
    objGlobal.str_Profile = @"";
    objGlobal.strCreated = @"";
    objGlobal.imgProfile = nil;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [self  fbLogOut];
    }
    
    [[GIDSignIn sharedInstance] signOut];
    
    NSString * strrem = [Validations  getObjectForKey:kremember_me];
    if (strrem.length > 0) {
        NSString * stremail = [Validations  getObjectForKey:kemail];
        NSString * strpass = [Validations  getObjectForKey:kpassword_hash];
        [Validations  resetAllUserDefaults];
        [Validations  saveObject:stremail ForKey:kemail];
        [Validations  saveObject:strpass ForKey:kpassword_hash];
        [self.presentingViewController.presentingViewController  dismissViewControllerAnimated:NO completion:nil];
    }else{
        [Validations  resetAllUserDefaults];
        [self  webcallForLogOut];
        [self.presentingViewController.presentingViewController  dismissViewControllerAnimated:NO completion:nil];
    }
}






-(void)shareApp{
    MainViewController * mainViewController = (MainViewController *)self.sideMenuController;
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
    NSString *textToShare = @"Look at this awesome  aditya app for your vehicles , Get latest service notifications & much more!!";
    NSURL *myWebsite = [NSURL URLWithString:@"http://onelink.to/rfyzsu"];
    NSArray *objectsToShare = @[textToShare, myWebsite];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,UIActivityTypePrint,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo];
    activityVC.excludedActivityTypes = excludeActivities;
    [self presentViewController:activityVC animated:YES completion:nil];
}



-(void)rateApp{
    static NSString *const iOS7AppStoreURLFormat = @"itms-apps://itunes.apple.com/app/id%d";
    static NSString *const iOSAppStoreURLFormat = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d";
    NSURL * url =  [NSURL URLWithString:[NSString stringWithFormat:([[UIDevice currentDevice].systemVersion floatValue] >= 7.0f)? iOS7AppStoreURLFormat: iOSAppStoreURLFormat, YOUR_APP_STORE_ID]];
    [[UIApplication  sharedApplication] openURL:url options:@{} completionHandler:nil];
}


-(void)showTermsCondition{
    MainViewController * mainViewController = (MainViewController *)self.sideMenuController;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
    TermsAndConditionVC *favVC = [story instantiateViewControllerWithIdentifier:@"TermsAndConditionVC"];
    UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
    [navigationController pushViewController:favVC animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}


-(void)showPrivacyPolicy{
    MainViewController * mainViewController = (MainViewController *)self.sideMenuController;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
    PrivacyPolicyVC *favVC = [story instantiateViewControllerWithIdentifier:@"PrivacyPolicyVC"];
    UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
    [navigationController pushViewController:favVC animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}


-(void)showSupport{
    MainViewController * mainViewController = (MainViewController *)self.sideMenuController;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Extra" bundle:nil];
    SupportVC *favVC = [story instantiateViewControllerWithIdentifier:@"SupportVC"];
    UINavigationController *navigationController = (UINavigationController *)mainViewController.rootViewController;
    [navigationController pushViewController:favVC animated:YES];
    [mainViewController hideLeftViewAnimated:YES completionHandler:nil];
}



@end

