//
//  VehicleInfoVC.h
//  AutoAtlas
//
//  Created by webmazix on 11/23/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>


//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "Reachability.h"
#import "WebServiceConstant.h"
#import "DejalActivityView.h"
#import "Network.h"
#import <ActionSheetPicker.h>
#import "GlobalValues.h"

//other
#import "AddNewVehicle.h"
#import "EditVehicleInfoVC.h"

//model
#import "VehicleListModel.h"


//custom cell
#import "CustomCell1.h"
#import "CustomCell2.h"
#import "CustomCell3.h"





@interface VehicleInfoVC : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    NSArray *arr1;
    NSArray *arr2;
    
    GlobalValues *objGlobal;
    NSMutableArray * vehicleListArray;
}


@property (strong, nonatomic) IBOutlet UIButton *addVehicleBtn;
@property (strong, nonatomic) IBOutlet UIImageView *imgCar;
@property (strong, nonatomic) IBOutlet UITableView *tblVehcleInfo;
@property (strong, nonatomic) IBOutlet UILabel *lblCarNo;


-(void)initMethod;
-(void)setUpViews;
-(void)setBtn;


- (IBAction)btnNext:(id)sender;
- (IBAction)btnBack:(id)sender;
- (IBAction)editVehicleInfoAction:(id)sender;
- (IBAction)addVehicleBtnAction:(id)sender;

@end
