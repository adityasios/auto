//
//  EditVehicleInfo.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 3/16/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "AlertConst.h"
#import "Validations.h"
#import "AddNewVehicle.h"

//3rd party
#import <ActionSheetPicker.h>

//web constant
#import "WebServiceConstant.h"
#import "BasicUtility.h"
#import "DejalActivityView.h"
#import "Network.h"

//model
#import "BrandName.h"
#import "VehicleType.h"
#import "VehicleModel.h"
#import "GlobalValues.h"
#import "VehicleListModel.h"





@interface EditVehicleInfo : UITableViewController<UITextFieldDelegate>{
    GlobalValues * objGlobal;
    
    NSDateFormatter * dateFormatter;
    
    NSMutableArray * marrBrands;
    NSMutableArray * marrVehicleModel;
    NSMutableArray * marrVehicleType;
    
    
    NSInteger intSelBrandIndex;
    NSInteger intSelTypeIndex;
    NSInteger intSelModelIndex;
}




@property (nonatomic, strong)void(^passEditVehicle)(NSInteger intType);


@property (strong, nonatomic)  VehicleListModel * objVehicleModel;

@property (strong, nonatomic) IBOutlet UIBarButtonItem * barBtnUpdate;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnBack;


@property (strong, nonatomic) IBOutlet UIButton *btnRegDueDate;
@property (strong, nonatomic) IBOutlet UIButton *btnLastServiceDate;
@property (strong, nonatomic) IBOutlet UIButton *btnTyreFitmentDate;
@property (strong, nonatomic) IBOutlet UIButton *btnBatteryInstallDate;
@property (strong, nonatomic) IBOutlet UIButton *btnInsuranceDate;


@property (strong, nonatomic) IBOutlet UILabel *lblVehicleBrand;
@property (strong, nonatomic) IBOutlet UILabel *lblVehicleModel;
@property (strong, nonatomic) IBOutlet UILabel *lblVehicleType;
@property (strong, nonatomic) IBOutlet UILabel *lblRegNo;
@property (strong, nonatomic) IBOutlet UILabel *lblRegYear;
@property (strong, nonatomic) IBOutlet UILabel *lblRegDueDate;
@property (strong, nonatomic) IBOutlet UILabel *lblServiceDate;
@property (strong, nonatomic) IBOutlet UILabel *lblTyreFitDate;
@property (strong, nonatomic) IBOutlet UILabel *lblBatteryInstDate;
@property (strong, nonatomic) IBOutlet UILabel *lblInsuranceDate;
@property (strong, nonatomic) IBOutlet UILabel *lblAvgRunDate;


@property (strong, nonatomic) IBOutlet UITextField * txfdVehBrand;
@property (strong, nonatomic) IBOutlet UITextField * txfdVehModel;
@property (strong, nonatomic) IBOutlet UITextField * txfdVehType;
@property (strong, nonatomic) IBOutlet UITextField * txfdRegNo;
@property (strong, nonatomic) IBOutlet UITextField * txfdRegYear;
@property (strong, nonatomic) IBOutlet UITextField * txfdRegDueDate;
@property (strong, nonatomic) IBOutlet UITextField * txfdServiceDate;
@property (strong, nonatomic) IBOutlet UITextField * txfdTyreFitDate;
@property (strong, nonatomic) IBOutlet UITextField * txfdBatteryInstDate;
@property (strong, nonatomic) IBOutlet UITextField * txfdInsuDate;
@property (strong, nonatomic) IBOutlet UITextField * txfdAvgRunDate;


- (IBAction)btnRegDueDateAction:(id)sender;
- (IBAction)btnServiceDateAction:(id)sender;
- (IBAction)btnTyreFitDateAction:(id)sender;
- (IBAction)btnBatteryInstDateAction:(id)sender;
- (IBAction)btnInsuranceDateAction:(id)sender;
- (IBAction)barBtnCancelAction:(id)sender;
- (IBAction)barBtnUpdateAction:(id)sender;

-(void)initMethod;

-(void)setUpViews;
-(void)setLbl;
-(void)setTxtFld;
-(void)setNavBar;
-(void)setTxt;

-(void)validateEditVehicle;


-(void)webcallForVehicleBrand;
-(void)webcallForVehicleModel;
-(void)webcallForVehicleType;
-(void)webcallForEditVehicle;


-(void)parsingWebcallForVehicleBrand:(NSArray *)arrVehicle;
-(void)parsingWebcallForVehicleModel:(NSArray *)arrVehicle;

-(void)resetVehicleVariant;


-(void)showActionSheetPickerWithTitle:(NSString *)title withIndex:(NSInteger)index withData:(NSArray *)arrDataSource withType:(pickerType)pickType withOrigin:(UITextField *)txfdOrigin;
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index;


@end
