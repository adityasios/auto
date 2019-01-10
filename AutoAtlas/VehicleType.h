//
//  VehicleType.h
//  AutoAtlas
//
//  Created by Aditya Kumar on 1/16/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "JSONModel.h"
@import UIKit;

@interface VehicleType : JSONModel

@property(nonatomic,strong) NSString<Optional> * vehicle_type;
@property(nonatomic,strong) NSURL<Optional> * image;
@property(nonatomic,strong) NSString<Optional> * id;
@property(nonatomic,strong) UIImage<Optional> * imageVehicle;

@end
