//
//  CustomCellListView.h
// aditya
//
//  Created by // aditya on 11/1/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellListView : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *viewContent;
@property (strong, nonatomic) IBOutlet UIView *viewBtnServices;

@property (strong, nonatomic) IBOutlet UIImageView *imgPlace;
@property (strong, nonatomic) IBOutlet UIImageView * imgVFav;

@property (strong, nonatomic) IBOutlet UILabel * lblName;
@property (strong, nonatomic) IBOutlet UILabel * lblReviews;
@property (strong, nonatomic) IBOutlet UILabel * lblDistance;
@property (strong, nonatomic) IBOutlet UILabel * lblTime;


@property (strong, nonatomic) IBOutlet UIButton * btnViewServices;
@property (strong, nonatomic) IBOutlet UIButton * btnStar;



@end

