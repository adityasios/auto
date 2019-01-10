//
//  Network.m
//  kazumi
//
//  Created by Yashvir on 18/11/15.
//  Copyright © 2015 Nishkrant Media. All rights reserved.
//

#import "Network.h"

@implementation Network


#pragma mark - POST REQUEST
+(void)postWebserviceWithPostRequest:(NSString* )strReq withParameters:(NSDictionary* )dictPara andCompletionHandler:(void (^)(id, NSError *))completionHandler{
    
    NSLog(@"strReq = %@",strReq);
    NSLog(@"dictPara = %@",dictPara);
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:strReq parameters:dictPara success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject = %@",responseObject);
        completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask* task, NSError* error) {
        completionHandler(nil,error);
    }];
}



@end
