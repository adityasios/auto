//
//  MyFavoritesVC.m
// aditya
//
//  Created by // aditya on 11/27/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "MyFavoritesVC.h"

@interface MyFavoritesVC ()

@end

@implementation MyFavoritesVC



#pragma mark -  VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializer];
    [self setUpViews];
    if ([BasicUtility  isInternetAvailable]) {
        [self   webcallForFavVendorList:true];
    }else{
        [self  showAlertWithTitle:kNotNetAvailable Withsubtitle:kInternetError withIndex:kIndexMaxValue];
    }
    
}


#pragma mark -  INIT METHOD
-(void)initializer{
    objGlobalValue = [GlobalValues  sharedManager];
}


#pragma mark -  VIEW SET UP
-(void)setUpViews{
    
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    self.tblViewMyav.backgroundColor = [UIColor  clearColor];
   
    //fav
    self.lblFav.textColor = UIColorFromRGB(kappleGrey);
    self.lblFav.font = kQuicksand_Regular14;
    [self.viewBg  setHidden:YES];
    
    [self customNav:@"My Favourite"];
    [self  addRefreshControl];
}



-(void)customNav:(NSString *)str{
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kQuicksand_Bold14, NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil]  forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.btnBack,titleBarButton];
}

-(void)addRefreshControl{
    refresh = [[UIRefreshControl alloc]init];
    refresh.tintColor = UIColorFromRGB(k adityaGreen);
    [self.tblViewMyav addSubview:refresh];
    [refresh addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];
}





/*
 key:8dfafb41e9b4c0b3decd875e7a231049
 latitude:12.777
 longitude:12.666
 vendor_id:5
 user_id:1
 */


#pragma mark -  WEBCALL
-(void)webcallForFavVendorList:(BOOL)isloader{
    
    isWebcallInProg = TRUE;
    NSString *strPost = [KBaseURL stringByAppendingString:kPostVendorFavList];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara setObject:objGlobalValue.str_lat forKey:klatitude];
    [mdictPara  setObject:objGlobalValue.str_lon forKey:klongitude];
    [mdictPara  setObject:objGlobalValue.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    if (isloader) {
        [BasicUtility  showLoaderInView:self.view];
    }
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        isWebcallInProg = FALSE;
        if (isloader) {
            [BasicUtility  hideLoaderInView:self.view];
        }else{
            [refresh  endRefreshing];
        }
        
        if (!error) {
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                [self.viewBg  setHidden:YES];
                NSArray * arrVendor = [result objectForKey:kdata];
                [self  parsingWebcallForFavVendorList:arrVendor];
            } else {
                [self.viewBg  setHidden:NO];
                //[self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}




-(void)webcallForVendorUnFav:(NSIndexPath *)indexPath{
    
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
    [marrVendors  removeObjectAtIndex:indexPath.row];
    [self.tblViewMyav  reloadData];
    
    if (marrVendors.count == 0) {
        [self.viewBg  setHidden:NO];
    }
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostMarkUnFav];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objVendor.vendor_id forKey:kvendor_id];
    [mdictPara  setObject:objGlobalValue.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                NSLog(@"FAV result = %@",result);
            } else {
                [marrVendors  addObject:objVendor];
                [self.tblViewMyav  reloadData];
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [marrVendors  addObject:objVendor];
            [self.tblViewMyav  reloadData];
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}

















#pragma mark -  PARSING WEBCALL
-(void)parsingWebcallForFavVendorList:(NSArray *)arrVendor{
    NSLog(@"arrVendor = %@",arrVendor);
    marrVendors =[NSMutableArray  new];
    
    for (NSDictionary *dict in arrVendor) {
        NSError *err;
        VendorListModel *objVendor = [[VendorListModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrVendors addObject:objVendor];
        }
    }
    [self.tblViewMyav  reloadData];
}






#pragma mark - DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return marrVendors.count;
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCellListView * cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellListView" forIndexPath:indexPath];
    
    VendorListModel *objVendor = [marrVendors  objectAtIndex:indexPath.row];
    cell.backgroundColor = UIColorFromRGB(kBackground);
    
    
    //bg view
    cell.viewContent.layer.cornerRadius = 4.0f;
    cell.viewContent.layer.borderWidth = 1.0f;
    cell.viewContent.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.viewContent.clipsToBounds = YES;
    
    //imgV
    cell.imgPlace.contentMode = UIViewContentModeScaleAspectFill;
    cell.imgPlace.clipsToBounds = YES;
    cell.imgPlace.layer.cornerRadius = 4;
    
    if (objVendor.image) {
        if (objVendor.imgProfile) {
            cell.imgPlace.image = objVendor.imgProfile;
        }else{
            [cell.imgPlace  sd_setShowActivityIndicatorView:YES];
            [cell.imgPlace  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [cell.imgPlace  sd_setImageWithURL:objVendor.image placeholderImage:kPlaceHolder_M completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                objVendor.imgProfile = image;
            }];
        }
    }else{
        cell.imgPlace.image = kPlaceHolder_M;
    }
    
    
    
    //name
    cell.lblName.font =  kQuicksand_Bold12;
    cell.lblName.textColor = [UIColor blackColor];
    cell.lblName.text = objVendor.name.capitalizedString;
    
    //star
    if (objVendor.vendor_rating.integerValue == 0) {
        [cell.btnStar  setSelected:NO];
    }else{
        [cell.btnStar  setSelected:YES];
    }
    
    //fav
    cell.imgVFav.userInteractionEnabled = YES;
    if (objVendor.is_favourite.integerValue == 0) {
        cell.imgVFav.image = kUnFavImg;
    }else{
        cell.imgVFav.image = kFavImg;
    }
    
    UITapGestureRecognizer * tapGestureFav = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGestureFav:)];
    tapGestureFav.numberOfTapsRequired = 1;
    cell.imgVFav.userInteractionEnabled = YES;
    [cell.imgVFav addGestureRecognizer:tapGestureFav];
    
    
    
    
    
    //rating
    cell.lblReviews.textColor = UIColorFromRGB(kappleGrey);
    cell.lblReviews.font = kQuicksand_Regular10;
    cell.lblReviews.text = [NSString  stringWithFormat:@"%@ (%@ Reviews)",objVendor.vendor_rating,objVendor.voters];
    
    
    //dist
    cell.lblDistance.textColor = UIColorFromRGB(kappleGrey);
    cell.lblDistance.font = kQuicksand_Regular10;
    cell.lblDistance.text = [NSString  stringWithFormat:@"%ld KM away",objVendor.distance.integerValue];
    
    //timing
    cell.lblTime.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblTime.font = kQuicksand_Regular10;
    NSDictionary * dictTitle = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(k adityaGreen),NSForegroundColorAttributeName, kQuicksand_Bold10,NSFontAttributeName,@(NSUnderlineStyleSingle),NSUnderlineStyleAttributeName,nil];
    NSAttributedString * strCheck = [[NSAttributedString  alloc] initWithString:[NSString  stringWithFormat:@"Check Availability"] attributes:dictTitle];
    cell.lblTime.attributedText = strCheck;
    
    
    UITapGestureRecognizer * tapGestureCheck = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGestureCheckAvailability:)];
    tapGestureCheck.numberOfTapsRequired = 1;
    cell.lblTime.userInteractionEnabled = YES;
    [cell.lblTime addGestureRecognizer:tapGestureCheck];
    
    
    //services
    cell.viewBtnServices.layer.cornerRadius =10.0;
    cell.viewBtnServices.backgroundColor = UIColorFromRGB(k adityaGreen);
    
    [cell.btnViewServices addTarget:self action:@selector(viewServicesAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnViewServices.titleLabel.font = kQuicksand_Bold10;
    [cell.btnViewServices setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
}



#pragma mark -  BUTTON ACTION
- (IBAction)barBtnBackAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - SEL ACTION METHOD
-(IBAction)viewServicesAction:(UIButton *)sender {
    CGPoint buttonPosition =  [sender convertPoint:CGPointZero toView:self.tblViewMyav];
    NSIndexPath *indexPath = [self.tblViewMyav indexPathForRowAtPoint:buttonPosition];
    UIStoryboard * story = [UIStoryboard  storyboardWithName:@"Profile" bundle:nil];
    ProfileVC *profileVC = [story instantiateViewControllerWithIdentifier:@"ProfileVC"];
    profileVC.objVendorList = [marrVendors  objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:profileVC animated:YES];
}



-(void)refreshTable{
    NSLog(@"refreshTable");
    if (!isWebcallInProg) {
        if ([BasicUtility  isInternetAvailable]) {
            [self   webcallForFavVendorList:false];
        }else{
            [refresh  endRefreshing];
        }
    }
}




#pragma mark -  TAP GESTURE SELECTOR
-(void)tapGestureCheckAvailability:(UITapGestureRecognizer *)gesture{
    CGPoint buttonPosition = [gesture.view convertPoint:CGPointZero toView:self.tblViewMyav];
    NSIndexPath *indexPath = [self.tblViewMyav indexPathForRowAtPoint:buttonPosition];
    
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
    if (objVendor.bussiness_days.count == 0) {
        [self  showAlertWithTitle:kMessage Withsubtitle:kNoBusinessDay withIndex:kIndexMaxValue];
    }else{
        [self  presentAvailabilityVC:objVendor];
    }
}


-(void)tapGestureFav:(UITapGestureRecognizer *)gesture{
    
    CGPoint buttonPosition = [gesture.view convertPoint:CGPointZero toView:self.tblViewMyav];
    NSIndexPath *indexPath = [self.tblViewMyav indexPathForRowAtPoint:buttonPosition];
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
    if (objVendor.is_favourite.integerValue == 1) {
        [self  webcallForVendorUnFav:indexPath];
    }
}









#pragma mark - PRESENT VC
-(void)presentAvailabilityVC:(VendorListModel *)objVendor{
    AvailabilityVC * availVC = [[AvailabilityVC alloc] initWithNibName:@"AvailabilityVC" bundle:nil];
    availVC.arrDataPass = objVendor.bussiness_days;
    
    [availVC setPopinTransitionStyle:BKTPopinTransitionStyleSpringySlide];
    [availVC setPopinOptions:BKTPopinDefault];
    [availVC  setPopinAlignment:BKTPopinAlignementOptionCentered];
    
    availVC.view.clipsToBounds = YES;
    availVC.view.layer.cornerRadius = 4;
    
    //BLUR BG
    BKTBlurParameters *blurParameters = [BKTBlurParameters new];
    blurParameters.alpha = 1.0f;
    blurParameters.radius = 8.0f;
    blurParameters.saturationDeltaFactor = 1.8f;
    blurParameters.tintColor = [UIColor colorWithRed:0.966 green:0.851 blue:0.038 alpha:0.2];
    [availVC setBlurParameters:blurParameters];
    [availVC setPreferedPopinContentSize:CGSizeMake(SCREEN_WIDTH*0.8,350)];
    
    
    
    //Set popin transition direction
    [availVC setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [self.navigationController presentPopinController:availVC animated:YES completion:^{
        NSLog(@"Popin presented !");
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

