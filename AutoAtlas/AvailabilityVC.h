//
//  AvailabilityVC.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 1/17/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "GlobalValues.h"
#import "BasicUtility.h"

//other
#import "AvailabilityCell.h"
#import "UIViewController+MaryPopin.h"

//model
#import "BussinessDay.h"



@interface AvailabilityVC : UIViewController<UITableViewDelegate,UITableViewDelegate>{
    GlobalValues * objGlobalValue;
    NSDateFormatter * dateFormatInitial;
    NSDateFormatter * dateFormatFinal;
}

@property (strong, nonatomic)  NSArray * arrDataPass;
@property (strong, nonatomic) IBOutlet UITableView * tblv;
@property (strong, nonatomic) IBOutlet UILabel * lblTitle;
@property (strong, nonatomic) IBOutlet UIButton * btnSubmit;

-(IBAction)btnSubmitClicked:(UIButton *)sender;

-(void)intializerMethod;
-(void)viewSetUp;



@end

