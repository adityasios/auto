//
//  AllTransactionsVC.m
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "AllTransactionsVC.h"

@interface AllTransactionsVC ()

@end

@implementation AllTransactionsVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self  viewSetUp];
    [self  webCallForGetTransList];
}


#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues  sharedManager];
    dateFormat = [NSDateFormatter  new];
}



#pragma mark - VIEW SET UP
-(void)viewSetUp{
    self.view.backgroundColor = UIColorFromRGB(kappleWhite);
    self.tblViewAllTransactions.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self setNavBar];
}



#pragma mark - NAV SET UP
-(void)setNavBar {
    [self customNavTitle:@"All Transactions"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(kAutoAtlasGreen);
}


-(void)customNavTitle:(NSString *)str{
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kQuicksand_Bold12, NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnBack,titleBarButton];
}


#pragma mark -  DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return marrTransData.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AllTranscnsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AllTranscnsCell" forIndexPath:indexPath];
    TransListModel * objTrans = [marrTransData  objectAtIndex:indexPath.row];
    
    
    //name
    cell.lblPackageName.text = objTrans.subscription_name;
    
    //date
    [dateFormat  setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate * dateCreate = [dateFormat dateFromString:objTrans.created_on];
    [dateFormat  setDateFormat:@"EEE dd MMM,yy"];
    cell.lblDate.text = [dateFormat stringFromDate:dateCreate];
   
    //price
    cell.lblPrice.text = [NSString  stringWithFormat:@"AUD %@",objTrans.paid_amount];
    
    //payment status
    if (objTrans.payment_status.integerValue == 0) {
        cell.lblcancld.textColor = [UIColor redColor];
        cell.lblcancld.text = @"cancelled";
    }else {
        
        cell.lblcancld.textColor = UIColorFromRGB(kAutoAtlasGreen);
        cell.lblcancld.text = @"completed";
    }
    
    //txn id
    if (objTrans.txn_id.length == 0) {
        cell.transactionNumber.text =    [NSString  stringWithFormat:@"Txn id: N/A"];
    }else{
        cell.transactionNumber.text =    [NSString  stringWithFormat:@"Txn id: %@",objTrans.txn_id];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}



#pragma mark - ACTION METHOD
- (IBAction)barBtnBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - WEBCALL
-(void)webCallForGetTransList{
    
    
    [BasicUtility  showLoaderInView:self.view];
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostTransHistory];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                NSArray * arrdata = [result  objectForKey:kdata];
                [self  parsingGetTransList:arrdata];
            }else{
                [self  showAlertWithTitle:@"Alert" Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:@"Alert" Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}



-(void)parsingGetTransList:(NSArray *)arr{
    marrTransData = [NSMutableArray  new];
    for (NSDictionary * dict in arr) {
        NSError *err;
        TransListModel *objTrans = [[TransListModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            if (objTrans.paid_amount.length > 0) {
                [marrTransData addObject:objTrans];
            }
            
        }
    }
    [self.tblViewAllTransactions  reloadData];
}







#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert = [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok   = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
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

