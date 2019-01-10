
//  ProfileBaseVC.m
//  AutoAtlas
//  Created by webmazix on 11/23/17.
//  Copyright © 2017 webmazix. All rights reserved.

#import "ProfileBaseVC.h"

@interface ProfileBaseVC ()

@end

@implementation ProfileBaseVC

#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self viewSetup];
    [self setCarbonKit];
    [self  setProfileData];
}


#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
}


#pragma mark - VIEW SET UP
-(void)viewSetup {
    [self  customNavTitle:@"Profile"];
    [self setViews];
    [self setLbl];
    [self  setImgV];
}

-(void)setViews{
    self.viewProfileImage.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.viewProfileData.backgroundColor = UIColorFromRGB(kBackground);
    self.view.backgroundColor = UIColorFromRGB(kBackground);
}


-(void)setLbl {
    
    
    self.lblUserName.font = kQuicksand_Bold14;
    self.lblUserName.textColor = [UIColor whiteColor];
    
    
    
    self.lblProfile.font = kQuicksand_Bold14;
    self.lblProfile.textColor = [UIColor blackColor];
    
    
    self.lblMobile.font = kQuicksand_Bold12;
    self.lblMobile.textColor = UIColorFromRGB(kappleDarkGrey);
    
    
    self.lblMobileNo.font = kQuicksand_Regular12;
    self.lblMobileNo.textColor = UIColorFromRGB(kappleGrey);
    
   
    self.lblEmail.font = kQuicksand_Bold12;
    self.lblEmail.textColor = UIColorFromRGB(kappleDarkGrey);
    
    self.lblEmailAddress.font = kQuicksand_Regular12;
    self.lblEmailAddress.textColor = UIColorFromRGB(kappleGrey);
   
}


-(void)customNavTitle:(NSString *)str{
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: kQuicksand_Bold14, NSFontAttributeName,  [UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.btnBack,titleBarButton];
}



-(void)setImgV{
    
    
    //profile image
    self.imgVProfile.clipsToBounds = YES;
    self.imgVProfile.layer.cornerRadius = 30;
    self.imgVProfile.layer.borderWidth = 2;
    self.imgVProfile.layer.borderColor = UIColorFromRGB(kappleWhite).CGColor;
    self.imgVProfile.contentMode = UIViewContentModeScaleAspectFill;
    
    
    if (objGlobal.str_Profile.length > 5) {
        if (objGlobal.imgProfile) {
            self.imgVProfile.image = objGlobal.imgProfile;
        }else{
            NSURL * urlImg = [NSURL  URLWithString:objGlobal.str_Profile];
            [self.imgVProfile  sd_setShowActivityIndicatorView:YES];
            [self.imgVProfile  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [self.imgVProfile  sd_setImageWithURL:urlImg placeholderImage:kPlaceHolderUser_L completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                objGlobal.imgProfile = image;
            }];
        }
    }else{
        self.imgVProfile.image = kPlaceHolderUser_M;
    }
}


-(void)setProfileData{
    
    //user name
    self.lblUserName.text = objGlobal.str_FirstName;
    
    //phone no
    if (objGlobal.str_Phone.length >2) {
        self.lblMobileNo.text = objGlobal.str_Phone;
    }else{
        self.lblMobileNo.text = @"N/A";
    }
    
    //email
    self.lblEmailAddress.text = objGlobal.str_Email;
}



#pragma mark - CARBON KIT
-(void)setCarbonKit{
    
    items = @[@"VEHICLE INFO", @"MY REVIEWS"];
    carbonTabSwipeNavigation =
    [[CarbonTabSwipeNavigation alloc] initWithItems:items toolBar:self.toolBar delegate:self];
    [carbonTabSwipeNavigation insertIntoRootViewController:self andTargetView:self.tabBarView];
    [self  style];
}


- (void)style {
    
    [carbonTabSwipeNavigation setIndicatorColor:UIColorFromRGBWithAlpha(kAutoAtlasGreen, 1.0)];
    [carbonTabSwipeNavigation setNormalColor:UIColorFromRGBWithAlpha(kappleDarkGrey, 1.0)];
    [carbonTabSwipeNavigation setSelectedColor:UIColorFromRGBWithAlpha(kAutoAtlasGreen, 1.0)];
    
    
    [carbonTabSwipeNavigation setTabExtraWidth:10];
    [carbonTabSwipeNavigation.carbonSegmentedControl setWidth:SCREEN_WIDTH*.5 forSegmentAtIndex:0];
    [carbonTabSwipeNavigation.carbonSegmentedControl setWidth:SCREEN_WIDTH*.5 forSegmentAtIndex:1];
    carbonTabSwipeNavigation.carbonSegmentedControl.backgroundColor =  UIColorFromRGBWithAlpha(kappleWhite, 1.0);
    
    
    [carbonTabSwipeNavigation setNormalColor:UIColorFromRGB(kappleGrey) font:kQuicksand_Bold14];
    [carbonTabSwipeNavigation setSelectedColor:UIColorFromRGB(kAutoAtlasGreen) font:kQuicksand_Bold14];
}


#pragma mark - CARBON DELEGATE METHOD
- (nonnull UIViewController *)carbonTabSwipeNavigation: (nonnull CarbonTabSwipeNavigation *)carbontTabSwipeNavigation viewControllerAtIndex:(NSUInteger)index {
    if (index == 0) {
        UIStoryboard * story = [UIStoryboard  storyboardWithName:@"Profile" bundle:nil];
        VehicleListVC * objAvl = [story  instantiateViewControllerWithIdentifier:@"VehicleListVC"];
        return objAvl;
    }else {
        MyReviewsVC *reviewsVc = [[MyReviewsVC alloc]initWithNibName:@"MyReviewsVC" bundle:nil];
        return reviewsVc;
    }
}


- (void)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation willMoveAtIndex:(NSUInteger)index {
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"index = %ld",index);
}

- (void)carbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation  didMoveAtIndex:(NSUInteger)index {
    NSLog(@"Did move at index: %ld", index);
}


- (UIBarPosition)barPositionForCarbonTabSwipeNavigation:(nonnull CarbonTabSwipeNavigation *)carbonTabSwipeNavigation {
    return UIBarPositionTop;
}


#pragma mark - ACTION METHODS
- (IBAction)barBtnBackAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnEditAction:(id)sender {
    EditProfileVC * controller =  [[EditProfileVC alloc] initWithNibName:@"EditProfileVC" bundle: nil];
    controller.passEditProfile = ^(NSInteger index) {
        [self  setProfileData];
    };
    controller.providesPresentationContextTransitionStyle = YES;
    controller.definesPresentationContext = YES;
    [controller setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:controller animated:YES completion:nil];
}


- (IBAction)btnCameraAction:(id)sender{
    [self presentImagePicker];
}




#pragma mark - IMAGE PICKER DELEGATE
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage * imgChoosen = info[UIImagePickerControllerEditedImage];
    UIImage * imgEdited = [BasicUtility  imageWithImage:imgChoosen scaledToSize:CGSizeMake(200, 200)];
    [picker dismissViewControllerAnimated:YES completion:^{
        NSData *  imageData = UIImageJPEGRepresentation(imgEdited, 0.7);
        if (imageData.length > 0) {
            self.imgVProfile.image = imgEdited;
            [self  webCallForPostProfileImage:imageData WithImage:imgEdited];
        }
    }];
}





/*
 UPDATE PROFILE IMAGE
 http://websitedevelopment101.com/autoatlas/api/user/update_profile_image
 POST
 key:8dfafb41e9b4c0b3decd875e7a231049
 profile_photo:abc.png
 user_id:62
 */


#pragma mark - WEBCALL
-(void)webCallForPostProfileImage:(NSData *)dataImgProfile WithImage:(UIImage *)imgProfile{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostUpdateProfileImg];
    
    //para
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:strPost]];
    
    
    AFHTTPRequestOperation *op = [manager POST:kPostUpdateProfileImg parameters:mdictPara constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:dataImgProfile name:kprofile_photo    fileName:@"photo.jpg" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        NSLog(@"responseObject = %@",responseObject);
        NSString * strstatus = [responseObject objectForKey:kstatus];
        NSString * strmsg = [responseObject objectForKey:kmessage];
        if (strstatus.integerValue == 1) {
            [BasicUtility  showToastinView:self.view WithDesc:kProfileImageUpdated];
            NSDictionary * dictData = [responseObject objectForKey:kdata];
            [self  parsingDataForProfileWithImage:imgProfile WithResponse:dictData];
        }else{
            [BasicUtility  showToastinView:self.view WithDesc:strmsg];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"operation Response = %@",operation.responseString);
        [self  setImgV];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self  showAlertWithTitle:kError Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
    }];
    [op start];
}



#pragma mark - PARSING WEBCALL
-(void)parsingDataForProfileWithImage:(UIImage *)imgProfile WithResponse:(NSDictionary *)dictData{
    NSString * strProfile = [dictData objectForKey:kprofile_photo];
    objGlobal.str_Profile = strProfile;
    objGlobal.imgProfile = imgProfile;
    [Validations saveObject:strProfile ForKey:kprofile_photo];
}












#pragma mark - HELPER
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}


-(void)presentImagePicker{
    
    
    UIAlertController * actionSheet = [UIAlertController alertControllerWithTitle:nil message:@"Select Option" preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:NULL];
        }
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [picker.navigationBar setBarTintColor:UIColorFromRGBWithAlpha(kAutoAtlasGreen, 1.0)];
        [picker.navigationBar  setTranslucent:NO];
        picker.navigationBar.tintColor = [UIColor  whiteColor];
        [self presentViewController:picker animated:YES completion:NULL];
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}






#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }else if(index == 1){
            [self.navigationController  popViewControllerAnimated:YES];
        }else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}












@end
