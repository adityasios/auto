//
//  MyFavoritesVC.h
//  AutoAtlas
//
//  Created by webmazix on 11/27/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

//constant
#import "Constant.h"
#import "Macros.h"
#import "GlobalValues.h"
//custom cell
#import "CustomCellListView.h"
//model
#import "VendorListModel.h"
//other
#import "ProfileVC.h"




@interface MyFavoritesVC : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    GlobalValues * objGlobalValue;
    NSMutableArray * marrVendors;
    UIRefreshControl * refresh;
    
    BOOL isWebcallInProg;
}

@property (strong, nonatomic) IBOutlet UIView * viewBg;
@property (strong, nonatomic) IBOutlet UIImageView * imgVFav;
@property (strong, nonatomic) IBOutlet UILabel * lblFav;

@property (strong, nonatomic) IBOutlet UITableView *tblViewMyav;
@property (strong, nonatomic) IBOutlet UIBarButtonItem * btnBack;


-(void)initializer;


-(void)setUpViews;
-(void)customNav:(NSString *)str;
-(void)addRefreshControl;


-(void)webcallForFavVendorList:(BOOL)isloader;
-(void)webcallForVendorUnFav:(NSIndexPath *)indexPath;

-(void)parsingWebcallForFavVendorList:(NSArray *)arrVendor;

- (IBAction)barBtnBackAction:(id)sender;

@end

