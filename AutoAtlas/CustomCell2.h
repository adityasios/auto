//
//  CustomCell2.h
//  AutoAtlas
//
//  Created by sahil bhatia on 26/11/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell2 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblVehicleType;
@property (weak, nonatomic) IBOutlet UILabel *lblCarType;
@property (weak, nonatomic) IBOutlet UILabel *lblInsuranceDue;
@property (weak, nonatomic) IBOutlet UILabel *lblDateInsuranceDue;
@property (weak, nonatomic) IBOutlet UIButton *btnSelectDateInsurance;
@property (weak, nonatomic) IBOutlet UILabel *btnDaysLeftForInsurance;
- (IBAction)btnSelectDateForInsurance:(id)sender;

@end
