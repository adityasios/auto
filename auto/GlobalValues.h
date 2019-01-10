//
//  GlobalValues.h
//  DrAhmadVendor
//
//  Created by  on 18/12/17.
//  Copyright © 2017 // aditya. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface GlobalValues : NSObject

@property(nonatomic,strong) UIImage * imgProfile;

@property(nonatomic,strong) NSString * str_userid;
@property(nonatomic,strong) NSString * str_FirstName;
@property(nonatomic,strong) NSString * str_LastName;
@property(nonatomic,strong) NSString * str_Email;
@property(nonatomic,strong) NSString * str_Phone;
@property(nonatomic,strong) NSString * str_Profile;
@property(nonatomic,strong) NSString * strCreated;
@property(nonatomic,strong) NSString * subscription_id;
@property(nonatomic,strong) NSString * profileImageUrl;
@property(nonatomic,strong) NSString * socialAuthId;
@property(nonatomic,strong) NSString * socialEmail;
@property(nonatomic,strong) NSString * socialAuthType;


@property(nonatomic,strong) NSString * str_lat;
@property(nonatomic,strong) NSString * str_lon;
@property(nonatomic,strong) NSString * str_UserCity;
@property(nonatomic,strong) NSString * str_UserCountry;

@property(nonatomic,strong) NSString * str_deviceId;


+ (id)sharedManager;

@end

