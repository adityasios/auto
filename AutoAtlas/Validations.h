//
//  Validations.h
//  Snic View
//
//  Created by Yashvir on 01/03/16.
//  Copyright © 2016 wry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "Macros.h"

@import UIKit;


@interface Validations : NSObject

+(NSString*)removeWhiteSpace:(NSString*)str;
+(NSString*)removeDoubleSpace:(NSString *)str;
+(BOOL) isValidEmail:(NSString *)checkString;
+(BOOL) isObjectNull:(id)obj;
+(void)saveObject:(id)object    ForKey:(NSString*)str;
+(NSString*)getObjectForKey:(NSString*)str;
+(BOOL)getBoolForKey:(NSString*)str;
+(void)resetAllUserDefaults;
+(void)removeObjectForKey:(NSString *)str;
+(BOOL)isThereCapitalAlphabet:(NSString*)password;
+(BOOL)isValidPhoneNo:(NSString*)phone;
+(BOOL)isNumericExists:(NSString *)str;
+(BOOL)isNameValid:(NSString *)str;
+(BOOL)isValidUsZipCode:(NSString *)str;
+(void)setBool:(BOOL)object ForKey:(NSString *)str;

+(NSString*)getHTMLString:(NSString*)str;
+(void)resetUserDefaultForKey:(NSString*)str;

//save json
+(NSString *)convertJsonDictionaryToString:(NSDictionary *)dictJson;
+(NSDictionary *)convertJsonStringToDictionary:(NSString *)strJson;





@end

