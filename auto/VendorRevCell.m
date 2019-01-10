//
//  VendorRevCell.m
// aditya
//
//  Created by // aditya Kumar on 3/15/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "VendorRevCell.h"

@implementation VendorRevCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = UIColorFromRGB(kBackground);
    
    self.imgVProfile.layer.cornerRadius = 25;
    self.imgVProfile.clipsToBounds = YES;
    
    self.lblUserName.font = kQuicksand_Bold14;
    self.lblUserName.textColor = UIColorFromRGB(kAutoAtlasGreen);
    
    self.lblDate.font = kQuicksand_Regular11;
    self.lblDate.textColor = UIColorFromRGB(kappleGrey);
    
    
    self.ratingView.tintColor = UIColorFromRGB(kYellow);
    self.ratingView.backgroundColor = [UIColor  clearColor];
    
    self.lblRev.font = kQuicksand_Regular13;
    self.lblRev.textColor = UIColorFromRGB(kappleDarkGrey);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
