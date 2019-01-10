//
//  CurrentLocationVC.h
// aditya
//
//  Created by // aditya on 11/24/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Macros.h"
#import "SubsricptionsVC.h"

@interface CurrentLocationVC : UIViewController
@property (strong, nonatomic) IBOutlet UIView *viewUpper;
- (IBAction)btnSearchAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *txtFldSearchLocation;
- (IBAction)btnCrossAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnExploreServices;
- (IBAction)btnExploreServices:(id)sender;


-(void)setUpViews;
-(void)setViews;
-(void)setBtn;
@end
