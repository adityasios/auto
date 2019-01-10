//
//  FiltersVC.m
//  AutoAtlas
//
//  Created by webmazix on 11/2/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import "FiltersVC.h"

@interface FiltersVC ()

@end

@implementation FiltersVC



#pragma mark - VC LIFE CYCLE
- (void)viewDidLoad {
    [super viewDidLoad];
    [self  initMethod];
    [self viewSetUp];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    for (UIView * view in self.navigationController.view.subviews) {
        if (view.tag == 102) {
            [view  removeFromSuperview];
        }
    }
}


#pragma mark - INIT METHOD
-(void)initMethod{
    
    objGlobalValue = [GlobalValues sharedManager];
    [self setSliderDistance];
    [self  getDataFromLocal];
}




-(void)getDataFromLocal{
    
    //vehicle type
    if ([Validations  getObjectForKey:kVehicleType] != nil) {
        NSString * strJson = [Validations  getObjectForKey:kVehicleType];
        NSDictionary * dictJson = [Validations  convertJsonStringToDictionary:strJson];
        if (dictJson.count > 0) {
            NSArray * arrVendor = [dictJson objectForKey:kdata];
            if (arrVendor.count == 0) {
                [self  webcallForVehicleType];
            }else{
                [self  parsingWebcallForVehicleType:arrVendor];
            }
        }else{
            [self  webcallForVehicleType];
        }
    }else{
        [self  webcallForVehicleType];
    }
    
    
    //service type
    if ([Validations  getObjectForKey:kServiceType] != nil) {
        NSString * strJson = [Validations  getObjectForKey:kServiceType];
        NSDictionary * dictJson = [Validations  convertJsonStringToDictionary:strJson];
        if (dictJson.count > 0) {
            NSArray * arrVendor = [dictJson objectForKey:kdata];
            if (arrVendor.count == 0) {
                [self  webCallForServiceType];
            }else{
                [self  parsingWebCallForServiceType:arrVendor];
            }
        }else{
            [self  webCallForServiceType];
        }
    }else{
        [self  webCallForServiceType];
    }
}



-(void)setSliderDistance {
    
    self.sliderDistance.value = 0;
    self.sliderDistance.minimumValue = 0.0;
    self.sliderDistance.maximumValue = 80.0;
    self.sliderDistance.tintColor = UIColorFromRGB(kAutoAtlasGreen);
    
    self.lblRegion.text = [NSString  stringWithFormat:@"%d km",(int)self.sliderDistance.value];
    self.lblRegion.textColor = UIColorFromRGB(kAutoAtlasGreen);
}




#pragma mark - VIEW SET UP
-(void)viewSetUp {
    self.view.backgroundColor = UIColorFromRGB(kBackground);
    self.activityService.tintColor = UIColorFromRGB(kAutoAtlasGreen);
    self.activityVehicle.tintColor = UIColorFromRGB(kAutoAtlasGreen);
    
    [self setBtn];
    [self setLbl];
    [self setNavBar];
}



-(void)setBtn {
    
    UIButton * btnBottom = [[UIButton alloc]initWithFrame:CGRectMake(0, (self.navigationController.view.frame.origin.y)+(self.view.frame.size.height-40), self.view.frame.size.width, 40)];
    [btnBottom setTitle:@"Apply" forState:UIControlStateNormal];
    [btnBottom setTitleColor:UIColorFromRGB(kappleWhite) forState:UIControlStateNormal];
    btnBottom.backgroundColor = UIColorFromRGB(kAutoAtlasGreen);
    btnBottom.titleLabel.font = kQuicksand_Bold14;
    btnBottom.tag = 102;
    [btnBottom  addTarget:self action:@selector(btnApplyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.view addSubview:btnBottom];
}


-(void)setLbl {
    self.lblSeperator.backgroundColor = UIColorFromRGB(kappleLightGrey);
    self.lblRecommended.font = kQuicksand_Regular13;
    self.lblHighRating.font = kQuicksand_Regular13;
    self.lblRegion.font = kQuicksand_Regular13;
    
    self.lblHighRating.textColor = UIColorFromRGB(kappleGrey);
    self.lblRecommended.textColor = UIColorFromRGB(kappleGrey);
}



-(void)setNavBar {
    [self customNavTitle:@"Filters"];
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(kAutoAtlasGreen);
}


-(void)customNavTitle:(NSString *)str{
    
    UIBarButtonItem *titleBarButton = [[UIBarButtonItem alloc] init];
    [titleBarButton setTitle:str];
    
    NSDictionary * dictatt = [NSDictionary dictionaryWithObjectsAndKeys: kQuicksand_Bold14, NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName,nil];
    [titleBarButton setTitleTextAttributes:dictatt   forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItems = @[self.barBtnBack,titleBarButton];
    
    [self.barBtnRight setTitleTextAttributes:dictatt  forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItems = @[self.barBtnRight];
}






#pragma mark -  DELEGATES TABLEVIEW
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.backgroundColor = UIColorFromRGB(kBackground);
    header.textLabel.textColor = [UIColor darkGrayColor];
    header.textLabel.font = kQuicksand_Bold12;
    CGRect headerFrame = header.frame;
    header.textLabel.frame = headerFrame;
    header.textLabel.textAlignment = NSTextAlignmentLeft;
}


#pragma mark - DELEGATES COLLECTION VIEW
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == self.clctnViewServiceType) {
        return marrService.count;
    }else {
        return marrVehicleType.count;
    }
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.clctnViewServiceType) {
        
        CustomCellService * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCellService" forIndexPath:indexPath];
        ServiceTypeModel * objService = [marrService  objectAtIndex:indexPath.row];
        
        
        //name
        cell.lblServiceType.font = kQuicksand_Regular12;
        cell.lblServiceType.text = objService.service_name;
        
        //image
        cell.imgServiceType.clipsToBounds = YES;
        cell.imgServiceType.layer.cornerRadius = 20;
        cell.imgServiceType.contentMode = UIViewContentModeScaleAspectFill;
        
        //image border
        cell.imgServBorder.clipsToBounds = YES;
        cell.imgServBorder.layer.cornerRadius = 25;
        cell.imgServBorder.layer.borderWidth = 1;
        cell.imgServBorder.backgroundColor = [UIColor  whiteColor];
        if ([marrServiceSel  containsObject:indexPath]) {
            cell.lblServiceType.textColor = UIColorFromRGB(kAutoAtlasGreen);
            cell.imgServBorder.layer.borderColor = UIColorFromRGB(kAutoAtlasGreen).CGColor;
        }else{
            cell.lblServiceType.textColor = UIColorFromRGB(kappleDarkGrey);
            cell.imgServBorder.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
        }
        
        
        if (objService.service_image) {
            if (objService.image) {
                cell.imgServiceType.image = objService.image;
            }else{
                
                [cell.imgServiceType  sd_setShowActivityIndicatorView:YES];
                [cell.imgServiceType  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
                [cell.imgServiceType  sd_setImageWithURL:objService.service_image placeholderImage:kPlaceHolder_S completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    objService.image = image;
                }];
            }
        }else{
            cell.imgServiceType.image = kPlaceHolder_S;
        }
        
        
        
        
        return cell;
        
    }else{
        
        
        CustomCellVehicle * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCellVehicle" forIndexPath:indexPath];
        VehicleType * objVehicle = [marrVehicleType  objectAtIndex:indexPath.row];
        
        //name
        cell.lblVehicletype.font = kQuicksand_Regular12;
        cell.lblVehicletype.text = objVehicle.vehicle_type;
        
        //image
        cell.imgVehicleType.clipsToBounds = YES;
        cell.imgVehicleType.layer.cornerRadius = 20;
        cell.imgVehicleType.contentMode = UIViewContentModeScaleAspectFill;
        
        
        
        //image border
        cell.imgServBorder.clipsToBounds = YES;
        cell.imgServBorder.layer.cornerRadius = 25;
        cell.imgServBorder.layer.borderWidth = 1;
        cell.imgServBorder.backgroundColor = [UIColor  whiteColor];
        
        if ([marrVehicleTypeSel  containsObject:indexPath]) {
            cell.lblVehicletype.textColor = UIColorFromRGB(kAutoAtlasGreen);
            cell.imgServBorder.layer.borderColor = UIColorFromRGB(kAutoAtlasGreen).CGColor;
        }else{
            cell.lblVehicletype.textColor = UIColorFromRGB(kappleDarkGrey);
            cell.imgServBorder.layer.borderColor = UIColorFromRGB(kappleGrey).CGColor;
        }
        
        
        //vehicle image
        if (objVehicle.image) {
            if (objVehicle.imageVehicle) {
                cell.imgVehicleType.image = objVehicle.imageVehicle;
            }else{
                
                [cell.imgVehicleType  sd_setShowActivityIndicatorView:YES];
                [cell.imgVehicleType  sd_setIndicatorStyle:UIActivityIndicatorViewStyleWhite];
                [cell.imgVehicleType  sd_setImageWithURL:objVehicle.image placeholderImage:kPlaceHolder_S completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    objVehicle.imageVehicle = image;
                }];
            }
        }else{
            cell.imgVehicleType.image = kPlaceHolder_S;
        }
        
        return cell;
    }
}






- (CGFloat)collectionView:(UICollectionView *)collectionView  layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.clctnViewServiceType) {
        ServiceTypeModel * objService = [marrService  objectAtIndex:indexPath.row];
        return [self  getSizeForColCell:objService.service_name];
    }else {
        VehicleType * objVehicle = [marrVehicleType  objectAtIndex:indexPath.row];
        return  [self  getSizeForColCell:objVehicle.vehicle_type];
    }
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == self.clctnViewServiceType) {
        marrServiceSel = [NSMutableArray  new];
        [marrServiceSel  addObject:indexPath];
        [self.clctnViewServiceType  reloadData];
    }else {
        
        marrVehicleTypeSel = [NSMutableArray  new];
        [marrVehicleTypeSel  addObject:indexPath];
        [self.clctnViewVehicleType  reloadData];
    }
}








#pragma mark - ACTION METHODS
- (IBAction)barBtnBackAction:(id)sender {
    [self  dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)btnRecommedAction:(UIButton *)sender {
    if (sender.isSelected) {
        self.lblRecommended.textColor = UIColorFromRGB(kappleGrey);
        [sender  setSelected:NO];
    }else{
        self.lblRecommended.textColor = UIColorFromRGB(kAutoAtlasGreen);
        [sender  setSelected:YES];
    }
}






- (IBAction)btnRatingAction:(UIButton *)sender {
    if (sender.isSelected) {
        self.lblHighRating.textColor = UIColorFromRGB(kappleGrey);
        [sender  setSelected:NO];
    }else{
        self.lblHighRating.textColor = UIColorFromRGB(kAutoAtlasGreen);
        [sender  setSelected:YES];
    }
}


- (IBAction)btnApplyAction:(id)sender {
    [self  webcallForVendorList];
}




#pragma mark - SLIDER VALUE CHANGED
- (IBAction)sliderValueChanged:(UISlider *)sender{
    self.lblRegion.text = [NSString  stringWithFormat:@"%d km",(int)self.sliderDistance.value];
}

- (IBAction)btnBarClearClicked:(UIBarButtonItem *)sender {
    
    //recommnded
    [self.btnRecommended  setSelected:NO];
    self.lblRecommended.textColor = UIColorFromRGB(kappleGrey);
    
    //ratings
    [self.btnRating  setSelected:NO];
    self.lblHighRating.textColor = UIColorFromRGB(kappleGrey);
    
    //slider
    self.sliderDistance.value = 0;
    self.lblRegion.text = [NSString  stringWithFormat:@"%d km",(int)self.sliderDistance.value];
    
    //service type
    [marrServiceSel  removeAllObjects];
    [self.clctnViewServiceType  reloadData];
    
    //vehicle type
    [marrVehicleTypeSel  removeAllObjects];
    [self.clctnViewVehicleType  reloadData];
}



#pragma mark - WEBCALL
-(void)webCallForServiceType{
    //http://websitedevelopment101.com/autoatlas/api/settings/service_lists
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostServiceList];
    
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    
    [self.activityService  startAnimating];
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [self.activityService  stopAnimating];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                
                NSLog(@"RESULT  = %@",result);
                
                //save ServiceType Json
                NSString * strJsonService = [Validations  convertJsonDictionaryToString:result];
                if (strJsonService.length > 0) {
                    [Validations  saveObject:strJsonService ForKey:kServiceType];
                }
                
                NSArray * arrResult = [result  objectForKey:kdata];
                [self  parsingWebCallForServiceType:arrResult];
                
            } else {
                [self  showAlertWithTitle:kMessage Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:kMessage Withsubtitle:kNoBusinessDay withIndex:kIndexMaxValue];
        }
    }];
}



-(void)webcallForVehicleType{
    
    [self.activityVehicle  startAnimating];
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVehiclesTypes];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    [Network postWebserviceWithPostRequest:strPost withParameters:mdictPara andCompletionHandler:^(id result, NSError *error){
        [self.activityVehicle  stopAnimating];
        if (!error) {
            
            NSString *strStatus = [result objectForKey:kstatus];
            NSString *strMsg = [result objectForKey:kmessage];
            
            if (strStatus.integerValue == 1) {
                
                //save VehicleType Json
                NSString * strJsonVehicle = [Validations  convertJsonDictionaryToString:result];
                if (strJsonVehicle.length > 0) {
                    [Validations  saveObject:strJsonVehicle ForKey:kVehicleType];
                }
                
                NSArray * arrVendor = [result objectForKey:kdata];
                [self  parsingWebcallForVehicleType:arrVendor];
            } else {
                [self  showAlertWithTitle:kAlert Withsubtitle:strMsg withIndex:kIndexMaxValue];
            }
            
        } else {
            [self  showAlertWithTitle:kAlert Withsubtitle:error.localizedDescription withIndex:kIndexMaxValue];
        }
    }];
}



-(void)webcallForVendorList{
    
    NSString *strPost = [KBaseURL stringByAppendingString:kPostGetVendorListByLatLog];
    NSMutableDictionary *mdictPara = [NSMutableDictionary new];
    
    [mdictPara setObject:objGlobalValue.str_lat forKey:klatitude];
    [mdictPara  setObject:objGlobalValue.str_lon forKey:klongitude];
    [mdictPara  setObject:objGlobalValue.str_userid forKey:kuser_id];
    [mdictPara  setObject:kkeyValue forKey:kkey];
    
    if (self.btnRating.isSelected) {
        [mdictPara  setObject:kratings forKey:korder_by];
    }
    
    if (self.sliderDistance.value >5) {
        NSString * strSliderValue = [NSString  stringWithFormat:@"%f",self.sliderDistance.value];
        [mdictPara  setObject:strSliderValue forKey:kradius];
    }
    
    if (marrVehicleTypeSel.count > 0) {
        NSIndexPath * indexPath = [marrVehicleTypeSel  firstObject];
        VehicleType * objVehicle = [marrVehicleType  objectAtIndex:indexPath.row];
        [mdictPara  setObject:objVehicle.id forKey:kvehicletype];
    }
    
    if (marrServiceSel.count > 0) {
        NSIndexPath * indexPath = [marrServiceSel  firstObject];
        ServiceTypeModel * objService = [marrService  objectAtIndex:indexPath.row];
        [mdictPara  setObject:objService.service_id forKey:kservicetype];
    }
    
    
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



#pragma mark - WEBCALL PARSING
-(void)parsingWebCallForServiceType:(NSArray *)arrData{
    
    marrService = [NSMutableArray  new];
    
    
    for (NSDictionary *dict in arrData) {
        NSError *err;
        ServiceTypeModel * objService = [[ServiceTypeModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrService addObject:objService];
        }
    }
    [self.clctnViewServiceType  reloadData];
}



-(void)parsingWebcallForVehicleType:(NSArray *)arrVehicle{
    
    marrVehicleType = [NSMutableArray  new];
    for (NSDictionary *dict in arrVehicle) {
        NSError *err;
        VehicleType * objVehicle = [[VehicleType alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrVehicleType addObject:objVehicle];
        }
    }
    
    [self.clctnViewVehicleType  reloadData];
}



-(void)parsingWebcallForVendorList:(NSArray *)arrVendor{
    
    NSMutableArray *  marrVendors =[NSMutableArray  new];
    
    for (NSDictionary *dict in arrVendor) {
        NSError *err;
        VendorListModel *objVendor = [[VendorListModel alloc] initWithDictionary:dict error:&err];
        if (!err) {
            [marrVendors addObject:objVendor];
        }
    }
    
    //sorting based on distance
    NSArray * sortedArray = [marrVendors sortedArrayUsingComparator:^NSComparisonResult(VendorListModel * a, VendorListModel * b) {
        if (a.distance.integerValue > b.distance.integerValue) {
            return NSOrderedDescending;
        }else if (a.distance.integerValue < b.distance.integerValue) {
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    
    self.passFilterData(sortedArray);
    [self.navigationController  dismissViewControllerAnimated:YES completion:nil];
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





#pragma mark - HELPER
-(CGSize)getSizeForColCell:(NSString *)strTitle{
    CGSize sizemax = CGSizeMake(FLT_MAX, 42);
    CGRect rectDesc = [strTitle boundingRectWithSize:sizemax options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:kQuicksand_Regular12} context:nil];
    CGSize  sizeDesc = rectDesc.size;
    CGFloat wdDesc = sizeDesc.width;
    return CGSizeMake(wdDesc+50,self.clctnViewServiceType.frame.size.height);
}


/*
 self.sliderRegion.minimumValue = 0.0;
 self.sliderRegion.maximumValue = 80.0;
 self.sliderRegion.font = kQuicksand_Regular10;
 self.sliderRegion.textColor = UIColorFromRGB(kappleWhite);
 self.sliderRegion.tintColor = UIColorFromRGB(kAutoAtlasGreen);
 self.sliderRegion.popUpViewColor = UIColorFromRGB(kAutoAtlasGreen);
 self.sliderRegion.popUpViewArrowLength = 5.0;
 [self.sliderRegion setMaxFractionDigitsDisplayed:0.0];
 */






@end

