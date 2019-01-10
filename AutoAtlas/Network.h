//
//  Network.h
//  kazumi
//
//  Created by Yashvir on 18/11/15.
//  Copyright © 2015 Nishkrant Media. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"



@interface Network : NSObject

+(void)postWebserviceWithPostRequest:(NSString* )strReq withParameters:(NSDictionary* )dictPara andCompletionHandler:(void (^)(id, NSError *))completionHandler;

@end
