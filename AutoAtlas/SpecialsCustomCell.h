//
//  SpecialsCustomCell.h
//  AutoAtlas
//
//  Created by webmazix on 11/3/17.
//  Copyright © 2017 webmazix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialsCustomCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgDiscount;
@property (strong, nonatomic) IBOutlet UILabel *lblDiscountDesc;
@property (strong, nonatomic) IBOutlet UILabel *lblDiscountValidity;

@end
