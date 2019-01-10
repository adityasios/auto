//
//  CustomCell1.h
// aditya
//
//  Created by sahil bhatia on 26/11/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell1 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblNextService;
@property (weak, nonatomic) IBOutlet UILabel *lblServiceDate;
@property (weak, nonatomic) IBOutlet UIButton *btnDateSelectService;
@property (weak, nonatomic) IBOutlet UILabel *lblDaysLeftService;
@property (weak, nonatomic) IBOutlet UILabel *lblRegoDue;
@property (weak, nonatomic) IBOutlet UILabel *lblDateRegoDue;
@property (weak, nonatomic) IBOutlet UILabel *lblDaysLeftRego;
@property (weak, nonatomic) IBOutlet UIButton *btnDateSelectReg;

@end
