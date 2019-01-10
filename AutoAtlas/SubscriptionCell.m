//
//  SubscriptionCell.m
//  AutoAtlas
//
//  Created by webmazix on 11/24/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "SubscriptionCell.h"

@implementation SubscriptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //bg
    self.backgroundColor = UIColorFromRGB(kBackground);
    
    //viewbg
    self.viewCell.backgroundColor = UIColorFromRGB(kappleWhite);
    self.viewCell.layer.cornerRadius = 8.0;
    
    //dollar
    self.lblDollars.textColor = UIColorFromRGB(kappleGrey);
    self.lblDollars.font = kQuicksand_Regular12;
    
    //amt
    self.lblAmount.textColor = UIColorFromRGB(kappleGrey);
    self.lblAmount.font = kQuicksand_Bold24;
    
    //type
    self.lblAmountTime.textColor = UIColorFromRGB(kappleGrey);
    self.lblAmountTime.font = kQuicksand_Bold12;
    
    //no of vehicle
    self.lblNoOfVehicles.textColor = UIColorFromRGB(kappleWhite);
    self.lblNoOfVehicles.font = kQuicksand_Bold24;
    
    //vehicle
    self.lblVehicles.textColor = UIColorFromRGB(kappleWhite);
    self.lblVehicles.font = kQuicksand_Bold12;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
