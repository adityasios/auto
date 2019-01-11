//
//  ListViewVC.m
// aditya
//
//  Created by // aditya on 11/1/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "ListViewVC.h"

@interface ListViewVC ()

@end

@implementation ListViewVC



#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initializer];
    [self setUpViews];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
}

#pragma mark - INIT METHOD
-(void)initializer{
    self.navigationItem.hidesBackButton = YES;
    objGlobal = [GlobalValues  sharedManager];
    [self  setTapGestureOnView];
}


-(void)setTapGestureOnView{
    UITapGestureRecognizer * tapOnList = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGestureOnListView:)];
    self.viewMap.userInteractionEnabled = YES;
    [self.viewMap addGestureRecognizer:tapOnList];
}




#pragma mark - SET UP VIEWS
-(void)setUpViews {
    [self setViews];
    [self  setNavBar];
}

-(void)setViews{
    
    self.viewFooter.backgroundColor  = UIColorFromRGB(kBackground);
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    self.tblViewShowList.backgroundColor = UIColorFromRGB(kBackground);
    
    self.viewBtm.backgroundColor = UIColorFromRGBWithAlpha(kBackground,0.5);
    /*
     //set gradient
     self.viewBtm.layer.sublayers = nil;
     self.viewBtm.backgroundColor  = UIColorFromRGBWithAlpha(kBackground, 0.5);
     CAGradientLayer *gradient = [CAGradientLayer layer];
     gradient.frame = self.viewBtm.bounds;
     gradient.colors = @[(id)UIColorFromRGBWithAlpha(kBackground,0.5).CGColor, (id)UIColorFromRGBWithAlpha(kBackground,1.0).CGColor];
     [self.viewBtm.layer insertSublayer:gradient atIndex:0];
     [self.view  setNeedsLayout];
     */
    
    
    self.viewMap.layer.cornerRadius = 20.0;
    self.viewMap.clipsToBounds = YES;
    
    self.lblMap.font = kQuicksand_Bold12;
    self.lblMap.textColor = UIColorFromRGB(kappleDarkGrey);
}



-(void)setNavBar {
    [self customNavTitle:@"Auto Atlas"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(k adityaGreen);
}


-(void)customNavTitle:(NSString *)str{
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    [titleBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: kQuicksand_Bold14, NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnMenu,titleBarButton];
}





#pragma mark - DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrListData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCellListView * cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellListView" forIndexPath:indexPath];
    
    VendorListModel *objVendor = [self.arrListData  objectAtIndex:indexPath.row];
    
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
    cell.lblName.font =  kQuicksand_Bold13;
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
    cell.lblReviews.font = kQuicksand_Regular12;
    cell.lblReviews.text = [NSString  stringWithFormat:@"%@ (%@ Reviews)",objVendor.vendor_rating,objVendor.voters];
    
    
    //dist
    cell.lblDistance.textColor = UIColorFromRGB(kappleGrey);
    cell.lblDistance.font = kQuicksand_Regular12;
    cell.lblDistance.text = [NSString  stringWithFormat:@"%ld KM away",objVendor.distance.integerValue];
    
    //timing
    cell.lblTime.textColor = UIColorFromRGB(kappleDarkGrey);
    NSDictionary * dictTitle = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(k adityaGreen),NSForegroundColorAttributeName, kQuicksand_Bold12,NSFontAttributeName,@(NSUnderlineStyleSingle),NSUnderlineStyleAttributeName,nil];
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



#pragma mark - BUTTON ACTION METHOD
- (IBAction)btnFilterClicked:(UIBarButtonItem *)sender {
    FiltersVC *filter = [self.storyboard instantiateViewControllerWithIdentifier:@"FiltersVC"];
    filter.passFilterData = ^(NSArray *arrData) {
        self.arrListData = [[NSArray  alloc]initWithArray:arrData];
        [self.tblViewShowList  reloadData];
    };
    
    UINavigationController * nav = [[UINavigationController  alloc]initWithRootViewController:filter];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}


#pragma mark - SEL ACTION METHOD
-(IBAction)viewServicesAction:(UIButton *)sender {
    CGPoint buttonPosition =  [sender convertPoint:CGPointZero toView:self.tblViewShowList];
    NSIndexPath *indexPath = [self.tblViewShowList indexPathForRowAtPoint:buttonPosition];
    VendorListModel * objVendorList = [self.arrListData  objectAtIndex:indexPath.row];
    
    ProfileVC *profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
    profileVC.passFavUnFav = ^(NSInteger intType, NSInteger index) {
        objVendorList.is_favourite = [NSString  stringWithFormat:@"%ld",intType];
        [self.tblViewShowList reloadData];
    };
    profileVC.objVendorList = objVendorList;
    [self.navigationController pushViewController:profileVC animated:YES];
}



#pragma mark - TAP GESTURE ACTION
- (void)tapGestureOnListView:(UITapGestureRecognizer *)recognizer{
    self.passData(self.arrListData);
    [self.navigationController  popViewControllerAnimated:NO];
}


-(void)tapGestureFav:(UITapGestureRecognizer *)gesture{
    
    CGPoint buttonPosition = [gesture.view convertPoint:CGPointZero toView:self.tblViewShowList];
    NSIndexPath *indexPath = [self.tblViewShowList indexPathForRowAtPoint:buttonPosition];
    VendorListModel * objVendor = [self.arrListData  objectAtIndex:indexPath.row];
    CustomCellListView * tcell = (CustomCellListView *)[self.tblViewShowList cellForRowAtIndexPath:indexPath];
    tcell.imgVFav.userInteractionEnabled = NO;
    
    
    if (objVendor.is_favourite.integerValue == 1) {
        
        objVendor.is_favourite = @"0";
        tcell.imgVFav.image = kUnFavImg;
        [self  webcallForVendorFavUnFav:indexPath WithType:Unfav];
        
    }else{
        
        objVendor.is_favourite = @"1";
        tcell.imgVFav.image = kFavImg;
        [self  webcallForVendorFavUnFav:indexPath WithType:fav];
    }
}





-(void)tapGestureCheckAvailability:(UITapGestureRecognizer *)gesture{
    CGPoint buttonPosition = [gesture.view convertPoint:CGPointZero toView:self.tblViewShowList];
    NSIndexPath *indexPath = [self.tblViewShowList indexPathForRowAtPoint:buttonPosition];
    
    VendorListModel * objVendor = [self.arrListData  objectAtIndex:indexPath.row];
    if (objVendor.bussiness_days.count == 0) {
        [self  showAlertWithTitle:kMessage Withsubtitle:kNoBusinessDay withIndex:kIndexMaxValue];
    }else{
        [self  presentAvailabilityVC:objVendor];
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



#pragma mark - WEBCALL
-(void)webcallForVendorFavUnFav:(NSIndexPath *)indexPath WithType:(SelFavType)type{
    
    VendorListModel * objVendor = [self.arrListData  objectAtIndex:indexPath.row];
    CustomCellListView * tcell = (CustomCellListView *)[self.tblViewShowList cellForRowAtIndexPath:indexPath];
    
    
    NSString *strPost;
    if (type == fav) {
        strPost = [KBaseURL stringByAppendingString:kPostMarkFav];
    }else if (type == Unfav){
        strPost = [KBaseURL stringByAppendingString:kPostMarkUnFav];
    }
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:objVendor.vendor_id forKey:kvendor_id];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        tcell.imgVFav.userInteractionEnabled = YES;
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
            } else {
                [BasicUtility  showToastinView:self.view WithDesc:strMsg];
                [self  resetFavUnFavImage:indexPath WithType:type];
            }
        } else {
            [BasicUtility  showToastinView:self.view WithDesc:error.localizedDescription];
            [self  resetFavUnFavImage:indexPath WithType:type];
        }
    }];
}


-(void)resetFavUnFavImage:(NSIndexPath *)indexPath WithType:(SelFavType)type{
    VendorListModel * objVendor = [self.arrListData  objectAtIndex:indexPath.row];
    if (type == fav) {
        objVendor.is_favourite = @"0";
    }else{
        objVendor.is_favourite = @"1";
    }
    
    [self.tblViewShowList  reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
