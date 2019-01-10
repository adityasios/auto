//
//  CustomCell3.h
//  AutoAtlas
//
//  Created by sahil bhatia on 26/11/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell3 : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblVhicleMake;
@property (weak, nonatomic) IBOutlet UILabel *lblVehicleCompany;
- (IBAction)btnNextVehicleMake:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblYearModel;
@property (weak, nonatomic) IBOutlet UILabel *lblPetrolOrDiesel;
@property (weak, nonatomic) IBOutlet UILabel *lblSeperator;
@property (weak, nonatomic) IBOutlet UILabel *lblModelYear;
@property (weak, nonatomic) IBOutlet UIButton *btnBackModelYear;

@end
