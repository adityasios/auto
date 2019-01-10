//
//  AddNewVehicle.m
// aditya
//
//  Created by // aditya on 11/24/17.
//  Copyright © 2017 // aditya. All rights reserved.

#import "AddNewVehicle.h"

@interface AddNewVehicle ()
@end
@implementation AddNewVehicle


#pragma mark -  VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self  initMethod];
    [self setUpViews];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setBtn];
}



-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    for (UIView * view in self.navigationController.view.subviews) {
        if (view.tag == 100) {
            [view  removeFromSuperview];
        }
    }
}


#pragma mark -  VC LIFE CYCLE
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
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
    [self textFieldDoneButton];
    
}




-(void)setTxtFld {
    
    self.txtFldVehclBrand.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldVehclType.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldModel.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldEnterNmbr.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFlSelectYear.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldSelectRegDaTE.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldSelectTyreInstall.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldSelectBattryInstall.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldSelectInsurancDate.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txtFldSelectLAstService.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    self.txfdAverage.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    
    self.txtFldVehclBrand.layer.borderWidth = 1.0;
    self.txtFldVehclType.layer.borderWidth = 1.0;
    self.txtFldModel.layer.borderWidth = 1.0;
    self.txtFldEnterNmbr.layer.borderWidth = 1.0;
    self.txtFlSelectYear.layer.borderWidth = 1.0;
    self.txtFldSelectRegDaTE.layer.borderWidth = 1.0;
    self.txtFldSelectTyreInstall.layer.borderWidth = 1.0;
    self.txtFldSelectBattryInstall.layer.borderWidth = 1.0;
    self.txtFldSelectInsurancDate.layer.borderWidth = 1.0;
    self.txtFldSelectLAstService.layer.borderWidth = 1.0;
    self.txfdAverage.layer.borderWidth = 1.0;
    
    self.txtFldVehclBrand.delegate = self;
    self.txtFldVehclType.delegate = self;
    self.txtFldModel.delegate = self;
    self.txtFldEnterNmbr.delegate = self;
    self.txtFlSelectYear.delegate = self;
    self.txtFldSelectRegDaTE.delegate = self;
    self.txtFldSelectTyreInstall.delegate = self;
    self.txtFldSelectBattryInstall.delegate = self;
    self.txtFldSelectInsurancDate.delegate = self;
    self.txtFldSelectLAstService.delegate = self;
    self.txfdAverage.delegate = self;
}


-(void)setLbl {
    
    self.lblBrandName.textColor = UIColorFromRGB(k adityaGreen);
    self.lblType.textColor = UIColorFromRGB(k adityaGreen);
    self.lblVariant.textColor = UIColorFromRGB(k adityaGreen);
    self.lblRegDate.textColor = UIColorFromRGB(k adityaGreen);
    self.lblYearOfReg.textColor = UIColorFromRGB(k adityaGreen);
    self.lblRegoDue.textColor = UIColorFromRGB(k adityaGreen);
    self.lblServiceDate.textColor = UIColorFromRGB(k adityaGreen);
    self.lblTyreFitment.textColor = UIColorFromRGB(k adityaGreen);
    self.lblBatteryInstall.textColor = UIColorFromRGB(k adityaGreen);
    self.lblInsuranceDate.textColor = UIColorFromRGB(k adityaGreen);
    self.lblAverage.textColor = UIColorFromRGB(k adityaGreen);
    
    self.lblBrandName.font = kQuicksand_Bold12;
    self.lblType.font = kQuicksand_Bold12;
    self.lblVariant.font = kQuicksand_Bold12;
    self.lblRegDate.font = kQuicksand_Bold12;
    self.lblYearOfReg.font = kQuicksand_Bold12;
    self.lblRegoDue.font = kQuicksand_Bold12;
    self.lblServiceDate.font = kQuicksand_Bold12;
    self.lblTyreFitment.font = kQuicksand_Bold12;
    self.lblBatteryInstall.font = kQuicksand_Bold12;
    self.lblInsuranceDate.font = kQuicksand_Bold12;
    self.lblAverage.font = kQuicksand_Bold12;
    
}


-(void)setBtn {
    
    UIButton * btnBottom = [[UIButton alloc]initWithFrame:CGRectMake(0, (self.navigationController.view.frame.origin.y)+(self.view.frame.size.height-40), self.view.frame.size.width, 40)];
    [btnBottom setTitle:@"Save" forState:UIControlStateNormal];
    [btnBottom setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    [btnBottom addTarget:self action:@selector(btnBottomClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnBottom.backgroundColor = UIColorFromRGB(k adityaGreen);
    btnBottom.titleLabel.font = kQuicksand_Bold14;
    btnBottom.tag = 100;
    
    [self.navigationController.view addSubview:btnBottom];
}



-(void)setNavBar {
    [self customNavTitle:@"Add New Vehicle"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(k adityaGreen);
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
    
    [self.barBtnCancel setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                               kQuicksand_Bold14, NSFontAttributeName,
                                               [UIColor whiteColor], NSForegroundColorAttributeName,
                                               nil]
                                     forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[self.barBtnCancel];
}




#pragma mark - DELEGATE
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField  resignFirstResponder];
    return YES;
}



-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    if (textField == self.txtFldVehclBrand) {
        
        if (marrBrands.count > 0) {
            NSArray * arrBrands = [marrBrands  valueForKey:@"brand_name"];
            [self  showActionSheetPickerWithTitle:@"Select Brand" withIndex:intSelBrandIndex withData:arrBrands withType:brandName withOrigin:self.txtFldVehclBrand];
        }else{
            [self  webcallForVehicleBrand];
        }
        
        [self.view  endEditing:YES];
        return NO;
        
    }else if (textField == self.txtFldModel){
        
        if (intSelBrandIndex == -1) {
            [self  showAlertWithTitle:kAlert Withsubtitle:kSelectBrandName withIndex:kIndexMaxValue];
            return NO;
        }
        
        [self  webcallForVehicleModel];
        [self.view  endEditing:YES];
        return NO;
        
    }else if (textField == self.txtFldVehclType){
        
        
        if (intSelBrandIndex == -1) {
            [self  showAlertWithTitle:kAlert Withsubtitle:kSelectBrandName withIndex:kIndexMaxValue];
            return NO;
        }
        
        if (intSelModelIndex == -1) {
            [self  showAlertWithTitle:kAlert Withsubtitle:kSelectModel withIndex:kIndexMaxValue];
            return NO;
        }

        [self  webcallForVehicleType];
        [self.view  endEditing:YES];
        return NO;
        
    }else if (textField == self.txtFldEnterNmbr){
        return YES;
    }else if (textField == self.txtFlSelectYear){
        [self  selectRegYear];
        
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txtFldSelectRegDaTE){
        [self  btnPickDateAction:self.btnRegDueDate];
        
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txtFldSelectLAstService){
        [self  btnPickDate2Action:self.btnLastServiceDate];
        
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txtFldSelectTyreInstall){
        [self  btnPickDate3Action:self.btnTyreFitmentDate];
        
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txtFldSelectBattryInstall){
        [self  btnPickDate4Action:self.btnBatteryInstallDate];
        
        [self.view  endEditing:YES];
        return NO;
    }else if (textField == self.txtFldSelectInsurancDate){
        [self  btnPickDate5Action:self.btnInsuranceDate];
        
        [self.view  endEditing:YES];
        return NO;
    }else if(textField == self.txfdAverage){
        return YES;
    }
    return NO;
}






-(void)validateWebcallForVehicleModel{
    
    if (self.txtFldVehclBrand.text.length == 0) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kSelectBrandName withIndex:kIndexMaxValue];
        return;
    }
    
    if (self.txtFldVehclType.text.length == 0) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kSelectType withIndex:kIndexMaxValue];
        return;
    }
    
    [self  webcallForVehicleModel];
}


#pragma mark  - BUTTON ACTIONS
- (IBAction)btnPickDateAction:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
    
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
        self.txtFldSelectRegDaTE.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txtFldSelectRegDaTE];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}









- (IBAction)btnPickDate2Action:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
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
        self.txtFldSelectLAstService.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txtFldSelectRegDaTE];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}




















- (IBAction)btnPickDate3Action:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
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
         self.txtFldSelectTyreInstall.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txtFldSelectTyreInstall];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}




- (IBAction)btnPickDate4Action:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
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
        self.txtFldSelectBattryInstall.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txtFldSelectBattryInstall];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}



- (IBAction)btnPickDate5Action:(id)sender {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    
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
        self.txtFldSelectInsurancDate.text = [dateFormatter   stringFromDate:dateSel];
    } cancelBlock:nil origin:self.txtFldSelectInsurancDate];
    
    [datepicker setMinimumDate:min];
    [datepicker setMaximumDate:max];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [datepicker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [datepicker showActionSheetPicker];
}



- (IBAction)btnBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)barBtnCancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - SELCTOR ACTION
-(void)btnBottomClicked:(id)sender {
    
  //  user_id, brand_id, model_id, type_id, vehicle_reg_number, average_running_per_day
    
    self.txtFldEnterNmbr.text = [Validations  removeWhiteSpace:self.txtFldEnterNmbr.text];
    self.txtFlSelectYear.text = [Validations  removeWhiteSpace:self.txtFlSelectYear.text];
    self.txtFldSelectRegDaTE.text = [Validations  removeWhiteSpace:self.txtFldSelectRegDaTE.text];
    self.txtFldSelectLAstService.text = [Validations  removeWhiteSpace:self.txtFldSelectLAstService.text];
    self.txtFldSelectTyreInstall.text = [Validations  removeWhiteSpace:self.txtFldSelectTyreInstall.text];
    self.txtFldSelectBattryInstall.text = [Validations  removeWhiteSpace:self.txtFldSelectBattryInstall.text];
    self.txtFldSelectInsurancDate.text = [Validations  removeWhiteSpace:self.txtFldSelectInsurancDate.text];
    
    
    //brand_name
    if (intSelBrandIndex == -1) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoBrandFound withIndex:kIndexMaxValue];
        return;
    }
    
    //model
    if (intSelModelIndex == -1) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoVehicleModelFound withIndex:kIndexMaxValue];
        return;
    }
    
    //vehicle_type
    if (intSelTypeIndex == -1) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoVehicleTypeFound withIndex:kIndexMaxValue];
        return;
    }
    
   
    
    
    //registration_number
    if(self.txtFldEnterNmbr.text.length == 0){
        self.txtFldEnterNmbr.text = @"";
        
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoRegNumber withIndex:kIndexMaxValue];
        //return;
    }
    
    
    //registration_year
    if(self.txtFlSelectYear.text.length == 0){
        self.txtFlSelectYear.text = @"";
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoRegYear withIndex:kIndexMaxValue];
        //return;
    }
    
    
    //no avg running per day
    if(self.txfdAverage.text.length == 0){
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoRunningPerDay withIndex:kIndexMaxValue];
        return;
    }
    
    //registration_due_date
    if(self.txtFldSelectRegDaTE.text.length == 0){
        self.txtFldSelectRegDaTE.text = @"";
       // [self  showAlertWithTitle:kAlert Withsubtitle:kNoRegDueDate withIndex:kIndexMaxValue];
       // return;
    }
    
    //service_date
    if(self.txtFldSelectLAstService.text.length == 0){
        self.txtFldSelectLAstService.text = @"";
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoServiceDate withIndex:kIndexMaxValue];
       // return;
    }
//
    
    //tyre_fitment_date
    if(self.txtFldSelectTyreInstall.text.length == 0){
        self.txtFldSelectTyreInstall.text = @"";
       // [self  showAlertWithTitle:kAlert Withsubtitle:kNoTyreFitmentDate withIndex:kIndexMaxValue];
       // return;
    }
    
    
    //battery_installation_date
    if(self.txtFldSelectBattryInstall.text.length == 0){
        self.txtFldSelectBattryInstall.text = @"";
        //[self  showAlertWithTitle:kAlert Withsubtitle:kNoBatteryInstallDate withIndex:kIndexMaxValue];
       // return;
    }
    
    //insurance_date
    if(self.txtFldSelectInsurancDate.text.length == 0){
        self.txtFldSelectInsurancDate.text = @"";
       // [self  showAlertWithTitle:kAlert Withsubtitle:kNoInsuranceDate withIndex:kIndexMaxValue];
        //return;
    }
    
    [self webcallForAddNewVehicle];
}






/*
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
 */







#pragma mark  - WEBCALL
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
    
    if (intSelBrandIndex == -1 || marrBrands.count == 0) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kSelectBrandName withIndex:kIndexMaxValue];
        return;
    }
    
    BrandName * objBrand = [marrBrands  objectAtIndex:intSelBrandIndex];
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehiclesGetModel];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objBrand.id forKey:kbrand_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
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




/*
VEHICLE TYPE
api/vehicles/get_vehicle_type_by_model
model_id:11
*/
-(void)webcallForVehicleType{
    
    if (intSelModelIndex == -1 || marrVehicleModel.count == 0) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kSelectModel withIndex:kIndexMaxValue];
        return;
    }
    
    VehicleModel * objVehicleModel = [marrVehicleModel  objectAtIndex:intSelModelIndex];
    
    [DejalBezelActivityView  activityViewForView:self.view withLabel:kPleaseWait];
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehiclesGetTypes];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:objVehicleModel.id forKey:kmodel_id];
    
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [DejalBezelActivityView  removeViewAnimated:YES];
        
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
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






-(void)webcallForAddNewVehicle {
    
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    
    /*
     key:8dfafb41e9b4c0b3decd875e7a231049
     
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
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostAddNewVehicle];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    
    [mdictPara  setObject:strBrandId forKey:kbrand_id];
    [mdictPara  setObject:strTypeId forKey:ktype_id];
    [mdictPara  setObject:strModelId forKey:kmodel_id];
    
    [mdictPara  setObject:self.txtFldEnterNmbr.text forKey:kvehicle_reg_number];
    [mdictPara  setObject:self.txtFlSelectYear.text forKey:kvehicle_reg_year];
    [mdictPara  setObject:self.txfdAverage.text forKey:kaverage_running_per_day];
    
    
    if (self.txtFldSelectRegDaTE.text.length == 0) {
        [mdictPara  setObject:@"" forKey:kregistration_due_date];
    }else{
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate * dateReg = [dateFormatter dateFromString:self.txtFldSelectRegDaTE.text];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString * strdate = [dateFormatter stringFromDate:dateReg];
        [mdictPara  setObject:strdate forKey:kregistration_due_date];
    }
    
    
    
    if (self.txtFldSelectLAstService.text.length == 0) {
        [mdictPara  setObject:@""  forKey:kservice_date];
    }else{
        
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate * dateSer = [dateFormatter dateFromString:self.txtFldSelectLAstService.text];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString * strdate = [dateFormatter stringFromDate:dateSer];
        [mdictPara  setObject:strdate forKey:kservice_date];
    }
    
    
    
    if (self.txtFldSelectTyreInstall.text.length == 0) {
        [mdictPara  setObject:@"" forKey:ktyre_fitment_date];
    }else{
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate * dateSer = [dateFormatter dateFromString:self.txtFldSelectTyreInstall.text];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString * strdate = [dateFormatter stringFromDate:dateSer];
        [mdictPara  setObject:strdate forKey:ktyre_fitment_date];
    }
    
    
    if (self.txtFldSelectBattryInstall.text.length == 0) {
        [mdictPara  setObject:@"" forKey:kbattery_installation_date];
    }else{
        
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate * dateSer = [dateFormatter dateFromString:self.txtFldSelectBattryInstall.text];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString * strdate = [dateFormatter stringFromDate:dateSer];
        [mdictPara  setObject:strdate forKey:kbattery_installation_date];
    }
    
    
    if (self.txtFldSelectInsurancDate.text.length == 0) {
        [mdictPara  setObject:@"" forKey:kinsurance_date];
    }else{
        [dateFormatter setDateFormat:@"dd-MM-yyyy"];
        NSDate * dateSer = [dateFormatter dateFromString:self.txtFldSelectInsurancDate.text];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString * strdate = [dateFormatter stringFromDate:dateSer];
        [mdictPara  setObject:strdate forKey:kinsurance_date];
    }
    
    
    [DejalBezelActivityView  activityViewForView:self.view withLabel:@"Please Wait"];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.tableView];
        [DejalBezelActivityView  removeViewAnimated:YES];
        if (!error) {
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            if (strStatus.integerValue == 1) {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:1];
            } else {
                if ([strMsg isEqualToString:kValidateSubLimit]) {
                    [self  showAlertWithTitle:@"Upgrade Now" Withsubtitle:@"Your subscription limit has been reached" withIndex:kIndex10];
                }else{
                    [self  showAlertWithTitle:kError Withsubtitle:strMsg withIndex:kIndexMaxValue];
                }
            }
        }else{
            [self  showAlertWithTitle:kError Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
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
        [self  showActionSheetPickerWithTitle:@"Select Brand" withIndex:0 withData:arrBrands withType:brandName withOrigin:self.txtFldVehclBrand];
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
        [self  showActionSheetPickerWithTitle:@"Select Vehicle Type" withIndex:0 withData:arrVehicle withType:vehicleType withOrigin:self.txtFldVehclType];
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
        [self  showActionSheetPickerWithTitle:@"Select Vehicle Model" withIndex:0 withData:arrVehicleModel withType:vehicleVariant withOrigin:self.txtFldModel];
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
            self.txtFldVehclBrand.text = objBarnd.brand_name;
            strBrandId = objBarnd.id;
            
        }else if (pickType == vehicleVariant){
            
            [self  resetVehicleVariant];
            
            intSelModelIndex = selectedIndex;
            VehicleModel * objVehicle = [marrVehicleModel  objectAtIndex:intSelModelIndex];
            self.txtFldModel.text = objVehicle.name;
            strModelId = objVehicle.id;
            
        }else if (pickType == vehicleType){
            
            intSelTypeIndex = selectedIndex;
            VehicleType * objVehicle = [marrVehicleType  objectAtIndex:intSelTypeIndex];
            self.txtFldVehclType.text = objVehicle.vehicle_type;
            strTypeId = objVehicle.id;
        }
        
        
    }cancelBlock:^(ActionSheetStringPicker *picker) {
        NSLog(@"Block Picker Canceled");
    }origin:txfdOrigin];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [picker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [picker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [picker showActionSheetPicker];
}




















#pragma mark - HELPER METHODS
-(void)resetVehicleVariant{
    
    //vehicle model
    intSelModelIndex = -1;
    self.txtFldModel.text = nil;
    
    //vehicle type
    intSelTypeIndex = -1;
    self.txtFldVehclType.text = nil;
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
        NSString * strYear = [marrRegYear objectAtIndex:selectedIndex];
        self.txtFlSelectYear.text = strYear;
    }cancelBlock:^(ActionSheetStringPicker *picker) {
        NSLog(@"Block Picker Canceled");
    }origin:self.txtFlSelectYear];
    
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [picker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    [picker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [picker showActionSheetPicker];
}










#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }else if(index == 1){
            [self.navigationController  popViewControllerAnimated:YES];
        }else if(index == kIndex10){
            UIStoryboard * story = [UIStoryboard storyboardWithName:@"Services" bundle:nil];
            SubsricptionsVC *subVC = [story instantiateViewControllerWithIdentifier:@"SubsricptionsVC"];
            [self.navigationController  pushViewController:subVC animated:YES];
        }else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}



-(void)textFieldDoneButton{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem * doneBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(txfdAverageDoneButtonPressed)];
    doneBarButton.tintColor = UIColorFromRGB(k adityaGreen);
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    self.txfdAverage.inputAccessoryView = keyboardToolbar;
}

-(void)txfdAverageDoneButtonPressed{
    [self.txfdAverage resignFirstResponder];
}

@end

