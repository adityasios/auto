//
//  VendorRev.m
// aditya
//
//  Created by // aditya Kumar on 3/15/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "VendorRev.h"

@interface VendorRev ()

@end

@implementation VendorRev


#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self  viewSetUp];
    [self  webCallForGetReviewList];
}




#pragma mark - INIT METHOD
-(void)initMethod{
    kPrintClass_MethodName
    
    intPage = 0;
    isPaginationAllow = FALSE;
    objGlobal = [GlobalValues sharedManager];
    self.tblv.estimatedRowHeight = 120;
    self.tblv.rowHeight = UITableViewAutomaticDimension;
    dateformat = [NSDateFormatter  new];
}

#pragma mark - VIEW SET UP
-(void)viewSetUp{
    [self  setActivityView];
    [self  customBackButton];
}


-(void)customBackButton{
    UIImage* buttonImage = [UIImage imageNamed:@"bk"];
    CGRect frame = CGRectMake(10, 0, 20, 20);
    UIButton *bckButton = [[UIButton alloc] initWithFrame:frame];
    bckButton.contentEdgeInsets = UIEdgeInsetsMake(-8, -8, -8, -8);
    [bckButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [bckButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backbarButton = [[UIBarButtonItem alloc] initWithCustomView:bckButton];
    
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    NSString * strRev = [NSString  stringWithFormat:@"%@ Reviews",self.objVendorList.name];
    [titleBarButton setTitle:strRev];
    NSDictionary * dictAttr = [NSDictionary dictionaryWithObjectsAndKeys: kQuicksand_Bold14, NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName,
                               nil];
    [titleBarButton setTitleTextAttributes:dictAttr forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[backbarButton,titleBarButton];
}


-(void)setActivityView{
    
    
    
    UIView * viewfooter = [[UIView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    viewfooter.backgroundColor = [UIColor  clearColor];
    self.tblv.tableFooterView = viewfooter;
    
    activityView = [[UIActivityIndicatorView  alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.color = UIColorFromRGB(k adityaGreen);
    activityView.center = CGPointMake(SCREEN_WIDTH/2, 30);
    [activityView hidesWhenStopped];
    [viewfooter addSubview:activityView];
}





#pragma mark - SEL ACTION
-(void)backButtonClicked:(UIButton *)sender{
    self.passNavBtn(1);
    [self.navigationController  popViewControllerAnimated:YES];
}





#pragma mark - TABLEVIEW  DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return marrData.count;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isPaginationAllow && marrData.count > 0) {
        if (indexPath.row == (marrData.count - 1)) {
            [self  webCallForGetReviewList];
            
        }
    }
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VendorRevCell * cell = [tableView dequeueReusableCellWithIdentifier:@"VendorRevCell"];
    
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"VendorRevCell" bundle:nil] forCellReuseIdentifier:@"VendorRevCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"VendorRevCell"];
    }
    
    VendorRevModel * objVendor = [marrData objectAtIndex:indexPath.row];
    
    //imgV Profile
    if (objVendor.profile_image) {
        if (objVendor.img_profile) {
            cell.imgVProfile.image = objVendor.img_profile;
        }else{
            
            [cell.imgVProfile  sd_setShowActivityIndicatorView:YES];
            [cell.imgVProfile  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [cell.imgVProfile  sd_setImageWithURL:objVendor.profile_image placeholderImage:kPlaceHolderUser_S completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                objVendor.img_profile = image;
            }];
        }
    }else{
        cell.imgVProfile.image = kPlaceHolderUser_S;
    }
    
    
    //user name
    cell.lblUserName.text = objVendor.user_name.capitalizedString;
    
    //date
    [dateformat  setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * dateCreate = [dateformat  dateFromString:objVendor.created_on];
    [dateformat  setDateFormat:@"dd MMM HH:mm"];
    NSString * strDate = [dateformat  stringFromDate:dateCreate];
    cell.lblDate.text = strDate;
   
    
    //rating view
    cell.ratingView.value = objVendor.rate_star.integerValue;
    
    //commentd
    cell.lblRev.text = objVendor.review;
    return cell;
    
}









/*
VENDOR REVIEWS
http://websitedevelopment101.com/ aditya/api/vendor/get_vendor_reviews
key
page_no
vendor_id
*/

#pragma mark - WEBCALL
-(void)webCallForGetReviewList{
    intPage = intPage+1;
    NSString * strPage = [NSString  stringWithFormat:@"%ld",intPage];
    
    [activityView  startAnimating];
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVendorReview];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:self.objVendorList.vendor_id forKey:kvendor_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    [mdictPara  setObject:strPage forKey:kpage_no];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [activityView  stopAnimating];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                [self  parsingWebCall:result];
            }else {
                [self  showAlertWithTitle:@"Alert" Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:@"Alert" Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}

#pragma mark - PARSING WEBCALL
-(void)parsingWebCall:(NSDictionary *)dict{
    
    if ([[dict  objectForKey:kdata] isKindOfClass:[NSDictionary  class]]) {
        
        if (intPage == 1) {
            marrData = [NSMutableArray  new];
        }
        
        NSDictionary * dictdata = [dict  objectForKey:kdata];
        NSArray * arrRev = [dictdata  objectForKey:kreviews];
        
        
        if (arrRev.count == 0) {
            isPaginationAllow = FALSE;
        }else{
            isPaginationAllow = TRUE;
        }
        
        
        for (NSDictionary * dict in arrRev) {
            NSError * err;
            VendorRevModel * objVendor = [[VendorRevModel alloc]initWithDictionary:dict error:&err];
            if (!err) {
                [marrData  addObject:objVendor];
            }
        }
    }
    
    [self.tblv  reloadData];
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

