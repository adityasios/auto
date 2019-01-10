//
//  IntroVC.h
// aditya
//
//  Created by // aditya on 10/30/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"

//other
#import "ViewController.h"


@interface IntroVC : UIViewController

@property (nonatomic) NSInteger index;
@property (strong, nonatomic) IBOutlet UILabel *lbl1Text;
@property (strong, nonatomic) IBOutlet UILabel *lbl2Text;
@property (strong, nonatomic) IBOutlet UIImageView *imgIntro;


-(void)viewSetUp;

@end
