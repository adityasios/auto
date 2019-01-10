//
//  VehicleInfoVC.m
//  AutoAtlas
//
//  Created by webmazix on 11/23/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "VehicleInfoVC.h"

@interface VehicleInfoVC ()
@end
@implementation VehicleInfoVC


#pragma mark - VIEW SET UP
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self setUpViews];
    [self webCallForGetVehiCle];
}



#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
    arr1 = [NSArray arrayWithObjects:@"NEXT SERVICE",@"NEXT TYRE CHECK", nil];
    arr2 = [NSArray arrayWithObjects:@"REGO DUE",@"NEXT BATTERY CHECK", nil];
}


#pragma mark - VIEW SET UP
-(void)setUpViews {
    [self setBtn];
}

-(void)setBtn {
    self.addVehicleBtn.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    [self.addVehicleBtn setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    self.addVehicleBtn.titleLabel.font = kQuicksand_Bold12;
}


#pragma mark - DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return vehicleListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VehicleListModel * objVehicle = [vehicleListArray objectAtIndex:indexPath.row];
    CustomCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:@"CustomCell1"];
    if (!cell1) {
        [tableView registerNib:[UINib nibWithNibName:@"CustomCell1" bundle:nil] forCellReuseIdentifier:@"CustomCell1"];
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"CustomCell1"];
    }
    
    [cell1.btnDateSelectService addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventTouchUpInside];
    [cell1.btnDateSelectReg addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventTouchUpInside];
    
    cell1.lblNextService.text = [arr1 objectAtIndex:indexPath.row];
    cell1.lblRegoDue.text = [arr2 objectAtIndex:indexPath.row];
    
    cell1.lblNextService.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell1.lblNextService.font = kQuicksand_Regular12;
    cell1.lblRegoDue.textColor = UIColorFromRGB(kAutoAtlasGreen);
    cell1.lblRegoDue.font = kQuicksand_Regular12;
    cell1.lblServiceDate.textColor = UIColorFromRGB(kappleDarkGrey);
    cell1.lblServiceDate.font = kQuicksand_Bold16;
    cell1.lblDateRegoDue.textColor = UIColorFromRGB(kappleDarkGrey);
    cell1.lblDateRegoDue.font = kQuicksand_Bold16;
    cell1.lblDaysLeftService.textColor = UIColorFromRGB(kappleGrey);
    cell1.lblDaysLeftService.font = kQuicksand_Regular10;
    cell1.lblDaysLeftRego.textColor = UIColorFromRGB(kappleGrey);
    cell1.lblDaysLeftRego.font = kQuicksand_Regular10;
    
    return cell1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}


-(void)pickDate:(UIButton *)button {
    
    NSDate * today = [NSDate new];
    NSCalendar * gregorian = [NSCalendar currentCalendar];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:-10];
    NSDate * max = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    [offsetComponents setYear:-100];
    NSDate * min = [gregorian dateByAddingComponents:offsetComponents toDate:today options:0];
    
    
    ActionSheetDatePicker *datePicker = [[ActionSheetDatePicker alloc] initWithTitle:@"Select Date" datePickerMode:UIDatePickerModeDate selectedDate:[NSDate date] target:self action:@selector(timeWasSelected:element:) origin:button cancelAction:@selector(timeCancelled:)];
    
    
    [datePicker setMinimumDate:min];
    [datePicker setMaximumDate:max];
    [datePicker showActionSheetPicker];
}


#pragma mark
#pragma mark SELCTOR ACTION
#pragma mark
-(void)timeWasSelected:(NSDate *)selectedTime element:(id)element {
    
}


-(void)timeCancelled:(id)sender{
    
}

#pragma mark
#pragma mark  ACTION METHODS
#pragma mark
- (IBAction)addVehicleBtnAction:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    AddNewVehicle *newVehicleVC = [storyboard instantiateViewControllerWithIdentifier:@"AddNewVehicle"];
    [self.navigationController pushViewController:newVehicleVC animated:YES];
    
}

- (IBAction)btnNext:(id)sender {
    
}

- (IBAction)btnBack:(id)sender {
    
}

- (IBAction)editVehicleInfoAction:(id)sender {
    
    EditVehicleInfoVC * controller =  [[EditVehicleInfoVC alloc] initWithNibName:@"EditVehicleInfoVC" bundle: nil];
    controller.providesPresentationContextTransitionStyle = YES;
    controller.definesPresentationContext = YES;
    [controller setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    [self presentViewController:controller animated:YES completion:nil];
    
}






#pragma mark - WEBCALL
-(void)webCallForGetVehiCle{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehicleList];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
    [DejalBezelActivityView  activityViewForView:self.view withLabel:kPleaseWait];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [DejalBezelActivityView  removeViewAnimated:YES];
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
                
            }else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
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

