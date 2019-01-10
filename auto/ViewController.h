//
//  ViewController.h
// aditya
//
//  Created by // aditya on 10/30/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "GlobalValues.h"

//other
#import "IntroVC.h"
#import "ProceedVC.h"



@interface ViewController : UIViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource> {
    NSInteger intCurrentIndex;
    GlobalValues * objGlobal;
}


@property (nonatomic,strong) UIPageViewController *PageViewController;

@property (strong, nonatomic) IBOutlet UIButton * btnSkip;
@property (strong, nonatomic) IBOutlet UIPageControl * pageControl;


- (IBAction)btnSkipAction:(id)sender;

-(void)initializerMethod;
-(void)setPageViewController;
-(void)autoLoginApp;
-(void)viewSetUp;
-(void)presentVC;


@end

