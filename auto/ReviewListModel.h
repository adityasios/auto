//
//  ReviewListModel.h
// aditya
//
//  Created by  on 21/02/18.
//  Copyright © . All rights reserved.
//

#import "JSONModel.h"
@import UIKit;

@interface ReviewListModel : JSONModel
@property(nonatomic,strong) UIImage<Optional> * imgProfile;
@property(nonatomic,strong) NSString<Optional> * created_on;
@property(nonatomic,strong) NSURL<Optional> * image;
@property(nonatomic,strong) NSString<Optional> * name;
@property(nonatomic,strong) NSString<Optional> * rate_star;
@property(nonatomic,strong) NSString<Optional> * review;
@property(nonatomic,strong) NSString<Optional> * review_id;
@property(nonatomic,strong) NSString<Optional> * service_id;
@property(nonatomic,strong) NSString<Optional> * status;
@property(nonatomic,strong) NSString<Optional> * user_id;
@property(nonatomic,strong) NSString<Optional> * vendor_id;
@property(nonatomic,strong) NSString<Optional> * vendor_rating;
@end





