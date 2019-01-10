//
//  MyReviewsVC.m
// aditya
//
//  Created by // aditya on 11/23/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "MyReviewsVC.h"

@interface MyReviewsVC ()

@end

@implementation MyReviewsVC 



#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self webCallForGetReviewList];
}



#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobal = [GlobalValues sharedManager];
    self.tblViewReviews.estimatedRowHeight = 120;
    self.tblViewReviews.rowHeight = UITableViewAutomaticDimension;
    dateFormatter = [NSDateFormatter  new];
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
    self.navigationItem.leftBarButtonItem=backbarButton;
}



#pragma mark - TABLEVIEW  DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return reviewListArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyReviewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyReviewsCell"];
    
    if(!cell){
        [tableView registerNib:[UINib nibWithNibName:@"MyReviewsCell" bundle:nil] forCellReuseIdentifier:@"MyReviewsCell"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MyReviewsCell"];
    }
    
    
    ReviewListModel *objCat = [reviewListArray objectAtIndex:indexPath.row];
    
    
    //imgV Profile
    if (objCat.image) {
        if (objCat.imgProfile) {
            cell.imgVProfile.image = objCat.imgProfile;
        }else{
            
            [cell.imgVProfile  sd_setShowActivityIndicatorView:YES];
            [cell.imgVProfile  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [cell.imgVProfile  sd_setImageWithURL:objCat.image placeholderImage:kPlaceHolderUser_S completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                objCat.imgProfile = image;
            }];
        }
    }else{
        cell.imgVProfile.image = kPlaceHolderUser_S;
    }
    
    
    //vendor name
    cell.lblVendorName.text = objCat.name.capitalizedString;
    
    //date
    [dateFormatter  setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * datecreate = [dateFormatter  dateFromString:objCat.created_on];
    [dateFormatter  setDateFormat:@"dd MMM"];
    cell.lblDate.text = [dateFormatter  stringFromDate:datecreate];
    
    //rating vendor
    cell.lblRating.text = [NSString  stringWithFormat:@"%@",objCat.vendor_rating];
    
    //rating view
    cell.ratingView.value = objCat.rate_star.integerValue;
    
    //commentd
    cell.lblCommentDesc.text = objCat.review;
    return cell;
    
}


#pragma mark - SEL ACTION
- (void)backButtonClicked:(id)sender {
    [self.navigationController  popViewControllerAnimated:YES];
}



#pragma mark - WEBCALL
-(void)webCallForGetReviewList{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetReview];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    [self.activity  startAnimating];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
       
        [self.activity  stopAnimating];
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
    NSArray * arrData = [dict  objectForKey:kdata];
    reviewListArray = [NSMutableArray new];
    
    for (NSDictionary *dict in arrData) {
        NSError *err;
        ReviewListModel *objVehicle = [[ReviewListModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [reviewListArray addObject:objVehicle];
        }
    }
    
    [self.tblViewReviews reloadData];
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
