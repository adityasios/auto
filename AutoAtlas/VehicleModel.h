//
//  VehicleModel.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 1/16/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "JSONModel.h"

@interface VehicleModel : JSONModel

@property(nonatomic,strong) NSString<Optional> * id;
@property(nonatomic,strong) NSString<Optional> * name;

@end
