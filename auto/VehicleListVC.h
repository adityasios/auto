//
//  VehicleListVC.h
// aditya
//
//  Created by // aditya Pro1 on 20/02/18.
//  Copyright © 2018 // aditya. All rights reserved.
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
#import "GlobalValues.h"
#import "BasicUtility.h"

//model
#import "VehicleListModel.h"
#import "AddNewVehicle.h"

//custom cell
#import "VehicleInfoCell.h"

//other
#import "EditVehicleInfo.h"


@interface VehicleListVC : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSInteger selectedIndex;
    GlobalValues *objGlobal;
    NSMutableArray *vehicleListArray;
    NSDateFormatter * dateFormatter;
}




@property (strong, nonatomic) IBOutlet UIButton * btnNext;
@property (strong, nonatomic) IBOutlet UIButton * btnBack;
@property (strong, nonatomic) IBOutlet UIButton * btnEdit;
@property (strong, nonatomic) IBOutlet UIButton * btnAddVeh;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView * activity;

-(void)initMethod;
-(void)viewSetUp;
-(void)setBtn;

- (IBAction)btnNext:(id)sender;
- (IBAction)btnPrevious:(id)sender;
- (IBAction)btnAddNew:(id)sender;
- (IBAction)btnEditAction:(id)sender;
- (IBAction)btnAddVehAction:(id)sender;
    
@end
