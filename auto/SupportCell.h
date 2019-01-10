//
//  SupportCell.h
// aditya
//
//  Created by // aditya Kumar on 3/22/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Macros.h"

@interface SupportCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView * imgVIcon;
@property (strong, nonatomic) IBOutlet UILabel * lblTitle;
@property (strong, nonatomic) IBOutlet UILabel * lblTxt;

@end