//
//  VendorRevModel.h
// aditya
//
//  Created by // aditya Kumar on 3/15/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "JSONModel.h"
@import UIKit;

@interface VendorRevModel : JSONModel

@property(nonatomic,strong) NSString<Optional> * user_name;
@property(nonatomic,strong) NSURL<Optional> * profile_image;
@property(nonatomic,strong) NSString<Optional> * rate_star;
@property(nonatomic,strong) NSString<Optional> * review;
@property(nonatomic,strong) NSString<Optional> * created_on;
@property(nonatomic,strong) UIImage<Optional> * img_profile;

@end



/*
"created_on" = "2018-03-20 18:03:33";
"profile_image" = "http://websitedevelopment101.com/autoatlas/assets/uploads/user_images/dee452699ff0ea560ba1629073f793f9.jpg";
"rate_star" = 5;
review = yes;
"user_name" = "saurabh ";
*/



