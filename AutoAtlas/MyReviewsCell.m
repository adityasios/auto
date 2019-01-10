//
//  MyReviewsCell.m
//  AutoAtlas
//
//  Created by webmazix on 11/23/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "MyReviewsCell.h"

@implementation MyReviewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.viewBg.backgroundColor = UIColorFromRGB(kBackground);
    
    self.imgVProfile.layer.cornerRadius = 20;
    self.imgVProfile.clipsToBounds = YES;
    
    self.lblVendorName.font = kQuicksand_Bold15;
    self.lblVendorName.textColor = [UIColor  darkTextColor];
    
    self.lblDate.font = kQuicksand_Bold12;
    self.lblDate.textColor = UIColorFromRGB(kappleGrey);
    
    self.lblRating.font = kQuicksand_Regular14;
    self.lblRating.textColor = [UIColor  darkTextColor];
    
    self.lblMyComment.font = kQuicksand_Bold14;
    self.lblMyComment.textColor = UIColorFromRGB(kAutoAtlasGreen);
    
    self.ratingView.tintColor = UIColorFromRGB(kYellow);
    
    self.lblCommentDesc.font = kQuicksand_Regular12;
    self.lblCommentDesc.textColor = UIColorFromRGB(kappleDarkGrey);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
