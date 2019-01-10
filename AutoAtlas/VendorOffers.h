//
//  VendorOffers.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 1/19/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "JSONModel.h"
#import "JSONKeyMapper.h"

@protocol VendorOffers;
@interface VendorOffers : JSONModel

@property(nonatomic,strong) NSString<Optional> * id;
@property(nonatomic,strong) NSString<Optional> * vendor_id;
@property(nonatomic,strong) NSString<Optional> * title;
@property(nonatomic,strong) NSString<Optional> * desc;
@property(nonatomic,strong) NSString<Optional> * valid_from;
@property(nonatomic,strong) NSString<Optional> * valid_to;

@end



/*
 "id": "1",
 "vendor_id": "5",
 "title": "test",
 "description": "test",
 "valid_from": "2018-01-15",
 "valid_to": "2018-01-16",
 "status": "1",
 "created_at": null,
 "updated_at": null
 */


