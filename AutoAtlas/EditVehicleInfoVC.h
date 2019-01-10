//
//  EditVehicleInfoVC.h
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Macros.h"
#import "EditVehicleCell1.h"
#import "EditVehicleCell2.h"
#import "EditVehicleCell3.h"
#import <ActionSheetPicker.h>

@interface EditVehicleInfoVC : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lblVehicleInfo;
@property (strong, nonatomic) IBOutlet UILabel *lblCarno;
@property (strong, nonatomic) IBOutlet UITableView *tblviewVehicleInfo;
@property (strong, nonatomic) IBOutlet UIButton *btnSave;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;
- (IBAction)btnSaveAction:(id)sender;
- (IBAction)btnCancelAction:(id)sender;

-(void)setUpViews;
-(void)setBtn;

@end
