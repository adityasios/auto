//
//  SupportCell.m
//  AutoAtlas
//
//  Created by Aditya Kumar on 3/22/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "SupportCell.h"

@implementation SupportCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.lblTitle.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblTitle.font = kQuicksand_Bold14;
    
    self.lblTxt.textColor = UIColorFromRGB(kappleGrey);
    self.lblTxt.font = kQuicksand_Regular14;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
