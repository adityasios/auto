//
//  VendorOffers.m
//  AutoAtlas
//
//  Created by Aditya Kumar on 1/19/18.
//  Copyright © 2018 webmazix. All rights reserved.
//

#import "VendorOffers.h"

@implementation VendorOffers

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"desc"}];
}
@end
