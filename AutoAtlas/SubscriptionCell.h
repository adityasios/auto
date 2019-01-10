//
//  SubscriptionCell.h
//  AutoAtlas
//
//  Created by webmazix on 11/24/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Macros.h"

@interface SubscriptionCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView * viewCell;

@property (strong, nonatomic) IBOutlet UILabel * lblNoOfVehicles;
@property (strong, nonatomic) IBOutlet UILabel * lblVehicles;
@property (strong, nonatomic) IBOutlet UILabel * lblDollars;
@property (strong, nonatomic) IBOutlet UILabel * lblAmount;
@property (strong, nonatomic) IBOutlet UILabel * lblAmountTime;

@end

