//
//  AddNewVehicle.h
//  AutoAtlas
//
//  Created by webmazix on 11/24/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "AlertConst.h"
#import "Validations.h"

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

//other
#import "SubsricptionsVC.h"



typedef enum
{
    brandName = 1,
    vehicleType,
    vehicleVariant,
    
} pickerType;




@interface AddNewVehicle : UITableViewController <UITextFieldDelegate>{
    GlobalValues *objGlobal;
    NSMutableArray * marrBrands;
    NSMutableArray * marrVehicleType;
    NSMutableArray * marrVehicleModel;
   
    NSInteger intSelBrandIndex;
    NSInteger intSelTypeIndex;
    NSInteger intSelModelIndex;
    
    NSString *strBrandId;
    NSString *strModelId;
    NSString *strTypeId;
}









@property (strong, nonatomic) IBOutlet UIBarButtonItem * barBtnCancel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *btnBack;


@property (strong, nonatomic) IBOutlet UIButton *btnRegDueDate;
@property (strong, nonatomic) IBOutlet UIButton *btnLastServiceDate;
@property (strong, nonatomic) IBOutlet UIButton *btnTyreFitmentDate;
@property (strong, nonatomic) IBOutlet UIButton *btnBatteryInstallDate;
@property (strong, nonatomic) IBOutlet UIButton *btnInsuranceDate;



@property (strong, nonatomic) IBOutlet UILabel *lblBrandName;
@property (strong, nonatomic) IBOutlet UILabel *lblType;
@property (strong, nonatomic) IBOutlet UILabel *lblVariant;
@property (strong, nonatomic) IBOutlet UILabel *lblRegDate;
@property (strong, nonatomic) IBOutlet UILabel *lblYearOfReg;
@property (strong, nonatomic) IBOutlet UILabel *lblRegoDue;
@property (strong, nonatomic) IBOutlet UILabel *lblServiceDate;
@property (strong, nonatomic) IBOutlet UILabel *lblTyreFitment;
@property (strong, nonatomic) IBOutlet UILabel *lblBatteryInstall;
@property (strong, nonatomic) IBOutlet UILabel *lblInsuranceDate;

@property (strong, nonatomic) IBOutlet UITextField * txtFldVehclBrand;
@property (strong, nonatomic) IBOutlet UITextField * txtFldVehclType;
@property (strong, nonatomic) IBOutlet UITextField * txtFldModel;

@property (strong, nonatomic) IBOutlet UITextField * txtFldEnterNmbr;
@property (strong, nonatomic) IBOutlet UITextField * txtFlSelectYear;
@property (strong, nonatomic) IBOutlet UITextField * txtFldSelectRegDaTE;
@property (strong, nonatomic) IBOutlet UITextField * txtFldSelectLAstService;
@property (strong, nonatomic) IBOutlet UITextField * txtFldSelectTyreInstall;
@property (strong, nonatomic) IBOutlet UITextField * txtFldSelectBattryInstall;
@property (strong, nonatomic) IBOutlet UITextField * txtFldSelectInsurancDate;

@property (weak, nonatomic) IBOutlet UITextField *txfdAverage;

@property (weak, nonatomic) IBOutlet UILabel *lblAverage;

- (IBAction)btnPickDateAction:(id)sender;
- (IBAction)btnPickDate2Action:(id)sender;
- (IBAction)btnPickDate3Action:(id)sender;
- (IBAction)btnPickDate4Action:(id)sender;
- (IBAction)btnPickDate5Action:(id)sender;
- (IBAction)barBtnCancelAction:(id)sender;

-(void)initMethod;

-(void)setUpViews;
-(void)setLbl;
-(void)setTxtFld;
-(void)setNavBar;
-(void)setBtn;
-(void)selectRegYear;


-(void)validateWebcallForVehicleModel;


-(void)webcallForVehicleBrand;
-(void)webcallForVehicleType;
-(void)webcallForVehicleModel;

-(void)parsingWebcallForVehicleBrand:(NSArray *)arrVehicle;
-(void)parsingWebcallForVehicleType:(NSArray *)arrVehicle;
-(void)parsingWebcallForVehicleModel:(NSArray *)arrVehicle;





-(void)resetVehicleVariant;
-(void)showActionSheetPickerWithTitle:(NSString *)title withIndex:(NSInteger)index withData:(NSArray *)arrDataSource withType:(pickerType)pickType withOrigin:(UITextField *)txfdOrigin;

-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index ;




@end
