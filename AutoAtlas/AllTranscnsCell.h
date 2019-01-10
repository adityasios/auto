//
//  AllTranscnsCell.h
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Macros.h"

@interface AllTranscnsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *transactionNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblPackageName;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblcancld;

@end
