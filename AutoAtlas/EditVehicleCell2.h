//
//  EditVehicleCell2.h
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditVehicleCell2 : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblVehicleType;
@property (strong, nonatomic) IBOutlet UILabel *lblInsuranceDue;
@property (strong, nonatomic) IBOutlet UILabel *lblDateInsuranceDue;
@property (strong, nonatomic) IBOutlet UILabel *lblCarType;
@property (strong, nonatomic) IBOutlet UILabel *lblDaysLeftInsurance;

@property (strong, nonatomic) IBOutlet UIButton *btnInsuranceDue;

@end
