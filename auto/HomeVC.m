//
//  HomeVC.m
// aditya
//
//  Created by // aditya Kumar on 11/1/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import "HomeVC.h"


@interface HomeVC ()

@end

@implementation HomeVC

#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initializer];
    [self  viewSetup];
    if ([BasicUtility  isInternetAvailable]) {
        [self   webcallForVendorList];
    }else{
        [self  showAlertWithTitle:kNotNetAvailable Withsubtitle:kInternetError withIndex:kIndexMaxValue];
    }
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self  zoomToCurrentLocation];
}



#pragma mark - INIT METHOD
-(void)initializer{
    objGlobal = [GlobalValues sharedManager];
    [self  setTapGestureOnView];
}




-(void)setTapGestureOnView{
    UITapGestureRecognizer * tapOnList = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGestureOnListView:)];
    self.viewList.userInteractionEnabled = YES;
    [self.viewList addGestureRecognizer:tapOnList];
}

#pragma mark - VIEW SET UP
-(void)viewSetup {
    
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    self.clctnViewBottom.backgroundColor = UIColorFromRGB(kBackground);
    self.mapView.backgroundColor = UIColorFromRGB(kBackground);
    
    [self  setView];
    [self setNavBar];
}


-(void)setView{
    self.viewList.layer.cornerRadius = 20.0;
    self.viewList.clipsToBounds = YES;
    
    self.lblList.font = kQuicksand_Bold12;
    self.lblList.textColor = UIColorFromRGB(kappleDarkGrey);
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



#pragma mark - WEBCALL
-(void)webcallForVendorList{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVendorListByLatLog];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara setObject:objGlobal.str_lat forKey:klatitude];
    [mdictPara  setObject:objGlobal.str_lon forKey:klongitude];
    [mdictPara  setObject:objGlobal.str_userid forKey:kuser_id];
    
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    [BasicUtility  showLoaderInView:self.view];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                NSArray * arrVendor = [result objectForKey:kdata];
                [self  parsingWebcallForVendorList:arrVendor];
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}





-(void)webcallForVendorFavUnFav:(NSIndexPath *)indexPath WithType:(SelType)type{
    
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
    CustomCellHome * tcell = (CustomCellHome *)[self.clctnViewBottom cellForItemAtIndexPath:indexPath];
    
    
    NSString *strPost;
    if (type == Fav) {
        strPost = [KBaseURL stringByAppendingString:kPostMarkFav];
    }else if (type == UnFav){
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




#pragma mark - WEBCALL PARSING
-(void)parsingWebcallForVendorList:(NSArray *)arrVendor{
    
    NSMutableArray *  marrVendorsTemp =[NSMutableArray  new];
    
    for (NSDictionary *dict in arrVendor) {
        NSError *err;
        VendorListModel *objVendor = [[VendorListModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrVendorsTemp addObject:objVendor];
        }
    }
    
    
    //sorting based on distance
    NSArray * sortedArray = [marrVendorsTemp sortedArrayUsingComparator:^NSComparisonResult(VendorListModel * a, VendorListModel * b) {
        if (a.distance.integerValue > b.distance.integerValue) {
            return NSOrderedDescending;
        }else if (a.distance.integerValue < b.distance.integerValue) {
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    marrVendors = [NSMutableArray  arrayWithArray:sortedArray];
    [self.clctnViewBottom reloadData];
    [self  setMapAnnotation];
}



-(void)setMapAnnotation{
    marrMap = [[NSMutableArray  alloc] initWithObjects:@"anot1",@"anot2",@"anot3", nil];
    for (VendorListModel *objVendor in marrVendors) {
        MKPointAnnotation * anot1 = [[MKPointAnnotation alloc] init];
        anot1.coordinate = CLLocationCoordinate2DMake(objVendor.latitude.floatValue, objVendor.longitude.floatValue);
        anot1.title = objVendor.name;
        [self.mapView addAnnotation:anot1];
    }
}


-(void)resetFavUnFavImage:(NSIndexPath *)indexPath WithType:(SelType)type{
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
    if (type == Fav) {
        objVendor.is_favourite = @"0";
    }else{
        objVendor.is_favourite = @"1";
    }
    [self.clctnViewBottom  reloadItemsAtIndexPaths:@[indexPath]];
}



#pragma mark - DELEGATES COLLECTION VIEW
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return marrVendors.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCellHome *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCellHome" forIndexPath:indexPath];
    
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
    
    //bg view
    /*
     cell.viewContent.layer.cornerRadius = 4.0f;
     cell.viewContent.layer.borderWidth = 1.0f;
     cell.viewContent.layer.borderColor = [UIColor lightGrayColor].CGColor;
     cell.viewContent.clipsToBounds = YES;
     */
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:cell.viewContent.bounds];
        cell.viewContent.layer.masksToBounds = NO;
        cell.viewContent.layer.shadowColor = [UIColor blackColor].CGColor;
        cell.viewContent.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
        cell.viewContent.layer.shadowOpacity = 0.5f;
        cell.viewContent.layer.shadowPath = shadowPath.CGPath;
    });
    
    //imgV
    cell.imgViewService.contentMode = UIViewContentModeScaleAspectFill;
    cell.imgViewService.clipsToBounds = YES;
    cell.imgViewService.layer.cornerRadius = 4;
    
    if (objVendor.image) {
        if (objVendor.imgProfile) {
            cell.imgViewService.image = objVendor.imgProfile;
        }else{
            [cell.imgViewService  sd_setShowActivityIndicatorView:YES];
            [cell.imgViewService  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [cell.imgViewService  sd_setImageWithURL:objVendor.image placeholderImage:kPlaceHolder_M completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                objVendor.imgProfile = image;
            }];
        }
    }else{
        cell.imgViewService.image = kPlaceHolder_M;
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
    cell.lblTimings.textColor = UIColorFromRGB(kappleDarkGrey);
    NSDictionary * dictTitle = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(k adityaGreen),NSForegroundColorAttributeName, kQuicksand_Bold12,NSFontAttributeName,@(NSUnderlineStyleSingle),NSUnderlineStyleAttributeName,nil];
    NSAttributedString * strCheck = [[NSAttributedString  alloc] initWithString:[NSString  stringWithFormat:@"Check Availability"] attributes:dictTitle];
    cell.lblTimings.attributedText = strCheck;
    
    
    UITapGestureRecognizer * tapGestureCheck = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGestureCheckAvailability:)];
    tapGestureCheck.numberOfTapsRequired = 1;
    cell.lblTimings.userInteractionEnabled = YES;
    [cell.lblTimings addGestureRecognizer:tapGestureCheck];
    
    
    
    //services
    cell.viewBtnServices.layer.cornerRadius =10.0;
    cell.viewBtnServices.backgroundColor = UIColorFromRGB(k adityaGreen);
    
    [cell.btnViewServices addTarget:self action:@selector(viewServicesAction:) forControlEvents:UIControlEventTouchUpInside];
    cell.btnViewServices.titleLabel.font = kQuicksand_Bold10;
    [cell.btnViewServices setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    
    return cell;
}




-(void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    NSLog(@"prefetchItemsAtIndexPaths indexPaths = %ld",indexPaths.count);
}


-(void)collectionView:(UICollectionView *)collectionView cancelPrefetchingForItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    NSLog(@"cancelPrefetchingForItemsAtIndexPaths indexPaths = %ld",indexPaths.count);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView  layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 8;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}



-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return  CGSizeMake(SCREEN_WIDTH*0.9, self.clctnViewBottom.frame.size.height);
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    /*
     
     ProfileVC *profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
     [self.navigationController pushViewController:profileVC animated:YES];
     */
}



#pragma mark - DELEGATE MAP
- (void)zoomToCurrentLocation{
    float spanX = 0.00725;
    float spanY = 0.00725;
    MKCoordinateRegion region;
    region.center.latitude = objGlobal.str_lat.floatValue;
    region.center.longitude = objGlobal.str_lon.floatValue;
    region.span.latitudeDelta = spanX;
    region.span.longitudeDelta = spanY;
    [self.mapView setRegion:region animated:YES];
}






- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    if ([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    if ([annotation isKindOfClass:[MKPointAnnotation class]]){
        
        MKAnnotationView *pinView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        
        if (!pinView){
            
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            
            //NSInteger intrand =  arc4random_uniform(3);
            //NSString * str_img = [marrMap objectAtIndex:intrand];
            //pinView.image = [UIImage imageNamed:str_img];
            pinView.calloutOffset = CGPointMake(0,0);
            
            
            // Add a detail disclosure button to the callout.
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.rightCalloutAccessoryView = rightButton;
            
            // Add an image to the left callout.
            UIImageView * iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
            [marrVendors  enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                VendorListModel * objVendorList = (VendorListModel *)obj;
                
                if ([objVendorList.name isEqualToString:annotation.title]) {
                    NSLog(@"title = %@",annotation.title);
                    if (objVendorList.image) {
                        
                        if (objVendorList.imgProfile) {
                            iconView.image = objVendorList.imgProfile;
                            UIImage * imgPro = [BasicUtility imageWithImage:objVendorList.imgProfile scaledToSize:CGSizeMake(30,30)];
                            UIImage * imgFinal = [BasicUtility  maskImage:imgPro withMask:[UIImage  imageNamed:@"annot"]];
                            //UIImage * imgFinal = [BasicUtility  maskImage:[UIImage  imageNamed:@"circle"] withMask:imgPro];
                            pinView.image = imgFinal;
                            
                        }else{
                            
                            [iconView  sd_setShowActivityIndicatorView:YES];
                            [iconView  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
                            [iconView  sd_setImageWithURL:objVendorList.image placeholderImage:kPlaceHolder_M completed:^(UIImage* _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                objVendorList.imgProfile = image;
                                UIImage * imgPro = [BasicUtility imageWithImage:image scaledToSize:CGSizeMake(30,30)];
                                UIImage * imgFinal = [BasicUtility  maskImage:imgPro withMask:[UIImage  imageNamed:@"annot"]];
                                //UIImage * imgFinal = [BasicUtility  maskImage:[UIImage  imageNamed:@"circle"] withMask:imgPro];
                                pinView.image =  imgFinal;
                            }];
                        }
                    }else{
                        
                        iconView.image = kPlaceHolder_M;
                        pinView.image = [UIImage  imageNamed:@"pin_marker"];
                    }
                    pinView.leftCalloutAccessoryView = iconView;
                }
            }];
            
        }else{
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}



-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    id <MKAnnotation> annotation = [view annotation];
    if ([annotation isKindOfClass:[MKPointAnnotation class]]){
        
        __block  NSInteger intIndex = -1;
        
        [marrVendors  enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            VendorListModel * objVendorList = (VendorListModel *)obj;
            if ([objVendorList.name isEqualToString:annotation.title]) {
                intIndex = idx;
                *stop = TRUE;
                return;
            }
        }];
        
        
        if (intIndex >= 0) {
            VendorListModel * objVendorList = [marrVendors  objectAtIndex:intIndex];
            ProfileVC *profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
            profileVC.passFavUnFav = ^(NSInteger intType, NSInteger index) {
                objVendorList.is_favourite = [NSString  stringWithFormat:@"%ld",intType];
                [self.clctnViewBottom reloadData];
            };
            profileVC.objVendorList = objVendorList;
            [self.navigationController pushViewController:profileVC animated:YES];
        }
    }
}













#pragma mark - BUTTON ACTIONS
- (IBAction)barButtonFilterAction:(id)sender {
    FiltersVC *filter = [self.storyboard instantiateViewControllerWithIdentifier:@"FiltersVC"];
    filter.passFilterData = ^(NSArray *arrData) {
        marrVendors = [[NSMutableArray  alloc]initWithArray:arrData];
        [self.clctnViewBottom  reloadData];
    };
    
    UINavigationController * nav = [[UINavigationController  alloc]initWithRootViewController:filter];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}



-(void)viewServicesAction:(UIButton *)sender {
    CGPoint buttonPosition =  [sender convertPoint:CGPointZero toView:self.clctnViewBottom];
    NSIndexPath *indexPath = [self.clctnViewBottom indexPathForItemAtPoint:buttonPosition];
    VendorListModel * objVendorList = [marrVendors  objectAtIndex:indexPath.row];
    
    ProfileVC *profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVC"];
    profileVC.passFavUnFav = ^(NSInteger intType, NSInteger index) {
        objVendorList.is_favourite = [NSString  stringWithFormat:@"%ld",intType];
        [self.clctnViewBottom reloadData];
    };
    profileVC.objVendorList = objVendorList;
    [self.navigationController pushViewController:profileVC animated:YES];
}




#pragma mark - SELECTOR ACTION
- (void)tapGestureOnListView:(UITapGestureRecognizer *)recognizer{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Profile" bundle:nil];
    ListViewVC *listVC = [storyBoard instantiateViewControllerWithIdentifier:@"ListViewVC"];
    listVC.arrListData = marrVendors;
    listVC.passData = ^(NSArray *arrData) {
        marrVendors = [NSMutableArray  arrayWithArray:arrData];
        [self.clctnViewBottom reloadData];
    };
    [self.navigationController pushViewController:listVC animated:NO];
}



#pragma mark - TAP GESTURE SELECTOR
-(void)tapGestureFav:(UITapGestureRecognizer *)gesture{
    
    CGPoint buttonPosition = [gesture.view convertPoint:CGPointZero toView:self.clctnViewBottom];
    NSIndexPath *indexPath = [self.clctnViewBottom indexPathForItemAtPoint:buttonPosition];
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
    CustomCellHome * tcell = (CustomCellHome *)[self.clctnViewBottom cellForItemAtIndexPath:indexPath];
    tcell.imgVFav.userInteractionEnabled = NO;
    
    if (objVendor.is_favourite.integerValue == 1) {
        
        objVendor.is_favourite = @"0";
        tcell.imgVFav.image = kUnFavImg;
        [self  webcallForVendorFavUnFav:indexPath WithType:UnFav];
        
    }else{
        
        objVendor.is_favourite = @"1";
        tcell.imgVFav.image = kFavImg;
        [self  webcallForVendorFavUnFav:indexPath WithType:Fav];
    }
}



-(void)tapGestureCheckAvailability:(UITapGestureRecognizer *)gesture{
    CGPoint buttonPosition = [gesture.view convertPoint:CGPointZero toView:self.clctnViewBottom];
    NSIndexPath *indexPath = [self.clctnViewBottom indexPathForItemAtPoint:buttonPosition];
    VendorListModel * objVendor = [marrVendors  objectAtIndex:indexPath.row];
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










