//
//  EditVehicleInfo.m
//  AutoAtlas
//
//  Created by Aditya Kumar on 3/16/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "EditVehicleInfo.h"

@interface EditVehicleInfo ()

@end

@implementation EditVehicleInfo

#pragma mark -  VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self setUpViews];
}


#pragma mark -  INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
    dateFormatter = [NSDateFormatter  new];
    intSelBrandIndex = -1;
    intSelTypeIndex = -1;
    intSelModelIndex = -1;
}


#pragma mark - VIEW SET UP
-(void)setUpViews {
    
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    self.tableView.backgroundColor = UIColorFromRGB(kBackground);
    
    [self setLbl];
    [self setTxtFld];
    [self setNavBar];
    [self  setTxt];
    [self textFieldDoneButton];
    
}


-(void)setLbl {
    
    self.lblVehicleBrand.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblVehicleModel.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblVehicleType.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblRegNo.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblRegYear.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblRegDueDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblServiceDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblTyreFitDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblInsuranceDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblBatteryInstDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblAvgRunDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    
    self.lblVehicleBrand.font = kQuicksand_Bold12;
    self.lblVehicleModel.font = kQuicksand_Bold12;
    self.lblVehicleType.font = kQuicksand_Bold12;
    self.lblRegNo.font = kQuicksand_Bold12;
    self.lblRegYear.font = kQuicksand_Bold12;
    self.lblRegDueDate.font = kQuicksand_Bold12;
    self.lblServiceDate.font = kQuicksand_Bold12;
    self.lblTyreFitDate.font = kQuicksand_Bold12;
    self.lblInsuranceDate.font = kQuicksand_Bold12;
    self.lblInsuranceDate.font = kQuicksand_Bold12;
    self.lblBatteryInstDate.font = kQuicksand_Bold12;
    self.lblAvgRunDate.font = kQuicksand_Bold12;
}



-(void)setNavBar {
    [self customNavTitle:@"Edit Vehicle"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(kAutoAtlasGreen);
}


-(void)customNavTitle:(NSString *)str{
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            kQuicksand_Bold14, NSFontAttributeName,
                                            [UIColor whiteColor], NSForegroundColorAttributeName,
                                            nil]
                                  forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.btnBack,titleBarButton];
    
    [self.barBtnUpdate setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kQuicksand_Bold15, NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[self.barBtnUpdate];
}




-(void)setTxtFld {
    
    self.txfdVehBrand.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdVehModel.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdVehType.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdRegNo.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdRegYear.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdRegDueDate.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdServiceDate.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdTyreFitDate.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdBatteryInstDate.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdInsuDate.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdAvgRunDate.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    
    self.txfdVehBrand.layer.borderWidth = 0.5;
    self.txfdVehModel.layer.borderWidth = 0.5;
    self.txfdVehType.layer.borderWidth = 0.5;
    self.txfdRegNo.layer.borderWidth = 0.5;
    self.txfdRegYear.layer.borderWidth = 0.5;
    self.txfdRegDueDate.layer.borderWidth = 0.5;
    self.txfdServiceDate.layer.borderWidth = 0.5;
    self.txfdTyreFitDate.layer.borderWidth = 0.5;
    self.txfdBatteryInstDate.layer.borderWidth = 0.5;
    self.txfdInsuDate.layer.borderWidth = 0.5;
    self.txfdAvgRunDate.layer.borderWidth = 0.5;
    
    self.txfdVehBrand.layer.cornerRadius = 2.0;
    self.txfdVehModel.layer.cornerRadius = 2.0;
    self.txfdVehType.layer.cornerRadius = 2.0;
    self.txfdRegNo.layer.cornerRadius = 2.0;
    self.txfdRegYear.layer.cornerRadius = 2.0;
    self.txfdRegDueDate.layer.cornerRadius = 2.0;
    self.txfdServiceDate.layer.cornerRadius = 2.0;
    self.txfdTyreFitDate.layer.cornerRadius = 2.0;
    self.txfdBatteryInstDate.layer.cornerRadius = 2.0;
    self.txfdInsuDate.layer.cornerRadius = 2.0;
    self.txfdAvgRunDate.layer.cornerRadius = 2.0;
    
    
    self.txfdVehBrand.clipsToBounds = YES;
    self.txfdVehModel.clipsToBounds = YES;
    self.txfdVehType.clipsToBounds = YES;
    self.txfdRegNo.clipsToBounds = YES;
    self.txfdRegYear.clipsToBounds = YES;
    self.txfdRegDueDate.clipsToBounds = YES;
    self.txfdServiceDate.clipsToBounds = YES;
    self.txfdTyreFitDate.clipsToBounds = YES;
    self.txfdBatteryInstDate.clipsToBounds = YES;
    self.txfdInsuDate.clipsToBounds = YES;
    self.txfdAvgRunDate.clipsToBounds = YES;
    
    
    self.txfdVehBrand.delegate = self;
    self.txfdVehModel.delegate = self;
    self.txfdVehType.delegate = self;
    self.txfdRegNo.delegate = self;
    self.txfdRegYear.delegate = self;
    self.txfdRegDueDate.delegate = self;
    self.txfdServiceDate.delegate = self;
    self.txfdTyreFitDate.delegate = self;
    self.txfdBatteryInstDate.delegate = self;
    self.txfdInsuDate.delegate = self;
    self.txfdAvgRunDate.delegate = self;
}


-(void)setTxt{
    
//    intSelBrandIndex = self.objVehicleModel.brand_id.integerValue;
//    intSelModelIndex = self.objVehicleModel.model_id.integerValue;
//    intSelTypeIndex = self.objVehicleModel.vehicle_id.integerValue;
    
    self.txfdVehBrand.text = self.objVehicleModel.brand_name.capitalizedString;
    self.txfdVehModel.text = self.objVehicleModel.model_name.capitalizedString;
    self.txfdVehType.text = self.objVehicleModel.vehicle_type.capitalizedString;
    
    self.txfdRegNo.text = self.objVehicleModel.vehicle_reg_number.uppercaseString;
    
    //reg year
    self.txfdRegYear.text = self.objVehicleModel.vehicle_reg_year;
    
    //reg due date
    self.txfdRegDueDate.text = self.objVehicleModel.registration_due_date;
    
    //service date
    self.txfdServiceDate.text = self.objVehicleModel.service_date;
    
    //tyre fitment date
    self.txfdTyreFitDate.text = self.objVehicleModel.tyre_fitment_date;
    
    //battery installement date
    self.txfdBatteryInstDate.text = self.objVehicleModel.battery_installation_date;
    
    //insurance date
    self.txfdInsuDate.text = self.objVehicleModel.insurance_date;
    
    //avg run date
    self.txfdAvgRunDate.text = self.objVehicleModel.average_running_per_day;
    
}




#pragma mark - DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField == self.txfdVehBrand) {
        
        if (marrBrands.count > 0) {
            NSArray * arrBrands = [marrBrands  valueForKey:@"brand_name"];
            [self  showActionSheetPickerWithTitle:@"Select Brand" withIndex:intSelBrandIndex withData:arrBrands withType:brandName withOrigin:self.txfdVehBrand];
        }else{
            [self  webcallForVehicleBrand];
        }
        [self.view  endEditing:YES];
        return NO;
        
    }else if (textField == self.txfdVehModel){
        
        [self  webcallForVehicleModel];
        [self.view  endEditing:YES];
        return NO;
        
    }else if (textField == self.txfdVehType){
        
        [self  webcallForVehicleType];
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txfdRegYear){
        [self  selectRegYear];
        [self.view  endEditing:YES];
         return NO;
    }else if (textField == self.txfdRegDueDate){
        [self  btnRegDueDateAction:self.btnRegDueDate];
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txfdServiceDate){
        [self  btnServiceDateAction:self.btnLastServiceDate];
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txfdTyreFitDate){
        [self  btnTyreFitDateAction:self.btnTyreFitmentDate];
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txfdBatteryInstDate){
        [self  btnBatteryInstDateAction:self.btnBatteryInstallDate];
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txfdInsuDate){
        [self  btnInsuranceDateAction:self.btnInsuranceDate];
        [self.view  endEditing:YES];
        return NO;
    }
    
    return YES;
}




#pragma mark -  BUTTON ACTION
- (IBAction)btnRegDueDateAction:(id)sender{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    
    //reg due date
    NSDate * today = [NSDate new];
    NSCalendar * gregorian = [NSCalendar currentCalendar];
    
    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:+20];
    NSDate * max = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    [offsetComponents setYear:-20];
    NSDate * min = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    
    
    ActionSheetDatePicker * datepicker = [[ActionSheetDatePicker alloc]  initWithTitle:@"Registration Due Date"  datePickerMode:UIDatePickerModeDate selectedDate:today doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
        NSDate * dateSel = (NSDate *)selectedDate;
        self.txfdRegDueDate.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txfdRegDueDate];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}


























- (IBAction)btnServiceDateAction:(id)sender{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    //service date
    NSDate * today = [NSDate new];
    NSCalendar * gregorian = [NSCalendar currentCalendar];
    
    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:+0];
    NSDate * max = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    [offsetComponents setYear:-20];
    NSDate * min = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
   
    ActionSheetDatePicker * datepicker = [[ActionSheetDatePicker alloc]  initWithTitle:@"Service Date"  datePickerMode:UIDatePickerModeDate selectedDate:today doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
        NSDate * dateSel = (NSDate *)selectedDate;
        self.txfdServiceDate.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txfdServiceDate];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}





- (IBAction)btnTyreFitDateAction:(id)sender{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    //Tyre Fitment date
    NSDate * today = [NSDate new];
    NSCalendar * gregorian = [NSCalendar currentCalendar];
    
    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:+0];
    NSDate * max = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    [offsetComponents setYear:-30];
    NSDate * min = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    
    ActionSheetDatePicker * datepicker = [[ActionSheetDatePicker alloc]  initWithTitle:@"Tyre Fitment Date"  datePickerMode:UIDatePickerModeDate selectedDate:today doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
        NSDate * dateSel = (NSDate *)selectedDate;
        self.txfdTyreFitDate.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txfdTyreFitDate];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}






- (IBAction)btnBatteryInstDateAction:(id)sender{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    //Battery Installation date
    NSDate * today = [NSDate new];
    NSCalendar * gregorian = [NSCalendar currentCalendar];
    
    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:+0];
    NSDate * max = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    [offsetComponents setYear:-30];
    NSDate * min = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
  
    ActionSheetDatePicker * datepicker = [[ActionSheetDatePicker alloc]  initWithTitle:@"Battery Installation Date"  datePickerMode:UIDatePickerModeDate selectedDate:today doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
        NSDate * dateSel = (NSDate *)selectedDate;
        self.txfdBatteryInstDate.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txfdBatteryInstDate];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}



- (IBAction)btnInsuranceDateAction:(id)sender{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    //Insurance date
    NSDate * today = [NSDate new];
    NSCalendar * gregorian = [NSCalendar currentCalendar];
    
    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:+20];
    NSDate * max = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    [offsetComponents setYear:-20];
    NSDate * min = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    
    ActionSheetDatePicker * datepicker = [[ActionSheetDatePicker alloc]  initWithTitle:@"Insurance Date"  datePickerMode:UIDatePickerModeDate selectedDate:today doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
        NSDate * dateSel = (NSDate *)selectedDate;
        self.txfdInsuDate.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txfdInsuDate];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}



- (IBAction)barBtnCancelAction:(id)sender{
    [self.navigationController  popViewControllerAnimated:YES];
}

- (IBAction)barBtnUpdateAction:(id)sender{
    [self  validateEditVehicle];
}

-(void)txfdAverageDoneButtonPressed{
    [self.txfdAvgRunDate resignFirstResponder];
}







/*
 EDIT VEHICLE INFO
 http://websitedevelopment101.com/autoatlas/api/vehicles/edit_vehicle_info
 POST
 yes
 
 key:8dfafb41e9b4c0b3decd875e7a231049
 user_id:1
 vehicle_id:6
 
 brand_name:yyyy
 type:1
 variant:2
 
 registrationnumber:4
 yearofregistration:4
 
 registrationdue:2
 servicedate:4
 tyrefitmentdate:3
 batteryinstallationdate:4
 insurancedate:4
 
 average_running_per_day
 */




/*
 user_id:1
 
 brand_id:2
 model_id:1
 type_id:1
 
 vehicle_reg_number:3237993304
 vehicle_reg_year:2017
 registration_due_date:2018-12-31
 
 
 service_date:2018-12-30
 tyre_fitment_date:2018-12-29
 battery_installation_date:2018-12-28
 insurance_date:2018-12-27
 average_running_per_day
 */



#pragma mark -  VALIDATE WEBCALL
-(void)validateEditVehicle{
    self.txfdRegNo.text = [Validations  removeWhiteSpace:self.txfdRegNo.text];
    self.txfdRegYear.text = [Validations  removeWhiteSpace:self.txfdRegYear.text];
    self.txfdRegDueDate.text = [Validations  removeWhiteSpace:self.txfdRegDueDate.text];
    
    self.txfdServiceDate.text = [Validations  removeWhiteSpace:self.txfdServiceDate.text];
    self.txfdTyreFitDate.text = [Validations  removeWhiteSpace:self.txfdTyreFitDate.text];
    self.txfdBatteryInstDate.text = [Validations  removeWhiteSpace:self.txfdBatteryInstDate.text];
    self.txfdInsuDate.text = [Validations  removeWhiteSpace:self.txfdInsuDate.text];
    
//    if (intSelBrandIndex == -1) {
//        [self  showAlertWithTitle:kAlert Withsubtitle:kNoBrandFound withIndex:kIndexMaxValue];
//        return;
//    }
//    
//    //model
    if (self.txfdVehModel.text.length == 0) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoVehicleModelFound withIndex:kIndexMaxValue];
        return;
    }
    
    //vehicle_type
    if (self.txfdVehType.text.length == 0) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoVehicleTypeFound withIndex:kIndexMaxValue];
        return;
    }
    
    //registration_number
    if(self.txfdRegNo.text.length == 0){
        self.txfdRegNo.text = @"";
       // [self  showAlertWithTitle:kAlert Withsubtitle:kNoRegNumber withIndex:kIndexMaxValue];
        //return;
    }
    
    
    //no avg running per day
    if(self.txfdAvgRunDate.text.length == 0){
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoRunningPerDay withIndex:kIndexMaxValue];
        return;
    }
    
    //registration_number
    if(self.txfdRegYear.text.length == 0){
        self.txfdRegYear.text = @"";
       // [self  showAlertWithTitle:kAlert Withsubtitle:kNoRegYear withIndex:kIndexMaxValue];
        //return;
    }
    
    //registration_due_date
    if(self.txfdRegDueDate.text.length == 0){
        self.txfdRegDueDate.text = @"";
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoRegDueDate withIndex:kIndexMaxValue];
        //return;
    }
    
    //service date
    if(self.txfdServiceDate.text.length == 0){
        self.txfdServiceDate.text = @"";
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoServiceDate withIndex:kIndexMaxValue];
        //return;
    }
    
    //tyre_fitment_date
    if(self.txfdTyreFitDate.text.length == 0){
        self.txfdTyreFitDate.text = @"";
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoTyreFitmentDate withIndex:kIndexMaxValue];
        //return;
    }
    
    //battery_installation_date
    if(self.txfdBatteryInstDate.text.length == 0){
        self.txfdBatteryInstDate.text = @"";
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoBatteryInstallDate withIndex:kIndexMaxValue];
        //return;
    }
    
    //insurance_date
    if(self.txfdInsuDate.text.length == 0){
        self.txfdInsuDate.text = @"";
       // [self  showAlertWithTitle:kAlert Withsubtitle:kNoInsuranceDate withIndex:kIndexMaxValue];
        //return;
    }
    
    [self  webcallForEditVehicle];
}




















#pragma mark -  WEBCALL

-(void)webcallForVehicleBrand{
    
    [DejalBezelActivityView  activityViewForView:self.view withLabel:kPleaseWait];
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehiclesGetBrand];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [DejalBezelActivityView  removeViewAnimated:YES];
        
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                NSLog(@"result = %@",result);
                NSArray * arrVendor = [result objectForKey:kdata];
                [self  parsingWebcallForVehicleBrand:arrVendor];
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}




-(void)webcallForVehicleModel{
    
    [DejalBezelActivityView  activityViewForView:self.view withLabel:kPleaseWait];
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehiclesGetModel];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    if (intSelBrandIndex == -1 || marrBrands.count == 0) {
        [mdictPara  setObject:self.objVehicleModel.brand_id forKey:kbrand_id];
    }else{
        BrandName * objBrand = [marrBrands  objectAtIndex:intSelBrandIndex];
        [mdictPara  setObject:objBrand.id forKey:kbrand_id];
    }
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [DejalBezelActivityView  removeViewAnimated:YES];
        
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            if (strStatus.integerValue == 1) {
                NSArray * arrVendor = [result objectForKey:kdata];
                [self  parsingWebcallForVehicleModel:arrVendor];
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:kNoVehicleModel withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}




-(void)webcallForVehicleType{
    
    
    [DejalBezelActivityView  activityViewForView:self.view withLabel:kPleaseWait];
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehiclesGetTypes];
   
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    if (intSelModelIndex == -1 || marrVehicleModel.count == 0) {
        [mdictPara  setObject:self.objVehicleModel.model_id forKey:kmodel_id];
    }else{
        VehicleModel * objVehicleModel = [marrVehicleModel  objectAtIndex:intSelModelIndex];
        [mdictPara  setObject:objVehicleModel.id forKey:kmodel_id];
    }
    
    
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [DejalBezelActivityView  removeViewAnimated:YES];
        
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            
            
            if (strStatus.integerValue == 1) {
                NSLog(@"result = %@",result);
                NSArray * arrVendor = [result objectForKey:kdata];
                [self  parsingWebcallForVehicleType:arrVendor];
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:kNoVehicleTypeFound withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}







/*
EDIT VEHICLE INFO
http://websitedevelopment101.com/autoatlas/api/vehicles/edit_vehicle_info
POST
yes

key:8dfafb41e9b4c0b3decd875e7a231049
user_id:139
brand_id:1
model_id:2
type_id:2
vehicle_reg_number:54654222sdrftygu
vehicle_reg_year:2017
registration_due_date:2018-02-16
 
service_date:2018-02-16
tyre_fitment_date:2018-02-16
battery_installation_date:2018-02-16
insurance_date:2018-02-16
average_running_per_day:16
vehicle_id:46
*/







-(void)webcallForEditVehicle{
    
   // [BasicUtility  showLoaderInView:self.view];
    NSString *strPost = [KBaseURL stringByAppendingString:kPostEditVehicle];
    
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:self.objVehicleModel.vehicle_id forKey:kvehicle_id];
    NSLog(@"self.objVehicleModel = %@",self.objVehicleModel.description);
    
    
  
    
    
    //brand
    if (intSelBrandIndex == -1) {
        NSLog(@"brand id = %@",self.objVehicleModel.brand_id);
        [mdictPara  setObject:self.objVehicleModel.brand_id forKey:kbrand_id];
    }else{
        BrandName * objBrand = [marrBrands  objectAtIndex:intSelBrandIndex];
        [mdictPara  setObject:objBrand.id forKey:kbrand_id];
    }
    
    
    
    //model
    if (intSelModelIndex == -1) {
        [mdictPara  setObject:self.objVehicleModel.model_id forKey:kmodel_id];
    }else{
        VehicleModel * objModel = [marrVehicleModel  objectAtIndex:intSelModelIndex];
        [mdictPara  setObject:objModel.id forKey:kmodel_id];
    }
    
    
    //vehicle type
    if (intSelTypeIndex == -1) {
        [mdictPara  setObject:self.objVehicleModel.type_id forKey:ktype_id];
    }else{
        VehicleType * objVehicle = [marrVehicleType  objectAtIndex:intSelTypeIndex];
        [mdictPara  setObject:objVehicle.id forKey:ktype_id];
    }
    
    //registration_number
   
    [mdictPara  setObject:self.txfdRegNo.text forKey:kvehicle_reg_number];
    
    
    //reg no
   
    
    //reg yr
    [mdictPara  setObject:self.txfdRegYear.text forKey:kvehicle_reg_year];
    
    //reg due date
    [mdictPara  setObject:self.txfdRegDueDate.text forKey:kregistration_due_date];
    
    
    [mdictPara  setObject:self.txfdServiceDate.text forKey:kservice_date];
    [mdictPara  setObject:self.txfdTyreFitDate.text forKey:ktyre_fitment_date];
    [mdictPara  setObject:self.txfdBatteryInstDate.text forKey:kbattery_installation_date];
    [mdictPara  setObject:self.txfdInsuDate.text forKey:kinsurance_date];
    
    [mdictPara  setObject:self.txfdAvgRunDate.text forKey:kaverage_running_per_day];
    
    
    
    [DejalBezelActivityView  activityViewForView:self.view withLabel:@"Please Wait"];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.tableView];
        [DejalBezelActivityView  removeViewAnimated:YES];
        if (!error) {
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            if (strStatus.integerValue == 1) {
                self.passEditVehicle(1);
                [self.navigationController  popViewControllerAnimated:YES];
                } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        }else{
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}






#pragma mark  - WEBCALL PARSING
-(void)parsingWebcallForVehicleBrand:(NSArray *)arrVehicle{
    
    NSMutableArray * marrBrandsTemp =[NSMutableArray  new];
    
    for (NSDictionary *dict in arrVehicle) {
        NSError *err;
        BrandName * objBrand = [[BrandName alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrBrandsTemp addObject:objBrand];
        }
    }
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"brand_name" ascending:YES];
    NSArray * arrSorted = [marrBrandsTemp sortedArrayUsingDescriptors:@[sortDescriptor]];
    marrBrands = [NSMutableArray  arrayWithArray:arrSorted];
    NSLog(@"marrBrands = %ld",marrBrands.count);
    
    if (marrBrands.count > 0) {
        NSArray * arrBrands = [marrBrands  valueForKey:@"brand_name"];
        [self  showActionSheetPickerWithTitle:@"Select Brand" withIndex:0 withData:arrBrands withType:brandName withOrigin:self.txfdVehBrand];
    }
}



-(void)parsingWebcallForVehicleModel:(NSArray *)arrVehicle{
    
    NSMutableArray * marrModelTemp = [NSMutableArray  new];
    
    for (NSDictionary *dict in arrVehicle) {
        NSError *err;
        VehicleModel * objVehicle = [[VehicleModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrModelTemp addObject:objVehicle];
        }
    }
    
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray * arrSorted = [marrModelTemp sortedArrayUsingDescriptors:@[sortDescriptor]];
    marrVehicleModel = [NSMutableArray  arrayWithArray:arrSorted];
    
    if (marrVehicleModel.count > 0) {
        NSArray * arrVehicleModel = [marrVehicleModel  valueForKey:@"name"];
        [self  showActionSheetPickerWithTitle:@"Select Vehicle Model" withIndex:0 withData:arrVehicleModel withType:vehicleVariant withOrigin:self.txfdVehModel];
    }
}



-(void)parsingWebcallForVehicleType:(NSArray *)arrVehicle{
    
    NSMutableArray * marrVehicleTypeTemp = [NSMutableArray  new];
    
    for (NSDictionary *dict in arrVehicle) {
        NSError *err;
        VehicleType * objVehicle = [[VehicleType alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrVehicleTypeTemp addObject:objVehicle];
        }
    }
    
    
    NSSortDescriptor * sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"vehicle_type" ascending:YES];
    NSArray * arrSorted = [marrVehicleTypeTemp sortedArrayUsingDescriptors:@[sortDescriptor]];
    marrVehicleType = [NSMutableArray  arrayWithArray:arrSorted];
    
    
    if (marrVehicleType.count > 0) {
        NSArray * arrVehicle = [marrVehicleType  valueForKey:@"vehicle_type"];
        [self  showActionSheetPickerWithTitle:@"Select Vehicle Type" withIndex:0 withData:arrVehicle withType:vehicleType withOrigin:self.txfdVehType];
    }
}


#pragma mark - SHOW ACTION SHEET PICKER
-(void)showActionSheetPickerWithTitle:(NSString *)title withIndex:(NSInteger)index withData:(NSArray *)arrDataSource withType:(pickerType)pickType withOrigin:(UITextField *)txfdOrigin{
    
   ActionSheetStringPicker * picker = [[ActionSheetStringPicker alloc] initWithTitle:title rows:arrDataSource initialSelection:index doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        
        NSLog(@"selectedIndex = %ld",selectedIndex);
        if (pickType == brandName) {
            
            [self  resetVehicleVariant];
            intSelBrandIndex = selectedIndex;
            BrandName * objBarnd = [marrBrands  objectAtIndex:intSelBrandIndex];
            self.txfdVehBrand.text = objBarnd.brand_name;
            
        }else if (pickType == vehicleVariant){
            
            [self  resetVehicleVariant];
            
            intSelModelIndex = selectedIndex;
            VehicleModel * objVehicle = [marrVehicleModel  objectAtIndex:intSelModelIndex];
            self.txfdVehModel.text = objVehicle.name;
            
            
        }else if (pickType == vehicleType){
            
            intSelTypeIndex = selectedIndex;
            VehicleType * objVehicle = [marrVehicleType  objectAtIndex:intSelTypeIndex];
            self.txfdVehType.text = objVehicle.vehicle_type;
        }
        
    }cancelBlock:^(ActionSheetStringPicker *picker) {
        NSLog(@"Block Picker Canceled");
    }origin:txfdOrigin];
    
    
    
    
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [picker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [picker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [picker showActionSheetPicker];
}




#pragma mark - HELPER METHODS
-(void)resetVehicleVariant{
    
    //vehicle model
    intSelModelIndex = -1;
    self.txfdVehModel.text = nil;
    
    //vehicle type
    intSelTypeIndex = -1;
    self.txfdVehType.text = nil;
}



-(void)selectRegYear{
    
    
    NSMutableArray * marrRegYear = [NSMutableArray  new];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString * str_CrtYear = [formatter stringFromDate:[NSDate date]];
    
    for (NSInteger i = str_CrtYear.integerValue; i > (str_CrtYear.integerValue - 100); i --) {
        NSString * strYear = [NSString  stringWithFormat:@"%ld",i];
        [marrRegYear  addObject:strYear];
    }
    
    
    
    ActionSheetStringPicker * picker = [[ActionSheetStringPicker alloc] initWithTitle:@"Year Of Manufacture" rows:marrRegYear initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        NSLog(@"selectedValue = %@",(NSString *)selectedValue);
        NSString * strYear = [marrRegYear objectAtIndex:selectedIndex];
        self.txfdRegYear.text = strYear;
    }cancelBlock:^(ActionSheetStringPicker *picker) {
        NSLog(@"Block Picker Canceled");
    }origin:self.txfdRegYear];
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [picker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [picker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [picker showActionSheetPicker];
}
















-(void)textFieldDoneButton{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(txfdAverageDoneButtonPressed)];
    doneBarButton.tintColor = UIColorFromRGB(kAutoAtlasGreen);
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    self.txfdAvgRunDate.inputAccessoryView = keyboardToolbar;
}



#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}



@end

