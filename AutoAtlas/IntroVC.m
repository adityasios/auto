//
//  IntroVC.m
//  AutoAtlas
//
//  Created by webmazix on 10/30/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "IntroVC.h"

@interface IntroVC ()

@end

@implementation IntroVC




#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewSetUp];
}



-(void)viewSetUp {
    
    self.imgIntro.contentMode = UIViewContentModeScaleAspectFill;
    self.imgIntro.clipsToBounds = YES;
    
    
    self.lbl1Text.textColor = [UIColor blackColor];
    self.lbl1Text.font = kQuicksand_Bold16;
    
    self.lbl2Text.textColor = UIColorFromRGB(kappleDarkGrey);
    self.lbl2Text.font = kQuicksand_Regular12;
    
    if (self.index == 0) {
        self.lbl1Text.text = @"Find Verified \n Service Providers";
        self.lbl2Text.text = @"Have complete confidence in choosing your \n next repair service";
        self.imgIntro.image = [UIImage imageNamed:@"fintd"];
    }else if (self.index == 1) {
        self.lbl1Text.text = @"Get the best deals \n on selected services";
        self.lbl2Text.text = @"Find great specials near you on all tyres and \n auto repairs";
        self.imgIntro.image = [UIImage imageNamed:@"tag"];
    }else if (self.index == 2) {
        self.lbl1Text.text = @"Vehicle Service \n Reminders";
        self.lbl2Text.text = @"Please allow us to send you \n notification";
        self.imgIntro.image = [UIImage imageNamed:@"vichel"];
    }
}





@end
