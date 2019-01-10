//
//  VendorDetail.h
// aditya
//
//  Created by // aditya Kumar on 1/19/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "JSONModel.h"
#import "BussinessDay.h"
#import "ServiceTypeModel.h"
#import "VendorOffers.h"
@import UIKit;



@interface VendorDetail : JSONModel

//info
@property(nonatomic,strong) NSString<Optional> * vendor_id;
@property(nonatomic,strong) NSString<Optional> * name;
@property(nonatomic,strong) NSURL<Optional> * image;
@property(nonatomic,strong) NSString<Optional> * email;
@property(nonatomic,strong) NSString<Optional> * aboutus;
@property(nonatomic,strong) NSString<Optional> * website;
@property(nonatomic,strong) UIImage<Optional> * vendor_image;
@property(nonatomic,strong) NSString<Optional> * phone_no;



//feedback
@property(nonatomic,strong) NSString<Optional> * voters;
@property(nonatomic,strong) NSString<Optional> * vendor_rating;

//is fav
@property(nonatomic,strong) NSString<Optional> * is_favourite;
@property(nonatomic,strong) NSString<Optional> * subscription_id;

//loc
@property(nonatomic,strong) NSString<Optional> * latitude;
@property(nonatomic,strong) NSString<Optional> * longitude;
@property(nonatomic,strong) NSString<Optional> * distance;
@property(nonatomic,strong) NSString<Optional> * city_id;
@property(nonatomic,strong) NSString<Optional> * country_id;


//other info
@property (nonatomic,strong) NSArray<Optional,BussinessDay> * bussiness_days;
@property (nonatomic,strong) NSArray<Optional,ServiceTypeModel> * services;
@property (nonatomic,strong) NSArray<Optional,VendorOffers> * offers;











@end

