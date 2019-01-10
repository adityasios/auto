//
//  VendorOffers.m
// aditya
//
//  Created by // aditya Kumar on 1/19/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "VendorOffers.h"

@implementation VendorOffers

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"desc"}];
}
@end
