//
//  BussinessDay.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 1/17/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "JSONModel.h"



@protocol BussinessDay;

@interface BussinessDay : JSONModel
@property(nonatomic,strong) NSString<Optional> * close_time;
@property(nonatomic,strong) NSString<Optional> * open_time;
@property(nonatomic,strong) NSString<Optional> * day;

@end

