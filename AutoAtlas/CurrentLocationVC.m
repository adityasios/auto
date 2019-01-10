//
//  CurrentLocationVC.m
//  AutoAtlas
//
//  Created by webmazix on 11/24/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "CurrentLocationVC.h"

@interface CurrentLocationVC ()

@end

@implementation CurrentLocationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark
#pragma mark  VIEW SET UP
#pragma mark
-(void)setUpViews {
    
    [self setBtn];
    [self setViews];
}

-(void)setViews {
    
//    self.viewUpper.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
//    self.viewUpper.layer.borderWidth = 1.0;
}

-(void)setBtn {
    
    [self.btnExploreServices setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    self.btnExploreServices.titleLabel.font = kQuicksand_Bold12;
    self.btnExploreServices.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
}


#pragma mark
#pragma mark  VIEW SET UP
#pragma mark
- (IBAction)btnSearchAction:(id)sender {
}
- (IBAction)btnCrossAction:(id)sender {
}
- (IBAction)btnExploreServices:(id)sender {
    
//    SubsricptionsVC *subsrcVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SubsricptionsVC"];
//    [self presentViewController:subsrcVC animated:YES completion:nil];
}
@end
