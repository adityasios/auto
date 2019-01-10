//
//  ServiceTypeModel.h
// aditya
//
//  Created by // aditya Kumar on 1/18/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "JSONModel.h"
@import UIKit;


@protocol ServiceTypeModel;
@interface ServiceTypeModel : JSONModel

@property(nonatomic,strong) NSString<Optional> * service_id;
@property(nonatomic,strong) NSString<Optional> * service_name;

@property(nonatomic,strong) NSURL<Optional> * service_image;
@property(nonatomic,strong) UIImage<Optional> * image;

@end



