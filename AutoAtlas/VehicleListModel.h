//
//  VehicleListModel.h
//  AutoAtlas
//
//  Created by WebMazix Pro1 on 20/02/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "JSONModel.h"

@interface VehicleListModel : JSONModel

@property(nonatomic,strong) NSString<Optional> * vehicle_id;

@property(nonatomic,strong) NSString<Optional> * model_id;
@property(nonatomic,strong) NSString<Optional> * model_name;

@property(nonatomic,strong) NSString<Optional> * type_id;
@property(nonatomic,strong) NSString<Optional> * vehicle_type;

@property(nonatomic,strong) NSString<Optional> * vehicle_reg_number;

@property(nonatomic,strong) NSString<Optional> * brand_id;
@property(nonatomic,strong) NSString<Optional> * brand_name;

@property(nonatomic,strong) NSString<Optional> * vehicle_reg_year;
@property(nonatomic,strong) NSString<Optional> * registration_due_date;
@property(nonatomic,strong) NSString<Optional> * registration_due_date_expiry;

@property(nonatomic,strong) NSString<Optional> * service_date;
@property(nonatomic,strong) NSString<Optional> * service_date_expiry;

@property(nonatomic,strong) NSString<Optional> * tyre_fitment_date;
@property(nonatomic,strong) NSString<Optional> * tyre_fitment_date_expiry;

@property(nonatomic,strong) NSString<Optional> * battery_installation_date;
@property(nonatomic,strong) NSString<Optional> * battery_installation_date_expiry;

@property(nonatomic,strong) NSString<Optional> * insurance_date;
@property(nonatomic,strong) NSString<Optional> * insurance_date_expiry;

@property(nonatomic,strong) NSString<Optional> * created_on;

@property(nonatomic,strong) NSString<Optional> * average_running_per_day;


@property(nonatomic,strong) NSString<Optional> * status;
@property(nonatomic,strong) NSString<Optional> * user_id;

@end





/*

{
    data =     (
                {
                    "average_running_per_day" = 50;
                    "battery_installation_date" = "2018-03-13";
                    "battery_installation_date_expiry" = "2018-03-18 00:00:00";
                    "brand_id" = 18;
                    "brand_name" = "<null>";
                    "created_on" = "2018-03-14 18:18:29";
                    "insurance_date" = "2018-03-13";
                    "insurance_date_expiry" = "2018-03-18 00:00:00";
                    "model_id" = 14;
                    "model_name" = "swift dezire";
                    "registration_due_date" = "2018-03-13";
                    "registration_due_date_expiry" = "2018-03-18 00:00:00";
                    "service_date" = "2018-03-13";
                    "service_date_expiry" = "2018-07-15 00:00:00";
                    status = 1;
                    "type_id" = 10;
                    "tyre_fitment_date" = "2018-03-13";
                    "tyre_fitment_date_expiry" = "2018-03-18 00:00:00";
                    "user_id" = 139;
                    "vehicle_id" = 46;
                    "vehicle_reg_number" = sfshhsj123636;
                    "vehicle_reg_year" = 1995;
                    "vehicle_type" = "XUV plus plus";
                }
                );
    message = succeed;
    status = 1;
}
 
 */
