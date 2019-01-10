//
//  ViewController.m
// aditya
//
//  Created by // aditya on 10/30/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializerMethod];
    [self viewSetUp];
}




#pragma mark - INTIALIZER METHOD
-(void)initializerMethod{
    objGlobal = [GlobalValues  sharedManager];
    self.navigationController.navigationBar.hidden = YES;
    self.pageControl.numberOfPages = 3;
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor = UIColorFromRGB(kAutoAtlasGreen);
    [self  setPageViewController];
    
    NSString * strUserID = [Validations  getObjectForKey:kuser_id];
    if (strUserID.integerValue > 0) {
        [self  autoLoginApp];
    }
}




-(void)setPageViewController{
    self.PageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pageViewControllerMenu"];
    self.PageViewController.dataSource = self;
    self.PageViewController.delegate = self;
    
    NSArray *viewControllers = @[[self  itemControllerForIndex:0]];
    [self.PageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    if (IS_IPHONE_X) {
        self.PageViewController.view.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-80);
    }else{
        self.PageViewController.view.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT-45);
    }
    
    
    
    [self addChildViewController:self.PageViewController];
    [self.view addSubview:self.PageViewController.view];
    [self.PageViewController didMoveToParentViewController:self];
}




-(void)autoLoginApp{
    NSString * strUserID = [Validations  getObjectForKey:kuser_id];
    NSString * strfirstName = [Validations  getObjectForKey:kfirst_name];
    NSString * strEmail = [Validations  getObjectForKey:kemail];
    NSString * strPhoneNo = [Validations  getObjectForKey:kphone_no];
    NSString * strProfile = [Validations  getObjectForKey:kprofile_photo];
    NSString * strCreatedAt = [Validations  getObjectForKey:kcreated_at];
    
    if ([Validations  isObjectNull:strUserID]) {
        strUserID = @"";
        return;
    }
    
    if ([Validations  isObjectNull:strfirstName]) {
        strfirstName = @"";
    }
    
    if ([Validations  isObjectNull:strEmail]) {
        strEmail = @"";
    }
    
    if ([Validations  isObjectNull:strPhoneNo]) {
        strPhoneNo = @"";
    }
    
    if ([Validations  isObjectNull:strProfile]) {
        strProfile = @"";
    }
    
    if ([Validations  isObjectNull:strCreatedAt]) {
        strCreatedAt = @"";
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
    
    
    objGlobal.str_userid = strUserID;
    objGlobal.str_FirstName = strfirstName;
    objGlobal.str_Email = strEmail;
    objGlobal.str_Phone = strPhoneNo;
    objGlobal.str_Profile = strProfile;
    objGlobal.strCreated = strCreatedAt;
    
    [self  presentVC];
    
}


#pragma mark - PRESENT VC
-(void)presentVC{
    UIStoryboard * story = [UIStoryboard   storyboardWithName:@"Profile" bundle:nil];
    LookingServiceVC * lookVC = [story  instantiateViewControllerWithIdentifier:@"LookingServiceVC"];
    UINavigationController   * nav = [[UINavigationController   alloc] initWithRootViewController:lookVC];
    [self   presentViewController:nav animated:YES completion:nil];
}



#pragma mark - VIEW SET UP
-(void)viewSetUp {
    self.btnSkip.titleLabel.font = kQuicksand_Bold12;
    [self.btnSkip setTitleColor:UIColorFromRGB(kappleBlack) forState:UIControlStateNormal];
    [self.btnSkip setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateHighlighted];
}



#pragma mark -  PAGEVIEWCONTROLLER METHODS
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    IntroVC *itemController = (IntroVC *)viewController;
    if (itemController.index == 1 || itemController.index == 2){
        return [self itemControllerForIndex:itemController.index-1];
    }
    return nil;
}




- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    IntroVC * itemController = (IntroVC *)viewController;
    if (itemController.index == 0 || itemController.index == 1){
        return [self itemControllerForIndex:itemController.index+1];
    }
    return nil;
}




-(void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers{
    IntroVC * itemController = (IntroVC *) [pendingViewControllers objectAtIndex:0];
    intCurrentIndex = itemController.index;
    self.pageControl.currentPage = intCurrentIndex;
    
    if (intCurrentIndex == 0) {
        [self.btnSkip setTitle:@"SKIP" forState:UIControlStateNormal];
        [self.btnSkip setTitleColor:UIColorFromRGB(kappleDarkGrey) forState:UIControlStateNormal];
    }else if (intCurrentIndex==1) {
        [self.btnSkip setTitle:@"SKIP" forState:UIControlStateNormal];
        [self.btnSkip setTitleColor:UIColorFromRGB(kappleDarkGrey) forState:UIControlStateNormal];
    }else {
        [self.btnSkip setTitle:@"ALLOW & ACCEPT " forState:UIControlStateNormal];
        [self.btnSkip setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    }
}


-(IntroVC *)itemControllerForIndex:(NSUInteger)itemIndex {
    IntroVC *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"IntroVC"];
    controller.index = itemIndex;
    return controller;
}




#pragma mark - ACTION METHODS
- (IBAction)btnSkipAction:(id)sender {
    ProceedVC *pVC = [[ProceedVC alloc] initWithNibName:@"ProceedVC" bundle:nil];
    [self.navigationController pushViewController:pVC animated:YES];
}


@end
