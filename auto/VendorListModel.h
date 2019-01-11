//
//  VendorListModel.h
// aditya
//
//  Created by // aditya on 1/8/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
#import "JSONModel.h"
#import "BussinessDay.h"

@interface VendorListModel : JSONModel




//info
@property(nonatomic,strong) NSString<Optional> * vendor_id;
@property(nonatomic,strong) NSString<Optional> * name;
@property(nonatomic,strong) NSString<Optional> * aboutus;
@property(nonatomic,strong) NSString<Optional> * status;
@property(nonatomic,strong) NSString<Optional> * parent_id;
@property(nonatomic,strong) NSString<Optional> * total_branch;
@property(nonatomic,strong) NSString<Optional> * used_branch;

@property(nonatomic,strong) NSURL<Optional> * image;
@property(nonatomic,strong) UIImage<Optional> * imgProfile;

//fav
@property(nonatomic,strong) NSString<Optional> * is_favourite;
@property(nonatomic,strong) NSString<Optional> * vendor_rating;
@property(nonatomic,strong) NSString<Optional> * voters;

//contact - info
@property(nonatomic,strong) NSString<Optional> * email;
@property(nonatomic,strong) NSString<Optional> * website;

//loc - info
@property(nonatomic,strong) NSString<Optional> * distance;
@property(nonatomic,strong) NSString<Optional> * latitude;
@property(nonatomic,strong) NSString<Optional> * longitude;
@property(nonatomic,strong) NSString<Optional> * city_id;
@property(nonatomic,strong) NSString<Optional> * country_id;


//other - info
@property(nonatomic,strong) NSString<Optional> * created_on;
@property (nonatomic) NSArray<Optional,BussinessDay> * bussiness_days;






/*
aboutus = hello;
"bussiness_days" =             (
                                
{
    "close_time" = "00:00:09";
    day = Monday;
    "open_time" = "06:00:00";
},
                                {
                                    "close_time" = "00:00:09";
                                    day = Tuesday;
                                    "open_time" = "06:00:00";
                                },
                                {
                                    "close_time" = "00:00:09";
                                    day = Wednesday;
                                    "open_time" = "06:00:00";
                                },
                                {
                                    "close_time" = "00:00:09";
                                    day = Thirsday;
                                    "open_time" = "06:00:00";
                                },
                                {
                                    "close_time" = "00:00:09";
                                    day = Friday;
                                    "open_time" = "06:00:00";
                                }
                                
                                
                                
                                
                                
                                
                                
                                
                                );
"city_id" = 2;
"country_id" = 1;
"created_on" = "2018-03-08 12:53:02";
distance = "5121.185992522363";
email = "sangam@abc.com";
"expired_at" = "<null>";
hash = "<null>";

"is_favourite" = 0;
latitude = "23.45";
longitude = "23.44";
name = "sangam motors";
"parent_id" = 0;
password = "<null>";
status = 1;
"subscription_id" = "<null>";
"subscription_notification_id" = "<null>";
token = "<null>";
"total_branch" = "<null>";
"used_branch" = "<null>";
"vendor_id" = 33;
"vendor_rating" = 0;
voters = 0;
website = "www.sangam.com";

*/








@end











