//
//  EditVehicleCell1.h
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditVehicleCell1 : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *viewCell1;
@property (strong, nonatomic) IBOutlet UILabel *lblDaysLeftNextService;
@property (strong, nonatomic) IBOutlet UILabel *lblNextService;
@property (strong, nonatomic) IBOutlet UILabel *lblRegoDue;
@property (strong, nonatomic) IBOutlet UILabel *lblDateNextService;
@property (strong, nonatomic) IBOutlet UILabel *lblDaysLeftRegoDue;
@property (strong, nonatomic) IBOutlet UILabel *lblDateRegoDue;
@property (strong, nonatomic) IBOutlet UIButton *btnNextService;
@property (strong, nonatomic) IBOutlet UIButton *btnRegoDue;


@end
