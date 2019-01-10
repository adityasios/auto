//
//  TransListModel.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 3/5/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "JSONModel.h"

@interface TransListModel : JSONModel

@property(nonatomic,strong) NSString<Optional> * txn_id;
@property(nonatomic,strong) NSString<Optional> * subscription_name;
@property(nonatomic,strong) NSString<Optional> * created_on;
@property(nonatomic,strong) NSString<Optional> * paid_amount;
@property(nonatomic,strong) NSString<Optional> * payment_response;
@property(nonatomic,strong) NSString<Optional> * payment_status;



@end



/*

{
    "created_on" = "2018-03-06 20:03:57";
    "device_type" = IOS;
    "paid_amount" = "1.99";
    "payment_response" = "<null>";
    "payment_status" = 1;
    status = 0;
    "subscription_name" = "Individual Plus";
    subscriptionplanid = 5;
    "txn_id" = 1000000381029862;
    "user_id" = 110;
    "usp_id" = 67;
},
*/
