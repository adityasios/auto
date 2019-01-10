//
//  VehicleListVC.m
//  AutoAtlas
//
//  Created by WebMazix Pro1 on 20/02/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "VehicleListVC.h"

@interface VehicleListVC ()

@end

@implementation VehicleListVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self  viewSetUp];
    [self webCallForGetVehiCle];
}


#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
    dateFormatter = [NSDateFormatter  new];
    selectedIndex = 0;
}


#pragma mark - VIEW SET UP
-(void)viewSetUp{
    [self  setBtn];
}


-(void)setBtn{
    NSDictionary *dict1 = @{NSUnderlineStyleAttributeName:@(NSUnderlineStyleSingle),
                            NSForegroundColorAttributeName:UIColorFromRGB(kAutoAtlasGreen),
                            NSFontAttributeName:kQuicksand_Bold15
                            };
    NSAttributedString * atr = [[NSAttributedString  alloc]initWithString:@"Edit" attributes:dict1];
    [self.btnEdit setAttributedTitle:atr forState:UIControlStateNormal];
    
    self.btnAddVeh.layer.cornerRadius = 2.0;
    self.btnAddVeh.clipsToBounds = YES;
    self.btnAddVeh.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.btnAddVeh.titleLabel.font = kQuicksand_Bold14;
    [self.btnAddVeh  setTitle:kAddNewVehicle forState:UIControlStateNormal];
    [self.btnAddVeh setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
}




#pragma mark - WEBCALL
-(void)webCallForGetVehiCle{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehicleList];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];//objGlobal.str_userid
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
    [self.activity  startAnimating];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [self.activity  stopAnimating];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                
                NSLog(@"RESULT = %@",result);
                
                NSArray * arrData = [result  objectForKey:kdata];
                
                vehicleListArray = [NSMutableArray new];
                for (NSDictionary *dict in arrData) {
                    NSError *err;
                    VehicleListModel *objVehicle = [[VehicleListModel alloc] initWithDictionary:dict error:&err];
                    if (!err) {
                        [vehicleListArray addObject:objVehicle];
                    }
                }
                
                if (vehicleListArray.count == 1) {
                    [self.btnBack  setHidden:YES];
                    [self.btnNext  setHidden:YES];
                }
                
                
                NSString * strtitle = [NSString  stringWithFormat:@"%@ (%ld)",kAddNewVehicle,vehicleListArray.count];
                [self.btnAddVeh  setTitle:strtitle forState:UIControlStateNormal];
                [self.tableView reloadData];
                
            } else {
                [self.btnBack  setHidden:YES];
                [self.btnNext  setHidden:YES];
                [self.btnEdit  setHidden:YES];
                [self  showAlertWithTitle:@"Alert" Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:@"Alert" Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}





#pragma mark - DATASOURCE AND DELEGATE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *MyIdentifier = @"VehicleInfoCell";
    VehicleInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    VehicleListModel * objVendor = [vehicleListArray objectAtIndex:selectedIndex];
    
    
    //brand name
    cell.lblBrandName.font = kQuicksand_Bold12;
    cell.lblBrandName.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblBrandName.text = @"BRAND NAME";
    
    cell.lblBrandNameTxt.font = kQuicksand_Regular14;
    cell.lblBrandNameTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblBrandNameTxt.text = objVendor.brand_name.capitalizedString;
    
    
    //vehicle type
    cell.lblVehicleType.font = kQuicksand_Bold12;
    cell.lblVehicleType.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblVehicleType.text = @"VEHICLE TYPE";
    
    cell.lblVehicleTypeTxt.font = kQuicksand_Regular13;
    cell.lblVehicleTypeTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblVehicleTypeTxt.text = objVendor.vehicle_type.capitalizedString;
    
    
    
    //model name
    cell.lblModelName.font = kQuicksand_Bold12;
    cell.lblModelName.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblModelName.text = @"MODEL NAME";
    
    cell.lblModelNameTxt.font = kQuicksand_Regular14;
    cell.lblModelNameTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblModelNameTxt.text = objVendor.model_name.capitalizedString;
    
    
    
    //reg no
    cell.lblRegNo.font = kQuicksand_Bold12;
    cell.lblRegNo.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblRegNo.text = @"REGISTRATION NUMBER";
    
    cell.lblRegNoTxt.font = kQuicksand_Regular14;
    cell.lblRegNoTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblRegNoTxt.text = objVendor.vehicle_reg_number.uppercaseString;
    
    
    //reg yr
    cell.lblRegYr.font = kQuicksand_Bold12;
    cell.lblRegYr.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblRegYr.text = @"YEAR OF MANUFACTURE";
    
    
    
    cell.lblRegYrTxt.font = kQuicksand_Regular14;
    cell.lblRegYrTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblRegYrTxt.text = objVendor.vehicle_reg_year.uppercaseString;
    
    
    
    //reg due date
    cell.lblRegDueDate.font = kQuicksand_Bold12;
    cell.lblRegDueDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblRegDueDate.text = @"REGISTRATION DUE DATE";
    
    cell.lblRegDueDateTxt.font = kQuicksand_Regular14;
    cell.lblRegDueDateTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * date = [dateFormatter  dateFromString:objVendor.registration_due_date];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString * strRegDue = [dateFormatter stringFromDate:date];
    cell.lblRegDueDateTxt.text = strRegDue.uppercaseString;
    
    
    //service_date
    cell.lblServiceDate.font = kQuicksand_Bold12;
    cell.lblServiceDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblServiceDate.text = @"SERVICE DATE";
    
    cell.lblServiceDateTxt.font = kQuicksand_Regular14;
    cell.lblServiceDateTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    date = [dateFormatter  dateFromString:objVendor.service_date];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString * strServ = [dateFormatter stringFromDate:date];
    cell.lblServiceDateTxt.text = strServ;
    
    
    //tyre fitment date
    cell.lblTyreFitDate.font = kQuicksand_Bold12;
    cell.lblTyreFitDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblTyreFitDate.text = @"TYRE FITMENT DATE";
    
    cell.lblTyreFitDateTxt.font = kQuicksand_Regular14;
    cell.lblTyreFitDateTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    date = [dateFormatter  dateFromString:objVendor.tyre_fitment_date];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString * strFit = [dateFormatter stringFromDate:date];
    cell.lblTyreFitDateTxt.text = strFit;
    
    
    //battery installation date
    cell.lblBatInstDate.font = kQuicksand_Bold12;
    cell.lblBatInstDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblBatInstDate.text = @"BATTERY FITMENT DATE";
    
    
    cell.lblBatInstDateTxt.font = kQuicksand_Regular14;
    cell.lblBatInstDateTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    date = [dateFormatter  dateFromString:objVendor.battery_installation_date];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString * strBat = [dateFormatter stringFromDate:date];
    cell.lblBatInstDateTxt.text = strBat;
    
    
    //insurance date
    cell.lblInsuDate.font = kQuicksand_Bold12;
    cell.lblInsuDate.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblInsuDate.text = @"INSURANCE DUE DATE";
    
    cell.lblInsuDateTxt.font = kQuicksand_Regular14;
    cell.lblInsuDateTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    date = [dateFormatter  dateFromString:objVendor.insurance_date];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString * strInsu = [dateFormatter stringFromDate:date];
    cell.lblInsuDateTxt.text = strInsu;
    
    //avg running
    cell.lblAvgRun.font = kQuicksand_Bold12;
    cell.lblAvgRun.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell.lblAvgRun.text = @"AVERAGE KMS PER WEEK";
    
    cell.lblAvgRunTxt.font = kQuicksand_Regular14;
    cell.lblAvgRunTxt.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblAvgRunTxt.text = objVendor.average_running_per_day;
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 400;
}




#pragma mark - BUTTON ACTION
- (IBAction)btnNext:(id)sender {
    if(selectedIndex == vehicleListArray.count-1){
        [self  showAlertWithTitle:@"Alert" Withsubtitle:@"No Vehicle Found" withIndex:kIndexMaxValue];
        return;
    }
    selectedIndex = selectedIndex + 1;
    [self.tableView reloadData];
}



- (IBAction)btnPrevious:(id)sender {
    if(selectedIndex > 0){
        selectedIndex = selectedIndex - 1;
        [self.tableView reloadData];
    }else{
        [self  showAlertWithTitle:@"Alert" Withsubtitle:@"No data found" withIndex:kIndexMaxValue];
    }
}


- (IBAction)btnAddNew:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    AddNewVehicle *newVehicleVC = [storyboard instantiateViewControllerWithIdentifier:@"AddNewVehicle"];
    [self.navigationController pushViewController:newVehicleVC animated:YES];
}


- (IBAction)btnEditAction:(id)sender{
    UIStoryboard * story = [UIStoryboard  storyboardWithName:@"EditVehicleInfo" bundle:nil];
    EditVehicleInfo * objEdit = [story  instantiateViewControllerWithIdentifier:@"EditVehicleInfo"];
    objEdit.passEditVehicle = ^(NSInteger intType) {
        [self webCallForGetVehiCle];
    };
    VehicleListModel * objVendor = [vehicleListArray objectAtIndex:selectedIndex];
    objEdit.objVehicleModel = objVendor;
    [self.navigationController  pushViewController:objEdit animated:YES];
}


- (IBAction)btnAddVehAction:(id)sender{
}


#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    UIAlertController * alert=   [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
        if (index == kIndexMaxValue) {
            [alert  dismissViewControllerAnimated:YES completion:nil];
        } else{
            [alert  dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

