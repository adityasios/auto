//
//  NotificationsVC.m
// aditya
//
//  Created by // aditya on 11/23/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "NotificationsVC.h"

@interface NotificationsVC ()
@end
@implementation NotificationsVC

#pragma mark  - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMethod];
    [self viewSetUp];
    if ([BasicUtility  isInternetAvailable]) {
        [self   webCallForNotList];
    }else{
        [self  showAlertWithTitle:kNotNetAvailable Withsubtitle:kInternetError withIndex:kIndexMaxValue];
    }
}





#pragma mark  - INIT METHOD
-(void)initMethod{
    
    intPage = -1;
    isPaginationAllow = FALSE;
    
    self.viewMainNoNotification.hidden = YES;
    self.tblViewNotifications.backgroundColor = UIColorFromRGB(kBackground);
    self.tblViewNotifications.estimatedRowHeight = 70;
    self.tblViewNotifications.rowHeight = UITableViewAutomaticDimension;
    
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    objGlobalValue = [GlobalValues sharedManager];
    dateformat = [NSDateFormatter  new];
    
}


#pragma mark - VIEW SET UP
-(void)viewSetUp{
    [self setNavBar];
    [self setBtn];
    [self setLbl];
}


-(void)setLbl {
    
    self.lblNoNotices.font = kQuicksand_Bold14;
    self.lblNoNotices.textColor = [UIColor blackColor];
    
    self.lblUpToDate.font = kQuicksand_Regular12;
    self.lblUpToDate.textColor = UIColorFromRGB(kappleGrey);
}


-(void)setBtn {
    
    [self.btnViewActivities setTitleColor:UIColorFromRGB(k adityaGreen) forState:UIControlStateNormal];
    self.btnViewActivities.titleLabel.font = kQuicksand_Bold12;
}


-(void)setNavBar {
    [self customNavTitle:@"Notifications"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(k adityaGreen);
}


-(void)customNavTitle:(NSString *)str{
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: kQuicksand_Bold14, NSFontAttributeName,
                                            [UIColor whiteColor], NSForegroundColorAttributeName,  nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.btnBack,titleBarButton];
    
    /*
    [self.barBtnClear setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kQuicksand_Bold12, NSFontAttributeName,
                                              [UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[self.barBtnClear];
     */
    self.navigationItem.rightBarButtonItem = nil;
}



#pragma mark - DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [marrNotifications count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell" forIndexPath:indexPath];
    cell.backgroundColor = UIColorFromRGB(kBackground);
    
    NotModel * objNot = [marrNotifications  objectAtIndex:indexPath.row];
    
    //title
    cell.lblNotificationTitle.font =  kQuicksand_Bold11;
    cell.lblNotificationTitle.textColor = [UIColor blackColor];
    cell.lblNotificationTitle.text = objNot.notification_text.capitalizedString;
    
    
    //date
    cell.lblDate.textColor = UIColorFromRGB(kappleGrey);
    cell.lblDate.font = kQuicksand_Regular10;
    [dateformat  setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date = [dateformat  dateFromString:objNot.created_on];
    [dateformat  setDateFormat:@"MMM dd,yyyy HH:mm"];
    NSString * strdate = [dateformat  stringFromDate:date];
    NSLog(@"strdate = %@",strdate);
    cell.lblDate.text = strdate;
    
    return cell;
}




-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isPaginationAllow && marrNotifications.count > 0) {
        if (indexPath.row == (marrNotifications.count - 1)) {
            [self  webCallForNotList];
        }
    }
}


#pragma mark - WEBCALL
-(void)webCallForNotList{
    
    intPage = intPage +1;
    NSString * strPage = [NSString  stringWithFormat:@"%ld",intPage];
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostNotificationList];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objGlobalValue.str_userid forKey:kuser_id];
    [mdictPara  setObject:strPage forKey:kpage];
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
                
                if (arrData.count > 0) {
                    isPaginationAllow = TRUE;
                    self.viewMainNoNotification.hidden = YES;
                    [self  parsingWebCallForNotList:arrData];
                }
                
            }else{
                
                isPaginationAllow = FALSE;
                self.viewMainNoNotification.hidden = NO;
                self.tblViewNotifications.backgroundColor = [UIColor  clearColor];
            }
        }else{
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}





#pragma mark - WEBCALL PARSING
-(void)parsingWebCallForNotList:(NSArray *)arrList{
    
    if (intPage == 0) {
        marrNotifications = [NSMutableArray  new];
    }
    
    for (NSDictionary *dict in arrList) {
        NSError *err;
        NotModel * objNot = [[NotModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrNotifications addObject:objNot];
        }
    }
    
    
    [self.tblViewNotifications  reloadData];
}



#pragma mark - BUTTON ACTION
- (IBAction)btnclickAction:(id)sender {
    LookingServiceVC *lookingVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LookingServiceVC"];
    [self.navigationController pushViewController:lookingVC animated:YES];
}


- (IBAction)barBtnBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnGoToHomeAction:(id)sender {
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

