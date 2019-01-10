//
//  CustomCellHome.h
//  AutoAtlas
//
//  Created by webmazix on 11/1/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellHome : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIView *viewContent;
@property (strong, nonatomic) IBOutlet UIView * viewBtnServices;

@property (strong, nonatomic) IBOutlet UIImageView * imgViewService;
@property (strong, nonatomic) IBOutlet UIImageView * imgVFav;

@property (strong, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UILabel *lblReviews;
@property (strong, nonatomic) IBOutlet UILabel *lblDistance;
@property (strong, nonatomic) IBOutlet UILabel *lblTimings;


@property (strong, nonatomic) IBOutlet UIButton *btnViewServices;
@property (strong, nonatomic) IBOutlet UIButton *btnSelectDate;
@property (strong, nonatomic) IBOutlet UIButton * btnStar;






@end
