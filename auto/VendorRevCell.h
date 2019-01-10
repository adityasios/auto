//
//  VendorRevCell.h
// aditya
//
//  Created by // aditya Kumar on 3/15/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCSStarRatingView.h"
#import "Constant.h"
#import "Macros.h"

@interface VendorRevCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel * lblUserName;
@property (strong, nonatomic) IBOutlet UILabel * lblRev;
@property (strong, nonatomic) IBOutlet UILabel * lblDate;
@property (strong, nonatomic) IBOutlet UIImageView * imgVProfile;
@property (strong, nonatomic) IBOutlet HCSStarRatingView * ratingView;

@end



/*
"user_name": "Raminder ",
"profile_image": "http:\/\/websitedevelopment101.com\/autoatlas\/assets\/uploads\/user_images\/eebef3f7be5b360cedb97dae6644d9b1.jpg",
"rate_star": "3",
"review": "hiiiiiii yooo"
*/
