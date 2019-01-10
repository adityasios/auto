//
//  ProfileVC.m
//  AutoAtlas
//
//  Created by webmazix on 11/3/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "ProfileVC.h"

@interface ProfileVC ()
@end
@implementation ProfileVC



#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self viewSetUp];
    self.view.backgroundColor = UIColorFromRGB(kBackground);
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    for (UIView * view in self.navigationController.view.subviews) {
        if (view.tag == 101) {
            [view  removeFromSuperview];
        }
    }
}




#pragma mark - INIT METHOD
-(void)initMethod{
    objGlobalValue = [GlobalValues sharedManager];
    
    self.tableView.estimatedRowHeight = 45;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    if ([BasicUtility  isInternetAvailable]) {
        [self   webcallForVendorDetail];
    }else{
        [self  showAlertWithTitle:kNotNetAvailable Withsubtitle:kInternetError withIndex:kIndexMaxValue];
    }
}




#pragma mark - VIEW SET UP
-(void)viewSetUp {
    
    [self setLbl];
    [self setBtn];
    [self  setImageView];
    [self setViews];
    [self setNavBar];
}


-(void)setLbl {
    
    //name
    self.lblVendorName.font = kQuicksand_Regular15;
    self.lblVendorName.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblVendorName.text = self.objVendorList.name.capitalizedString;
    
    //star
    if (self.objVendorList.vendor_rating.integerValue == 0) {
        [self.btnStar  setSelected:NO];
    }else{
        [self.btnStar  setSelected:YES];
    }
    
    //rating
    self.lblRating.textColor = UIColorFromRGB(kappleGrey);
    self.lblRating.font = kQuicksand_Regular12;
    self.lblRating.text = [NSString  stringWithFormat:@"%@ (%@ Reviews)",self.objVendorList.vendor_rating,self.objVendorList.voters];
    
    //dist
    self.lbldistance.textColor = UIColorFromRGB(kappleGrey);
    self.lbldistance.font = kQuicksand_Regular12;
    self.lbldistance.text = [NSString  stringWithFormat:@"%ld KM away",(long)self.objVendorList.distance.integerValue];
    
    //email
    self.lblEmail.font = kQuicksand_Regular12;
    self.lblEmail.text = self.objVendorList.email;
    
    NSDictionary * dictEmail = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(kBlue),NSForegroundColorAttributeName, kQuicksand_Bold12,NSFontAttributeName,@(NSUnderlineStyleSingle),NSUnderlineStyleAttributeName,nil];
    NSAttributedString * strEmail = [[NSAttributedString  alloc] initWithString:self.objVendorList.email attributes:dictEmail];
    self.lblEmail.attributedText = strEmail;
    UITapGestureRecognizer * tapOnEmail = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGestureOnEmail:)];
    self.lblEmail.userInteractionEnabled = YES;
    [self.lblEmail addGestureRecognizer:tapOnEmail];
    
    
    
    //phone
    self.lblPhone.textColor = UIColorFromRGB(kappleGrey);
    self.lblPhone.font = kQuicksand_Regular12;
    self.lblPhone.text = @"N/A";
    
    
    
   
    
    //website
    NSDictionary * dictTitle = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(kBlue),NSForegroundColorAttributeName, kQuicksand_Bold12,NSFontAttributeName,@(NSUnderlineStyleSingle),NSUnderlineStyleAttributeName,nil];
    NSAttributedString * strCheck = [[NSAttributedString  alloc] initWithString:self.objVendorList.website attributes:dictTitle];
    self.lblWeb.attributedText = strCheck;
    
    UITapGestureRecognizer * tapOnWeb = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapGestureOnWebSite:)];
    self.lblWeb.userInteractionEnabled = YES;
    [self.lblWeb addGestureRecognizer:tapOnWeb];

    
    //aboutus
    self.lblAboutUs.textColor = UIColorFromRGB(kappleBlack);
    self.lblAboutUs.font = kQuicksand_Bold14;
    self.lblAboutUs.text = @"About Us";
    
    //text
    self.lblAboutUsText.textColor = UIColorFromRGB(kappleGrey);
    self.lblAboutUsText.font = kQuicksand_Regular13;
    self.lblAboutUsText.text = self.objVendorList.aboutus;
    self.lblAboutUsText.numberOfLines = 0;
    
    //availability
    self.lblAvailability.textColor = UIColorFromRGB(kappleBlack);
    self.lblAvailability.font = kQuicksand_Bold14;
    self.lblAvailability.text = @"Availability";
    
    
    //check availability
    NSDictionary * dictCheck = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(kAutoAtlasGreen),NSForegroundColorAttributeName, kQuicksand_Bold14,NSFontAttributeName,@(NSUnderlineStyleSingle),NSUnderlineStyleAttributeName,nil];
    NSAttributedString * Check = [[NSAttributedString  alloc] initWithString:[NSString  stringWithFormat:@"Check Availability"] attributes:dictCheck];
    self.lblCheckAvailability.attributedText = Check;
    
    
    //services
    self.lblServices.textColor = UIColorFromRGB(kappleBlack);
    self.lblServices.font = kQuicksand_Bold14;
    self.lblServices.text = @"Services";
    
    
    
    //special
    self.lblSpecial.textColor = UIColorFromRGB(kappleBlack);
    self.lblSpecial.font = kQuicksand_Bold14;
    self.lblSpecial.text = @"Specials";
    
    
    //offer1
    self.lblOffer1Title.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblOffer1Title.font = kQuicksand_Bold13;
    
    self.lblOffer1Valid.textColor = UIColorFromRGB(kappleGrey);
    self.lblOffer1Valid.font = kQuicksand_Regular12;
    
    
    //offer2
    self.lblOffer2Title.textColor = UIColorFromRGB(kAutoAtlasGreen);
    self.lblOffer2Title.font = kQuicksand_Bold13;
    
    self.lblOffer2Valid.textColor = UIColorFromRGB(kappleGrey);
    self.lblOffer2Valid.font = kQuicksand_Regular12;
    
    
    //rating
    self.lblReviews.textColor = UIColorFromRGB(kappleGrey);
    self.lblReviews.font = kQuicksand_Regular13;
    self.lblReviews.text = [NSString  stringWithFormat:@"%@ Reviews",self.objVendorList.voters];
    
    self.viewStar.minimumValue = 0;
    self.viewStar.maximumValue = 5;
    self.viewStar.userInteractionEnabled = NO;
    self.viewStar.value = self.objVendorList.vendor_rating.integerValue;
    self.viewStar.tintColor = UIColorFromRGB(kYellow);
}


-(void)setViews {
}


-(void)setBtn {
    
    //fav
    if (self.objVendorList.is_favourite.integerValue == 1) {
        [self.btnFav  setSelected:YES];
    }else{
        [self.btnFav  setSelected:NO];
    }
    
    
    //share
    UIButton * btnBottom = [[UIButton alloc]initWithFrame:CGRectMake(0, (self.navigationController.view.frame.origin.y)+(self.view.frame.size.height-40), self.view.frame.size.width, 40)];
    [btnBottom setTitle:@"Share Your Feedback" forState:UIControlStateNormal];
    [btnBottom setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    [btnBottom addTarget:self action:@selector(btnBottomClicked:) forControlEvents:UIControlEventTouchUpInside];
    btnBottom.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    btnBottom.titleLabel.font = kQuicksand_Bold14;
    btnBottom.tag = 101;
    [self.navigationController.view addSubview:btnBottom];
}


-(void)setImageView{
    
    //imgV
    self.imgVVendor.contentMode = UIViewContentModeScaleAspectFill;
    self.imgVVendor.clipsToBounds = YES;
    
    
    if (self.objVendorList.image) {
        if (self.objVendorList.imgProfile) {
            self.imgVVendor.image = self.objVendorList.imgProfile;
        }else{
            [self.imgVVendor  sd_setShowActivityIndicatorView:YES];
            [self.imgVVendor  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [self.imgVVendor  sd_setImageWithURL:self.objVendorList.image placeholderImage:kPlaceHolder_M completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                self.objVendorList.imgProfile = image;
            }];
        }
    }else{
        self.imgVVendor.image = kPlaceHolder_M;
    }
    
    
    //imgV mta
    self.imgVMTA.hidden = YES;
}


-(void)setNavBar {
    [self customNavTitle:self.objVendorList.name.capitalizedString];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(kAutoAtlasGreen);
}


-(void)customNavTitle:(NSString *)str{
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    
    NSDictionary * dictAttr = [NSDictionary dictionaryWithObjectsAndKeys: kQuicksand_Bold14, NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName,
                               nil];
    [titleBarButton setTitleTextAttributes:dictAttr forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnBack,titleBarButton];
}



#pragma mark - SET WEB DATA
-(void)setVendorDetailWebData:(VendorDetail*)objVendorDetail{
    
    //mta image
    if (objVendorDetail.subscription_id.integerValue <= 1) {
        self.imgVMTA.hidden = YES;
    }else{
        self.imgVMTA.hidden = NO;
    }
    
    
    //phone no
    if (objVendorDetail.phone_no.length > 2) {
        self.lblPhone.text = objVendorDetail.phone_no;
    }
    
    //vendor rating
    self.lblRating.text = [NSString  stringWithFormat:@"%@ (%@ Reviews)",objVendorDetail.vendor_rating,objVendorDetail.voters];
    self.lblReviews.text = [NSString  stringWithFormat:@"%@ Reviews",objVendorDetail.voters];
    self.viewStar.value = objVendorDetail.vendor_rating.integerValue;
    
    NSLog(@"DETAIL COUNT = %ld",objVendorDetail.offers.count);
    if (objVendorDetail.offers.count > 0) {
        [self.tableView  reloadData];
        [self  setOfferData];
    }
}


-(void)setOfferData{
    
    VendorOffers * objOfffer = [objVendorDetail.offers  objectAtIndex:0];
    self.lblOffer1Title.text = objOfffer.title;
    self.lblOffer1Valid.text =  [NSString  stringWithFormat:@"Valid till %@",objOfffer.valid_to];
    
    if (objVendorDetail.offers.count > 1) {
        objOfffer = [objVendorDetail.offers  objectAtIndex:1];
        self.lblOffer2Title.text = objOfffer.title;
        self.lblOffer2Valid.text =  [NSString  stringWithFormat:@"Valid till %@",objOfffer.valid_to];
    }
}






#pragma mark - DELEGATE AND DATA SOURCE
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  objVendorDetail.services.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ServicesCustomCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServicesCustomCell" forIndexPath:indexPath];
    ServiceTypeModel * objServiceType = [objVendorDetail.services objectAtIndex:indexPath.row];
    
    
    //imgV Grid
    cell.imgServiceGrid.contentMode = UIViewContentModeScaleAspectFill;
    cell.imgServiceGrid.clipsToBounds = YES;
    cell.imgServiceGrid.layer.cornerRadius = 25;
    cell.imgServiceGrid.layer.borderWidth = 1;
    cell.imgServiceGrid.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
    
    
    //imgV Service
    cell.imgServiceType.contentMode = UIViewContentModeScaleAspectFill;
    cell.imgServiceType.clipsToBounds = YES;
    cell.imgServiceType.layer.cornerRadius = 20;
    cell.imgServiceType.layer.borderWidth = 1;
    cell.imgServiceType.layer.borderColor = UIColorFromRGB(kAutoAtlasGreen).CGColor;
    
    
    if (objServiceType.service_image) {
        if (objServiceType.image) {
            cell.imgServiceType.image = objServiceType.image;
        }else{
            [cell.imgServiceType  sd_setShowActivityIndicatorView:YES];
            [cell.imgServiceType  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            [cell.imgServiceType  sd_setImageWithURL:objServiceType.service_image placeholderImage:kPlaceHolder_M completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                objServiceType.image = image;
            }];
        }
    }else{
        cell.imgServiceType.image = kPlaceHolder_M;
    }
    
    //name
    cell.lblNameSrvcType.font = kQuicksand_Regular11;
    cell.lblNameSrvcType.textColor = UIColorFromRGB(kappleDarkGrey);
    cell.lblNameSrvcType.text = objServiceType.service_name.capitalizedString;
    
    return cell;
}



- (CGFloat)collectionView:(UICollectionView *)collectionView  layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 8;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    ServiceTypeModel * objServiceType = [objVendorDetail.services objectAtIndex:indexPath.row];
    return  [self getSizeForColCell:objServiceType.service_name.capitalizedString];
}


#pragma mark - TABLEVIEW DELEGATE
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 7;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 2;
    }else if (section == 3){
        if (objVendorDetail.offers.count == 0) {
            return 0;
        }else{
            return objVendorDetail.offers.count + 1;
        }
    }else if (section == 4){
        return 1;
    }
    return 0;
}











-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 20;
        }else if (indexPath.row < 6 ) {
            return 30;
        }else{
            return UITableViewAutomaticDimension;
        }
    }else if (indexPath.section == 1) {
        return 45;
    }else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 20;
        }else  {
            return 80;
        }
    }else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            return 20;
        }else  {
            return 70;
        }
    }else if (indexPath.section == 4) {
        return 50;
    }
    return 0;
}


- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.backgroundColor = UIColorFromRGB(kBackground);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else if (section == 1){
        return 20;
    }else if (section == 2){
        return 20;
    }else if (section == 3){
        return 20;
    }else if (section == 4){
        return 20;
    }
    return 0;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"sec = %ld",indexPath.section);
    NSLog(@"row = %ld",indexPath.row);
    
    if (indexPath.section == 0 && indexPath.row == 4) {
        
        NSURL * url = [NSURL  URLWithString:self.objVendorList.website];
        if (url && url.scheme && url.host) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        }else{
            [self  showAlertWithTitle:kMessage Withsubtitle:kInValidUrl withIndex:kIndexMaxValue];
        }
    }else if (indexPath.section == 1){
        if (self.objVendorList.bussiness_days.count == 0) {
            [self  showAlertWithTitle:kMessage Withsubtitle:kNoBusinessDay withIndex:kIndexMaxValue];
        }else{
            [self  presentAvailabilityVC:self.objVendorList];
        }
    }else if (indexPath.section == 4 && indexPath.row == 0){
        VendorRev *reviewsVC = [[VendorRev alloc]initWithNibName:@"VendorRev" bundle:nil];
        reviewsVC.objVendorList = self.objVendorList;
        reviewsVC.passNavBtn = ^(NSInteger intType) {
            [self  setBtn];
        };
        [self.navigationController  pushViewController:reviewsVC animated:YES];
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






#pragma mark - ACTION METHOD
- (IBAction)barBtnBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



- (IBAction)btnShareAction:(id)sender{
    NSString * title =[NSString stringWithFormat:@"%@\n%@",self.objVendorList.name,self.objVendorList.website];
    NSArray* dataToShare = @[title];
    UIActivityViewController* activityViewController =[[UIActivityViewController alloc] initWithActivityItems:dataToShare applicationActivities:nil];
    activityViewController.excludedActivityTypes = @[UIActivityTypeAirDrop];
    [self presentViewController:activityViewController animated:YES completion:^{}];
}


- (IBAction)btnPhoneAction:(id)sender{
    if (objVendorDetail.phone_no.length > 2) {
        NSString *phoneNumber = [@"tel://" stringByAppendingString:objVendorDetail.phone_no];
        [[UIApplication  sharedApplication]  openURL:[NSURL URLWithString:phoneNumber] options:@{} completionHandler:nil];
    }else{
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoPhoneNo withIndex:kIndexMaxValue];
    }
}


- (IBAction)btnLocAction:(id)sender{
    
    NSString* directionsURL = [NSString stringWithFormat:@"http://maps.apple.com/?saddr=%f,%f&daddr=%f,%f",objGlobalValue.str_lat.floatValue, objGlobalValue.str_lon.floatValue, self.objVendorList.latitude.floatValue, self.objVendorList.longitude.floatValue];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL] options:@{} completionHandler:^(BOOL success) {}];
    
    /*
     NSString* directionsURL = [NSString stringWithFormat:@"https://www.google.com/maps/dir/?api=1&origin=Current+Location&destination=%f,%f&travelmode=driving",self.objVendorList.latitude.floatValue,self.objVendorList.longitude.floatValue];
     directionsURL = [directionsURL stringByReplacingOccurrencesOfString:@" " withString:@""];
     NSLog(@"directionsURL = %@",directionsURL);
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString: directionsURL] options:@{} completionHandler:^(BOOL success) {}];
     */
}






- (IBAction)btnFavAction:(id)sender{
    
    if (self.objVendorList.is_favourite.integerValue == 1) {
        self.objVendorList.is_favourite = @"0";
        [self.btnFav  setSelected:NO];
        [self.btnFav setUserInteractionEnabled:NO];
        [self  webcallForVendorFavUnFavWithType:kUnFav];
    }else{
        self.objVendorList.is_favourite = @"1";
        [self.btnFav  setSelected:YES];
        [self.btnFav setUserInteractionEnabled:NO];
        [self  webcallForVendorFavUnFavWithType:kFav];
    }
}






#pragma mark - SELECTOR ACTION METHOD
-(void)btnBottomClicked:(id)sender {
    
    if (objVendorDetail.services.count ==0) {
        [self  showAlertWithTitle:kAlert Withsubtitle:kNoServiceFound withIndex:kIndexMaxValue];
    }else{
        [self  setServicePicker:sender];
    }
}




- (void)tapGestureOnWebSite:(UITapGestureRecognizer *)recognizer{
    NSURL * url = [NSURL  URLWithString:self.objVendorList.website];
    if (url && url.scheme && url.host) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }else{
        [self  showAlertWithTitle:kMessage Withsubtitle:kInValidUrl withIndex:kIndexMaxValue];
    }
}

- (void)tapGestureOnEmail:(UITapGestureRecognizer *)recognizer{
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *composeViewController = [[MFMailComposeViewController alloc] initWithNibName:nil bundle:nil];
        [composeViewController setMailComposeDelegate:self];
        [composeViewController setToRecipients:@[self.objVendorList.email]];
        NSString * strSupport = [NSString  stringWithFormat:@"%@",self.objVendorList.name];
        [composeViewController setSubject:strSupport];
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}














/*
 http://websitedevelopment101.com/autoatlas/api/vendor/vendor-details
 key:8dfafb41e9b4c0b3decd875e7a231049
 latitude:12.777
 longitude:12.666
 vendor_id:5
 user_id:1
 */


#pragma mark - WEBCALL
-(void)webcallForVendorDetail{
    NSString *strPost = [KBaseURL stringByAppendingString:kPostVendorDetail];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara setObject:objGlobalValue.str_lat forKey:klatitude];
    [mdictPara  setObject:objGlobalValue.str_lon forKey:klongitude];
    [mdictPara  setObject:objGlobalValue.str_userid forKey:kuser_id];
    [mdictPara  setObject:self.objVendorList.vendor_id forKey:kvendor_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
    [BasicUtility  showLoaderInView:self.view];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [BasicUtility  hideLoaderInView:self.view];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                NSDictionary * dictData = [result objectForKey:kdata];
                NSError * err;
                objVendorDetail = [[VendorDetail alloc]initWithDictionary:dictData error:&err];
                if (!err) {
                    [self  setVendorDetailWebData:objVendorDetail];
                    [self.colView  reloadData];
                    
                    
                }
            }else{
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}



-(void)webcallForVendorFavUnFavWithType:(NSInteger)type{
    
    NSString *strPost;
    if (type == kFav) {
        strPost = [KBaseURL stringByAppendingString:kPostMarkFav];
    }else if (type == kUnFav){
        strPost = [KBaseURL stringByAppendingString:kPostMarkUnFav];
    }
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:self.objVendorList.vendor_id forKey:kvendor_id];
    [mdictPara  setObject:objGlobalValue.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [self.btnFav setUserInteractionEnabled:YES];
        if (!error) {
            NSString * strstatus = [result objectForKey:kstatus];
            NSString * strMsg = [result objectForKey:kmessage];
            if (strstatus.integerValue == 1) {
                if (type == kFav) {
                    self.passFavUnFav(kFav,0);
                }else if (type == kUnFav){
                    self.passFavUnFav(kUnFav,0);
                }
            } else {
                [BasicUtility  showToastinView:self.view WithDesc:strMsg];
                [self  resetFavUnFavImageWithType:type];
            }
        } else {
            [BasicUtility  showToastinView:self.view WithDesc:error.localizedDescription];
            [self  resetFavUnFavImageWithType:type];
        }
    }];
}



#pragma mark - MAIL DELEGATE
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    if (error) {
        [self  showAlertWithTitle:kError Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - HELPER METHOD
-(void)resetFavUnFavImageWithType:(NSInteger)type{
    if (type == kFav) {
        self.objVendorList.is_favourite = @"0";
        [self.btnFav  setSelected:NO];
    }else if (type == kUnFav){
        self.objVendorList.is_favourite = @"1";
        [self.btnFav  setSelected:YES];
    }
}



-(CGSize)getSizeForColCell:(NSString *)strTitle{
    CGSize sizemax = CGSizeMake(FLT_MAX, 42);
    CGRect rectDesc = [strTitle boundingRectWithSize:sizemax options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kQuicksand_Regular12} context:nil];
    CGSize  sizeDesc = rectDesc.size;
    CGFloat wdDesc = sizeDesc.width;
    return CGSizeMake(wdDesc+50,self.colView.frame.size.height);
}


-(void)setServicePicker:(id)sender{
    NSArray * arrService = [objVendorDetail.services  valueForKey:@"service_name"];
    
    ActionSheetStringPicker * picker = [[ActionSheetStringPicker alloc] initWithTitle:@"Select Service For Review" rows:arrService initialSelection:0 doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        NSLog(@"selectedValue = %@",(NSString *)selectedValue);
        ServiceTypeModel * objServiceType = [objVendorDetail.services objectAtIndex:selectedIndex];
        [self  showSubmitReview:objServiceType];
    }cancelBlock:^(ActionSheetStringPicker *picker) {
        NSLog(@"Block Picker Canceled");
    }origin:sender];
    
    UIButton * btnCancel =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnCancel setFrame:CGRectMake(0, 0, 32, 32)];
    [btnCancel  setTitle:@"Cancel" forState:UIControlStateNormal];
    [btnCancel setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [picker setCancelButton:[[UIBarButtonItem alloc] initWithCustomView:btnCancel]];
    
    UIButton * btnDone =  [UIButton buttonWithType:UIButtonTypeCustom];
    [btnDone setFrame:CGRectMake(0, 0, 32, 32)];
    [btnDone  setTitle:@"Done" forState:UIControlStateNormal];
    [btnDone setTitleColor:UIColorFromRGB(kAutoAtlasGreen) forState:UIControlStateNormal];
    [picker  setDoneButton:[[UIBarButtonItem alloc] initWithCustomView:btnDone]];
    [picker showActionSheetPicker];
}








-(void)showSubmitReview:(ServiceTypeModel *)objService{
    SubmitReviews1 *popin = [[SubmitReviews1 alloc] initWithNibName:@"SubmitReviews1" bundle:nil];
    popin.objVendorDetail = objVendorDetail;
    popin.objVendorList = self.objVendorList;
    popin.objServiceType = objService;
    popin.passSubmitReview = ^(NSInteger index) {
        if (index == 1) {
            [self   webcallForVendorDetail];
        }
    };
    
    [popin setPreferedPopinContentSize:CGSizeMake(SCREEN_WIDTH*.8, SCREEN_HEIGHT*.7)];
    popin.view.layer.cornerRadius = 2;
    popin.view.clipsToBounds = YES;
    
    [popin setPopinTransitionDirection:BKTPopinTransitionDirectionTop];
    [self.navigationController presentPopinController:popin animated:YES completion:^{
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

