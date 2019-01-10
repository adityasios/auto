//
//  VehicleType.h
// aditya
//
//  Created by // aditya Kumar on 1/16/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "JSONModel.h"
@import UIKit;

@interface VehicleType : JSONModel

@property(nonatomic,strong) NSString<Optional> * vehicle_type;
@property(nonatomic,strong) NSURL<Optional> * image;
@property(nonatomic,strong) NSString<Optional> * id;
@property(nonatomic,strong) UIImage<Optional> * imageVehicle;

@end
