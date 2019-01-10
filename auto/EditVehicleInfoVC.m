//
//  EditVehicleInfoVC.m
// aditya
//
//  Created by // aditya on 11/27/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "EditVehicleInfoVC.h"

@interface EditVehicleInfoVC () {
    
    NSArray *arr1;
    NSArray *arr2;
}

@end

@implementation EditVehicleInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViews];
    
    arr1 = [NSArray arrayWithObjects:@"NEXT SERVICE",@"NEXT TYRE CHECK", nil];
    arr2 = [NSArray arrayWithObjects:@"REGO DUE",@"NEXT BATTERY CHECK", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark
#pragma mark  VIEW SET UP
#pragma mark
-(void)setUpViews {
    
    [self setBtn];
}


-(void)setBtn {
    
    self.btnSave.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    self.btnSave.titleLabel.font = kQuicksand_Bold12;
    self.btnSave.layer.cornerRadius = 4.0;
    
    self.btnCancel.backgroundColor = UIColorFromRGB(kappleGrey);
    self.btnCancel.titleLabel.font = kQuicksand_Bold12;
    self.btnCancel.layer.cornerRadius = 4.0;
}

#pragma mark
#pragma mark  DATASOURCE
#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row <arr1.count) {
        EditVehicleCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:@"EditVehicleCell1"];
        
        if (!cell1) {
            [tableView registerNib:[UINib nibWithNibName:@"EditVehicleCell1" bundle:nil] forCellReuseIdentifier:@"EditVehicleCell1"];
            cell1 = [tableView dequeueReusableCellWithIdentifier:@"EditVehicleCell1"];
        }
        
        [cell1.btnNextService addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventTouchUpInside];
        [cell1.btnRegoDue addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventTouchUpInside];
        
        cell1.lblNextService.text = [arr1 objectAtIndex:indexPath.row];
        cell1.lblRegoDue.text = [arr2 objectAtIndex:indexPath.row];
        cell1.lblNextService.textColor = UIColorFromRGB(kAutoAtlasGreen);
        cell1.lblNextService.font = kQuicksand_Regular12;
        cell1.lblRegoDue.textColor = UIColorFromRGB(kAutoAtlasGreen);
        cell1.lblRegoDue.font = kQuicksand_Regular12;
        cell1.lblDateNextService.textColor = UIColorFromRGB(kappleDarkGrey);
        cell1.lblDateNextService.font = kQuicksand_Bold16;
        cell1.lblDateRegoDue.textColor = UIColorFromRGB(kappleDarkGrey);
        cell1.lblDateRegoDue.font = kQuicksand_Bold16;
        cell1.lblDaysLeftNextService.textColor = UIColorFromRGB(kappleGrey);
        cell1.lblDaysLeftNextService.font = kQuicksand_Regular10;
        cell1.lblDaysLeftRegoDue.textColor = UIColorFromRGB(kappleGrey);
        cell1.lblDaysLeftRegoDue.font = kQuicksand_Regular10;
        return cell1;
    }
    
    else if (indexPath.row == 2) {
        
        EditVehicleCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"EditVehicleCell2"];
        
        if (!cell2) {
            [tableView registerNib:[UINib nibWithNibName:@"EditVehicleCell2" bundle:nil] forCellReuseIdentifier:@"EditVehicleCell2"];
            cell2 = [tableView dequeueReusableCellWithIdentifier:@"EditVehicleCell2"];
        }
        
        [cell2.btnInsuranceDue addTarget:self action:@selector(pickDate:) forControlEvents:UIControlEventTouchUpInside];
        
        cell2.lblVehicleType.textColor = UIColorFromRGB(kAutoAtlasGreen);
        cell2.lblVehicleType.font = kQuicksand_Regular12;
        cell2.lblInsuranceDue.textColor = UIColorFromRGB(kAutoAtlasGreen);
        cell2.lblInsuranceDue.font = kQuicksand_Regular12;
        cell2.lblCarType.textColor = UIColorFromRGB(kappleDarkGrey);
        cell2.lblCarType.font = kQuicksand_Bold16;
        cell2.lblDateInsuranceDue.textColor = UIColorFromRGB(kappleDarkGrey);
        cell2.lblDateInsuranceDue.font = kQuicksand_Bold16;
        cell2.lblDaysLeftInsurance.textColor = UIColorFromRGB(kappleGrey);
        cell2.lblDaysLeftInsurance.font = kQuicksand_Regular10;
        
        return cell2;
    }
    
    else {
        
        EditVehicleCell3 *cell3 = [tableView dequeueReusableCellWithIdentifier: @"EditVehicleCell3"];
        if (!cell3) {
            [tableView registerNib:[UINib nibWithNibName:@"EditVehicleCell3" bundle:nil] forCellReuseIdentifier:@"EditVehicleCell3"];
            cell3 = [tableView dequeueReusableCellWithIdentifier:@"EditVehicleCell3"];
        }
        
        cell3.lblVehicleMake.textColor = UIColorFromRGB(kAutoAtlasGreen);
        cell3.lblVehicleMake.font = kQuicksand_Regular12;
        cell3.lblModelYear.textColor = UIColorFromRGB(kAutoAtlasGreen);
        cell3.lblModelYear.font = kQuicksand_Regular12;
        cell3.lblVehicleCompany.textColor = UIColorFromRGB(kappleDarkGrey);
        cell3.lblVehicleCompany.font = kQuicksand_Bold16;
        cell3.lblModelYear.textColor = UIColorFromRGB(kappleDarkGrey);
        cell3.lblModelYear.font = kQuicksand_Bold16;
        cell3.lblSeperator.backgroundColor = UIColorFromRGB(kappleDarkGrey);
        cell3.lblPetrolDiesel.textColor = UIColorFromRGB(kappleDarkGrey);
        cell3.lblPetrolDiesel.font = kQuicksand_Bold16;
        
        return cell3;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80.0;
}


#pragma mark
#pragma mark DATE PICKER
#pragma mark
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
#pragma mark  ACTION METHOD
#pragma mark
- (IBAction)btnSaveAction:(id)sender {
}

- (IBAction)btnCancelAction:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
