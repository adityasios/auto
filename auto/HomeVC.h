//
//  HomeVC.h
// aditya
//
//  Created by // aditya Kumar on 11/1/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;
@import Firebase;
@import FirebaseInstanceID;
//constant
#import "Constant.h"
#import "Macros.h"
#import "Validations.h"
#import "DejalActivityView.h"
#import "GlobalValues.h"
#import "AlertConst.h"

//model
#import "VendorListModel.h"

//other
#import "LeftMenuVC.h"
#import "ListViewVC.h"
#import "FiltersVC.h"
#import "ProfileVC.h"
#import "AddNewVehicle.h"
#import "ProfileVC.h"
#import "AvailabilityVC.h"
#import "HomeAnnotation.h"




//custom cell
#import "CustomCellHome.h"

//Network
#import "WebServiceConstant.h"
#import "Network.h"
#import "Reachability.h"
#import "BasicUtility.h"


typedef enum
{
    UnFav = 1,
    Fav,
} SelType;



@interface HomeVC : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,MKMapViewDelegate,UICollectionViewDataSourcePrefetching>{
    NSMutableArray * marrVendors;
    
    NSInteger intRegDeviceTimerCount;
    NSMutableArray * marrMap;
    GlobalValues* objGlobal;
}


@property (strong, nonatomic) IBOutlet MKMapView * mapView;
@property (strong, nonatomic) IBOutlet UICollectionView *clctnViewBottom;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnMenu;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *barButtonFilter;

@property (strong, nonatomic) IBOutlet UIView * viewList;
@property (strong, nonatomic) IBOutlet UILabel * lblList;



- (IBAction)barButtonFilterAction:(id)sender;

-(void)initializer;
-(void)setTapGestureOnView;

-(void)viewSetup;
-(void)setView;
-(void)setNavBar;
-(void)customNavTitle:(NSString *)str;
-(void)zoomToCurrentLocation;

-(void)webcallForVendorList;
-(void)webcallForVendorFavUnFav:(NSIndexPath *)indexPath WithType:(SelType)type;

-(void)parsingWebcallForVendorList:(NSArray *)arrVendor;
-(void)resetFavUnFavImage:(NSIndexPath *)indexPath WithType:(SelType)type;
-(void)setMapAnnotation;

-(void)presentAvailabilityVC:(VendorListModel *)objVendor;

@end
