//
//  ListViewVC.h
//  AutoAtlas
//
//  Created by webmazix on 11/1/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "GlobalValues.h"

//other
#import "CustomCellListView.h"

//other
#import "FiltersVC.h"
#import "HomeVC.h"
#import "ProfileVC.h"
#import "AvailabilityVC.h"

typedef enum
{
    Unfav = 1,
    fav,
} SelFavType;



@interface ListViewVC : UIViewController <UITableViewDelegate, UITableViewDataSource>{
     GlobalValues* objGlobal;
}

@property (nonatomic, copy)void(^passData)(NSArray * arrData);
@property (strong, nonatomic) NSArray * arrListData;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *barBtnMenu;

@property (strong, nonatomic) IBOutlet UITableView *tblViewShowList;

@property (strong, nonatomic) IBOutlet UIView * viewFooter;
@property (strong, nonatomic) IBOutlet UIView * viewBtm;
@property (strong, nonatomic) IBOutlet UIView * viewMap;
@property (strong, nonatomic) IBOutlet UILabel * lblMap;

- (IBAction)btnFilterClicked:(UIBarButtonItem *)sender;






-(void)initializer;

-(void)setUpViews;
-(void)setTapGestureOnView;

-(void)setViews;
-(void)setNavBar;
-(void)customNavTitle:(NSString *)str;


-(void)webcallForVendorFavUnFav:(NSIndexPath *)indexPath WithType:(SelFavType)type;
-(void)resetFavUnFavImage:(NSIndexPath *)indexPath WithType:(SelFavType)type;

@end
