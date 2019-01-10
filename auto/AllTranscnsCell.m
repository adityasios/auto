//
//  AllTranscnsCell.m
// aditya
//
//  Created by // aditya on 11/27/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "AllTranscnsCell.h"

@implementation AllTranscnsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.transactionNumber.font = kQuicksand_Regular12;
    self.transactionNumber.textColor = UIColorFromRGB(kappleDarkGrey);
    
    self.lblPackageName.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblPackageName.font = kQuicksand_Bold12;
    
    self.lblDate.textColor = UIColorFromRGB(kappleLightGrey);
    
    self.lblPrice.textColor = [UIColor blackColor];
    self.lblPrice.font = kQuicksand_Bold16;
    
    self.lblcancld.font = kQuicksand_Bold10;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
