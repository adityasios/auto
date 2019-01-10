//
//  NotModel.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 1/23/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "JSONModel.h"

@interface NotModel : JSONModel

@property(nonatomic,strong) NSString<Optional> * notification_id;
@property(nonatomic,strong) NSString<Optional> * created_on;
@property(nonatomic,strong) NSString<Optional> * notification_text;
@property(nonatomic,strong) NSString<Optional> * user_id;
@property(nonatomic,strong) NSString<Optional> * status;

@end


/*
"created_on" = "2018-03-13 17:42:32";
"notification_id" = 102;
"notification_text" = "Your Business subscription is about to expire on date 2018-03-19 00:00:00";
status = 1;
"user_id" = 138;
*/

/*
 "id": "1",
 "to_user_id": "1",
 "from_user_id": "1",
 "notification_type": "0",
 "title": "test",
 "message": "test",
 "attribute": null,
 "value": null,
 "status": "1",
 "created_at": "2018-01-17 00:00:00",
 "updated_at": "2018-01-17 00:00:00"
 */
