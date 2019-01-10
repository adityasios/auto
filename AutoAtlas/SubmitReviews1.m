//
//  SubmitReviews1.m
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "SubmitReviews1.h"

@interface SubmitReviews1 ()

@end

@implementation SubmitReviews1


#pragma mark  VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self setUpViews];
}


#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobalValue = [GlobalValues sharedManager];
}


#pragma mark - VIEW SET UP
-(void)setUpViews {
    [self setLbl];
    [self  setViews];
    [self setBtn];
    [self  setImageView];
}

-(void)setLbl {
    
    self.lblName.font = kQuicksand_Bold14;
    self.lblName.textColor = [UIColor blackColor];
    self.lblName.text = self.objVendorList.name.capitalizedString;
    
    self.lblRateServiceProvider.textColor = UIColorFromRGB(kappleDarkGrey);
    self.lblRateServiceProvider.font = kQuicksand_Regular12;
    self.lblRateServiceProvider.text = [NSString  stringWithFormat:@"Rate for %@",self.objServiceType.service_name];
    
    self.lblLeaveComment.textColor = UIColorFromRGB(kappleDarkGrey);
    self.lblLeaveComment.font = kQuicksand_Regular11;
    
    self.txtViewComment.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtViewComment.layer.borderWidth = 1.0;
    self.txtViewComment.layer.cornerRadius = 1;
    self.txtViewComment.clipsToBounds = YES;
    self.txtViewComment.backgroundColor = UIColorFromRGBWithAlpha(kbgLightGrey, 0.5);
    
}

-(void)setBtn {
    
    self.btnSubmit.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    [self.btnSubmit setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    self.btnSubmit.titleLabel.font = kQuicksand_Bold14;
    self.btnSubmit.layer.cornerRadius = 12.0;
    
    self.btnCancel.backgroundColor = UIColorFromRGB(kappleGrey);
    [self.btnCancel setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    self.btnCancel.titleLabel.font = kQuicksand_Bold14;
    self.btnCancel.layer.cornerRadius = 12.0;
    
}

-(void)setImageView{
    
    //imgV
    self.imgServiceProvider.contentMode = UIViewContentModeScaleAspectFit;
    self.imgServiceProvider.clipsToBounds = YES;
    
    
    if (self.objVendorList.image) {
        if (self.objVendorList.imgProfile) {
            self.imgServiceProvider.image = self.objVendorList.imgProfile;
        }else{
            [self.imgServiceProvider  sd_setShowActivityIndicatorView:YES];
            [self.imgServiceProvider  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [self.imgServiceProvider  sd_setImageWithURL:self.objVendorList.image placeholderImage:kPlaceHolder_M completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                self.objVendorList.imgProfile = image;
            }];
            
        }
    }else{
        self.imgServiceProvider.image = kPlaceHolder_M;
    }
}

-(void)setViews{
    self.viewForStarRating.userInteractionEnabled = YES;
    self.viewForStarRating.allowsHalfStars = NO;
    self.viewForStarRating.continuous = NO;
    self.viewForStarRating.tintColor = UIColorFromRGB(kYellow);
}





#pragma mark - BUTTON ACTION
- (IBAction)btnSubmitAction:(id)sender {
    [self  webcallForSubmitReview];
}



- (IBAction)btnCancelAction:(id)sender {
    [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{
        NSLog(@"Popin dismissed !");
    }];
}


#pragma mark - TEXTVIEW DELEGATE
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}





/*
 http://websitedevelopment101.com/autoatlas/api/vendor/add_user_review
 POST
 key
 service_id
 user_id
 review
 rate_star
 vendor_id
 */




#pragma mark - WEBCALL
-(void)webcallForSubmitReview{
    
    
    self.txtViewComment.text = [Validations removeWhiteSpace:self.txtViewComment.text];
    self.txtViewComment.text = [Validations removeDoubleSpace:self.txtViewComment.text];
    
    NSString * strRate = [NSString  stringWithFormat:@"%d",(int)self.viewForStarRating.value];
    if (strRate.integerValue == 0) {
        [self  showAlertWithTitle:kError Withsubtitle:kPleaseSelRating withIndex:kIndexMaxValue];
        return;
    }
    
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostAddUserReview];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:self.objServiceType.service_id forKey:kservice_id];
    [mdictPara setObject:objGlobalValue.str_userid forKey:kuser_id];
    [mdictPara setObject:self.objVendorList.vendor_id forKey:kvendor_id];
    [mdictPara setObject:strRate forKey:krate_star];
    if (self.txtViewComment.text.length > 0) {
        [mdictPara  setObject:self.txtViewComment.text forKey:kreview];
    }
    
    [BasicUtility  showLoaderInView:self.view];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            if (strStatus.integerValue == 1) {
                NSLog(@"result = %@",result);
                self.passSubmitReview(1);
                [self.presentingPopinViewController dismissCurrentPopinControllerAnimated:YES completion:^{
                    NSLog(@"Popin dismissed !");
                }];
            }else{
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        }else{
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
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

@end

