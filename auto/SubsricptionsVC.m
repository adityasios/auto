//
//  SubsricptionsVC.m
// aditya
//
//  Created by // aditya on 11/24/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "SubsricptionsVC.h"

@interface SubsricptionsVC ()

@end

@implementation SubsricptionsVC


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMethod];
    [self setUpViews];
    [self webCallForGetSubscription:koneTimePlan];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

-(void)dealloc{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}



#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
    strsubid = @"";
    
    //number format for price
    numberFormat =[NSNumberFormatter  new];
    numberFormat.minimumFractionDigits = 0;
    numberFormat.maximumFractionDigits = 2;
    
    [self  initInAppPurchase];
}


#pragma mark - INIT APP PURCHASE
-(void)initInAppPurchase{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
    
    //fetch in app products
    NSSet * productIdentifiers = [NSSet  setWithObjects:kIndividualPlus,kFamily,kBusiness,kBusinessFleet,nil];
    productsRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
    productsRequest.delegate = self;
    [productsRequest start];
}






#pragma mark - VIEW SET UP
-(void)setUpViews {
    [self setViews];
    [self setLbl];
    [self setBtn];
    [self setNavBar];
}


-(void)setViews {
    
    //tblv
    self.tblVwSubsrcptns.backgroundColor = UIColorFromRGB(kBackground);
    
    //bg
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    
    //select plan
    self.viewSelectPlan.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    
    //crt plan
    self.viewCurrentPlan.backgroundColor = UIColorFromRGB(kappleWhite);
    self.viewCurrentPlan.layer.cornerRadius = 8.0;
    
    //crt plan
    self.viewCrtPlanBg.backgroundColor = UIColorFromRGB(kBackground);
}



-(void)setLbl {
    
    self.lblSelectUrPlan.text = @"Select your plan based \n on your requirement";
    self.lblSelectUrPlan.font = kQuicksand_Bold13;
    self.lblSelectUrPlan.textColor = UIColorFromRGB(kappleWhite);
    
    self.lblOneTime.font = kQuicksand_Bold14;
    self.lblOneTime.textColor = UIColorFromRGB(kappleWhite);
    
    self.lblMonthly.font = kQuicksand_Bold14;
    self.lblMonthly.textColor = UIColorFromRGB(kappleWhite);
    
    self.lblYourCurentPlan.textColor = UIColorFromRGB(kappleDarkGrey);
    self.lblYourCurentPlan.font = kQuicksand_Bold14;
    
    self.lbl1Vehicle.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lbl1Vehicle.font = kQuicksand_Bold13;
    
    self.lblFree.textColor =  UIColorFromRGB(kAutoAtlasGreen);
    self.lblFree.font = kQuicksand_Bold14;
}




-(void)setBtn {
    [self.switchSelect addTarget:self action:@selector(flip:) forControlEvents:UIControlEventValueChanged];
}

-(void)setNavBar {
    [self customNavTitle:@"Subscriptions"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(kAutoAtlasGreen);
}

-(void)customNavTitle:(NSString *)str{
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kQuicksand_Bold12, NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnBack,titleBarButton];
    
    [self.barBtnMenu setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: kQuicksand_Bold12, NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName,  nil] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[self.barBtnMenu];
}


-(void)flip:(id)sender {
    if ([self.switchSelect isOn]) {
        [self webCallForGetSubscription:kmonthlyPlan];
    }else {
        [self webCallForGetSubscription:koneTimePlan];
    }
}



#pragma mark -  DELEGATE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return marrSubPlan.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubscriptionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubscriptionCell" forIndexPath:indexPath];
    SubscriptionListModel *objCat = [marrSubPlan objectAtIndex:indexPath.row];
    cell.lblAmount.text =   [numberFormat  stringFromNumber:[NSNumber  numberWithFloat:objCat.price.floatValue]];
    cell.lblNoOfVehicles.text = objCat.vehicle_allowed;
    cell.lblAmountTime.text = objCat.renewal_type_text;
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    objSubSel = [marrSubPlan objectAtIndex:indexPath.row];
    
    if (objSubSel.subscription_id.integerValue == strsubid.integerValue) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kAlreadyActive withIndex:kIndexMaxValue];
    }else{
        if (arrValidPro.count == 0) {
            [self  showAlertWithTitle:kError Withsubtitle:kUnableToConnect withIndex:kIndexMaxValue];
        }else{
            
            __block NSInteger intIndex = -1;
            [arrValidPro enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                SKProduct * objProd = (SKProduct *)obj;
                
                NSLog(@"price = %@",objProd.price);
                NSLog(@"productIdentifier = %@",objProd.productIdentifier);
                
                if (objProd.productIdentifier.integerValue == objSubSel.apple_id.integerValue) {
                    intIndex = idx;
                    *stop = YES;
                    return;
                }
            }];
            
            if (intIndex >= 0) {
                SKProduct * objProd = [arrValidPro objectAtIndex:intIndex];
                [self  purchaseMyProduct:objProd];
            }
        }
    }
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}


#pragma mark  - IN APP DELEGATE
-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    
    if (response.invalidProductIdentifiers.count > 0) {
        NSLog(@"response = %@",response.invalidProductIdentifiers);
    }else{
        arrValidPro = [NSMutableArray  arrayWithArray:response.products];
        NSLog(@"arrValidPro.count = %ld",arrValidPro.count);
        /*
         [arrValidPro enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         SKProduct * objProd                  = (SKProduct *)obj;
         NSLog(@"objProd.localizedDescription = %@",objProd.localizedDescription);
         NSLog(@"objProd.localizedTitle       = %@",objProd.localizedTitle);
         NSLog(@"objProd.price                = %@",objProd.price);
         NSLog(@"objProd.productIdentifier    = %@",objProd.productIdentifier);
         NSLog(@"objProd.productIdentifier    = %@",objProd.priceLocale.currencySymbol);
         }];
         */
    }
}


-(void)request:(SKRequest *)request didFailWithError:(NSError *)error{
    [self  showAlertWithTitle:kError Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
}





-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    
    for (SKPaymentTransaction * transaction in transactions) {
        
        switch (transaction.transactionState) {
                
            case SKPaymentTransactionStatePurchasing:
                NSLog(@"Purchasing");
                break;
                
            case SKPaymentTransactionStatePurchased:
                [BasicUtility  hideLoaderInView:self.view];
                NSLog(@"SKPaymentTransactionStatePurchased %@",transaction.transactionIdentifier);
                [self  webCallForSubscriptionStatus:transaction.transactionIdentifier withPaymentStatus:@"1" withError:@""];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateRestored:
                [BasicUtility  hideLoaderInView:self.view];
                NSLog(@"Restored ");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            case SKPaymentTransactionStateFailed:
                NSLog(@"Purchase failed  %@",transaction.transactionIdentifier);
                NSLog(@"Purchase error  %@",transaction.error.localizedDescription);
                [BasicUtility  hideLoaderInView:self.view];
                [self  webCallForSubscriptionStatus:transaction.transactionIdentifier withPaymentStatus:@"0" withError:transaction.error.localizedDescription];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
                
            default:
                break;
        }
    }
}





#pragma mark  - MAKE PAYMENT
- (BOOL)canMakePurchases{
    return [SKPaymentQueue canMakePayments];
}



- (void)purchaseMyProduct:(SKProduct*)product{
    NSLog(@"purchaseMyProduct productID = %@",product.productIdentifier);
    if ([self canMakePurchases]) {
        [BasicUtility  showLoaderInView:self.view];
        SKPayment *payment = [SKPayment paymentWithProduct:product];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }else{
        [self  showAlertWithTitle:@"Alert" Withsubtitle:@"Purchases are disabled in your device" withIndex:10];
    }
}













































#pragma mark  - ACTION METHOD
- (IBAction)barBtnMenuAction:(id)sender {
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Select Option" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Transaction History" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        AllTransactionsVC *allTransVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AllTransactionsVC"];
        [self.navigationController pushViewController:allTransVC animated:YES];
    }]];
    
    /*
     [actionSheet addAction:[UIAlertAction actionWithTitle:@"Your Active Subscription" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
     ActiveSubscriptionVC *activeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ActiveSubscriptionVC"];
     [self.navigationController pushViewController:activeVC animated:YES];
     }]];
     */
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}





#pragma mark - WEBCALL
-(void)webCallForGetSubscription:(NSString *)planType{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetSubscriptionList];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:planType forKey:kplan_type];
    
    
    
    [BasicUtility  showLoaderInView:self.view];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            if (strStatus.integerValue == 1) {
                NSLog(@"RESULT = %@",result);
                NSDictionary * dicdata = [result objectForKey:kdata];
                [self  parsingGetSubscription:dicdata];
            }else {
                [self  showAlertWithTitle:@"Alert" Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:@"Alert" Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}



-(void)webCallForSubscriptionStatus:(NSString *)transId withPaymentStatus:(NSString *)payStatus withError:(NSString *)err{
    NSString *strPost = [KBaseURL stringByAppendingString:kPostUpdatePaymentStatus];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:transId forKey:ktxn_id];
    [mdictPara  setObject:payStatus forKey:kpayment_status];
    [mdictPara  setObject:objSubSel.apple_id forKey:kproduct_id];
    [mdictPara  setObject:objSubSel.price forKey:kpaid_amount];
    [mdictPara  setObject:kIOS forKey:kdevice_type];
    
    
    [BasicUtility  showLoaderInView:self.view];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                NSLog(@"RESULT = %@",result);
                if (payStatus.integerValue == 0) {
                    [self  showAlertWithTitle:kError Withsubtitle:err withIndex:kIndexMaxValue];
                }else{
                    if (self.switchSelect.isOn) {
                        [self webCallForGetSubscription:kmonthlyPlan];
                    }else{
                        [self webCallForGetSubscription:koneTimePlan];
                    }
                }
            }else {
                [self  showAlertWithTitle:@"Alert" Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:@"Alert" Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}








/*
 http://websitedevelopment101.com/autoatlas/api/subscription_plan/get_user_active_plan
 key:8dfafb41e9b4c0b3decd875e7a231049
 user_id:1
 */


//plan list
/*
http://websitedevelopment101.com/autoatlas/api/subscription_plan/get_plans
key:8dfafb41e9b4c0b3decd875e7a231049
user_id:1
subscriptionplanid:2
plan_type  1,2
*/


/*
 http://websitedevelopment101.com/autoatlas/api/subscription_plan/updatePaymentStatus
 "key":8dfafb41e9b4c0b3decd875e7a231049
 "user_id":1
 "subscriptionplanid":
 "txn_id" :
 "payment_status":
 "payment_json"
 "paid_amount"
 "device_type"
 */

/*
user_id:101
txn_id:132232134
payment_status:1
product_id:200
paid_amount:300.00
device_type:IOS
payment_response:
*/



#pragma mark - WEBCALL PARSING
-(void)parsingGetSubscription:(NSDictionary *)dict{
    
    
    //current_user_plan
    if ([dict.allKeys containsObject:kcurrent_user_plan]) {
        if ([[dict  objectForKey:kcurrent_user_plan] isKindOfClass:[NSDictionary  class]]) {
            
            NSDictionary * dictcrtplan = [dict  objectForKey:kcurrent_user_plan];
            strsubid = [NSString  stringWithFormat:@"%@",[dictcrtplan objectForKey:ksubscription_id]];
            NSString * strsub = [NSString  stringWithFormat:@"%@",[dictcrtplan objectForKey:ksubscription_name]];
            NSString * strvehicle = [NSString  stringWithFormat:@"%@",[dictcrtplan objectForKey:ktotal_vehicles]];
            
            self.lblFree.text = strsub.capitalizedString;
            self.lbl1Vehicle.text = [NSString stringWithFormat:@"%@ VEHICLE",strvehicle];
            self.lblFree.text = self.lblFree.text.capitalizedString;
        }
    }
    
    
    // all_plans
    if ([dict.allKeys containsObject:kall_plans]) {
        if ([[dict  objectForKey:kall_plans] isKindOfClass:[NSArray  class]]) {
            NSArray * arrPlans = [dict  objectForKey:kall_plans] ;
            marrSubPlan = [NSMutableArray new];
            for (NSDictionary *dict in arrPlans) {
                NSError *err;
                SubscriptionListModel *objVehicle = [[SubscriptionListModel alloc] initWithDictionary:dict error:&err];
                if (!err) {
                    [marrSubPlan addObject:objVehicle];
                }
            }
        }
    }
    
    [self.tblVwSubsrcptns reloadData];
}





#pragma mark - SHOW ALERT
-(void)showAlertWithTitle:(NSString *)strTitle Withsubtitle:(NSString *)subtitle withIndex:(NSInteger)index {
    
    UIAlertController * alert = [UIAlertController  alertControllerWithTitle:strTitle message:subtitle  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* ok         = [UIAlertAction  actionWithTitle:kAlert_ok  style:UIAlertActionStyleDefault  handler:^(UIAlertAction * action)  {
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
