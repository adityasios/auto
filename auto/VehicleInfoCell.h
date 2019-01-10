//
//  VehicleInfoCell.h
// aditya
//
//  Created by // aditya Kumar on 3/14/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VehicleInfoCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *  lblBrandName;
@property (strong, nonatomic) IBOutlet UILabel *  lblBrandNameTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblVehicleType;
@property (strong, nonatomic) IBOutlet UILabel *  lblVehicleTypeTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblModelName;
@property (strong, nonatomic) IBOutlet UILabel *  lblModelNameTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblRegNo;
@property (strong, nonatomic) IBOutlet UILabel *  lblRegNoTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblRegYr;
@property (strong, nonatomic) IBOutlet UILabel *  lblRegYrTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblRegDueDate;
@property (strong, nonatomic) IBOutlet UILabel *  lblRegDueDateTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblServiceDate;
@property (strong, nonatomic) IBOutlet UILabel *  lblServiceDateTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblTyreFitDate;
@property (strong, nonatomic) IBOutlet UILabel *  lblTyreFitDateTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblBatInstDate;
@property (strong, nonatomic) IBOutlet UILabel *  lblBatInstDateTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblInsuDate;
@property (strong, nonatomic) IBOutlet UILabel *  lblInsuDateTxt;

@property (strong, nonatomic) IBOutlet UILabel *  lblAvgRun;
@property (strong, nonatomic) IBOutlet UILabel *  lblAvgRunTxt;

@end

/*
Service Date  service_date
Tyre Fitment Date   tyre_fitment_date
Battery installation Date  battery_installation_date
Insurance date   insurance_date
Avg running per day  average_running_per_day
*/





