//
//  SubscriptionListModel.h
// aditya
//
//  Created by  Pro1 on 22/02/18.
//  Copyright © 2018 . All rights reserved.
//

#import "JSONModel.h"

@interface SubscriptionListModel : JSONModel

@property(nonatomic,strong) NSString<Optional> * apple_id;
@property(nonatomic,strong) NSString<Optional> * google_id;

@property(nonatomic,strong) NSString<Optional> * subscription_id;
@property(nonatomic,strong) NSString<Optional> * subscription_name;

@property(nonatomic,strong) NSString<Optional> * price;
@property(nonatomic,strong) NSString<Optional> * vehicle_allowed;

@property(nonatomic,strong) NSString<Optional> * renewal_type;
@property(nonatomic,strong) NSString<Optional> * renewal_type_text;





@end


/*
apple_id" = "<null>";
google_id" = "<null>";
subscription_id" = 3;
subscription_name" = premium;
price = "1000.00";
vehicle_allowed" = 50;
renewal_type" = 365;
renewal_type_text" = "1 years";
*/




