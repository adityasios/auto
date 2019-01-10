//
//  GlobalValues.m
//  DrAhmadVendor
//
//  Created by  on 18/12/17.
//  Copyright © 2017 . All rights reserved.
//

#import "GlobalValues.h"

@implementation GlobalValues

+ (id)sharedManager{
    static id sharedManager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}

@end
