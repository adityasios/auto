//
//  FiltersVC.h
// aditya
//
//  Created by // aditya on 11/2/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "BasicUtility.h"
#import "WebServiceConstant.h"
#import "AlertConst.h"
#import "Validations.h"
#import "GlobalValues.h"

//web constant
#import "Network.h"

//model
#import "ServiceTypeModel.h"
#import "VehicleType.h"
#import "VendorListModel.h"


//3rd party
#import <SDWebImage/UIImageView+WebCache.h>
#import  <UIView+WebCache.h>
#import "UIImageView+WebCache.h"

//custom cell
#import "CustomCellVehicle.h"
#import "CustomCellService.h"


@interface FiltersVC : UITableViewController <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
    
    GlobalValues * objGlobalValue;
    
    NSMutableArray * marrService;
    NSMutableArray * marrServiceSel;
    
    NSMutableArray * marrVehicleType;
    NSMutableArray * marrVehicleTypeSel;
}

@property (nonatomic, copy)void(^passFilterData)(NSArray * arrData);


@property (strong, nonatomic) IBOutlet UILabel *lblSeperator;
@property (strong, nonatomic) IBOutlet UILabel *lblRecommended;
@property (strong, nonatomic) IBOutlet UILabel *lblHighRating;
@property (strong, nonatomic) IBOutlet UILabel *lblRegion;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnRight;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnBack;

@property (strong, nonatomic) IBOutlet UIButton * btnRating;
@property (strong, nonatomic) IBOutlet UIButton * btnRecommended;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView * activityService;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView * activityVehicle;

@property (strong, nonatomic) IBOutlet UICollectionView *clctnViewServiceType;
@property (strong, nonatomic) IBOutlet UICollectionView *clctnViewVehicleType;

@property (nonatomic,strong) IBOutlet UISlider * sliderDistance;


- (IBAction)barBtnBackAction:(id)sender;
- (IBAction)btnRecommedAction:(id)sender;
- (IBAction)btnRatingAction:(id)sender;
- (IBAction)btnBarClearClicked:(UIBarButtonItem *)sender;
- (IBAction)sliderValueChanged:(UISlider *)sender;



-(void)initMethod;
-(void)getDataFromLocal;

-(void)viewSetUp;
-(void)setBtn;
-(void)setLbl;
-(void)setNavBar;
-(void)customNavTitle:(NSString *)str;

-(void)setSliderDistance;

-(void)webCallForServiceType;
-(void)webcallForVehicleType;
-(void)webcallForVendorList;

-(void)parsingWebCallForServiceType:(NSArray *)arrData;
-(void)parsingWebcallForVehicleType:(NSArray *)arrVehicle;
-(void)parsingWebcallForVendorList:(NSArray *)arrVendor;



@end
