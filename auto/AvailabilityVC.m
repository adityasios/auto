//
//  AvailabilityVC.m
// aditya
//
//  Created by // aditya Kumar on 1/17/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "AvailabilityVC.h"

@interface AvailabilityVC ()

@end

@implementation AvailabilityVC


#pragma mark  - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  intializerMethod];
    [self  viewSetUp];
}

#pragma mark  - INIT METHOD
-(void)intializerMethod{
    objGlobalValue = [GlobalValues  sharedManager];
    self.tblv.tableFooterView = [[UIView  alloc]initWithFrame:CGRectZero];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UINib *nib = [UINib nibWithNibName:@"AvailabilityCell" bundle:nil];
    [self.tblv registerNib:nib forCellReuseIdentifier:@"AvailabilityCell"];
    
    dateFormatInitial = [NSDateFormatter  new];
    [dateFormatInitial  setDateFormat:@"HH:mm:ss"];
    
    dateFormatFinal = [NSDateFormatter  new];
    [dateFormatFinal  setDateFormat:@"HH:mm"];
}





#pragma mark  - VIEW SET UP
-(void)viewSetUp{
    self.lblTitle.backgroundColor = UIColorFromRGB(k adityaGreen);
    self.lblTitle.font = kQuicksand_Bold17;
    self.lblTitle.text = @"Check Availability";
    self.lblTitle.textColor = UIColorFromRGB(kappleWhite);
    
    [self.btnSubmit  setBackgroundColor:UIColorFromRGB(k adityaGreen)];
    self.btnSubmit.titleLabel.font = kQuicksand_Bold15;
    [self.btnSubmit  setTitle:@"CANCEL" forState:UIControlStateNormal];
    
}




#pragma mark - TABLE VIEW DELEGATE

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrDataPass.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BussinessDay *  objBusDay = [self.arrDataPass objectAtIndex:indexPath.row];
    
    AvailabilityCell * tcell = [tableView dequeueReusableCellWithIdentifier:@"AvailabilityCell" forIndexPath:indexPath];
    if (!tcell) {
        tcell = [[AvailabilityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AvailabilityCell"];
    }
    
    tcell.lblDay.textColor = UIColorFromRGB(kappleGrey);
    tcell.lblDay.font = kQuicksand_Bold14;
    tcell.lblDay.text = objBusDay.day.capitalizedString;
    
    
    NSDate * dateOpen = [dateFormatInitial  dateFromString:objBusDay.open_time];
    NSDate * dateClose = [dateFormatInitial  dateFromString:objBusDay.close_time];
    
    NSString * strOpen = [dateFormatFinal  stringFromDate:dateOpen];
    NSString * strClose = [dateFormatFinal  stringFromDate:dateClose];
    
    tcell.lblTime.textColor = UIColorFromRGB(kappleGrey);
    tcell.lblTime.font = kQuicksand_Regular14;
    tcell.lblTime.text = [NSString  stringWithFormat:@"%@ to %@",strOpen,strClose];
    
    return tcell;
}



#pragma mark - BUTTON ACTION
-(IBAction)btnSubmitClicked:(UIButton *)sender{
    [self.navigationController dismissCurrentPopinControllerAnimated:YES completion:^{
        NSLog(@"Popin dismissed !");
    }];
}


@end
