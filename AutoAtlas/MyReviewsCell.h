//
//  MyReviewsCell.h
//  AutoAtlas
//
//  Created by webmazix on 11/23/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCSStarRatingView.h"
#import "Constant.h"
#import "Macros.h"

@interface MyReviewsCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView * viewBg;
@property (strong, nonatomic) IBOutlet UIImageView * imgVProfile;

@property (strong, nonatomic) IBOutlet UILabel *lblVendorName;
@property (strong, nonatomic) IBOutlet UILabel *lblDate;
@property (strong, nonatomic) IBOutlet UILabel *lblRating;
@property (strong, nonatomic) IBOutlet UILabel *lblMyComment;
@property (strong, nonatomic) IBOutlet UILabel *lblCommentDesc;

@property (weak, nonatomic) IBOutlet HCSStarRatingView *ratingView;




@end
