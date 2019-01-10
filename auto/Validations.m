//
//  Validations.m
//  Snic View
//
//  Created by Yashvir on 01/03/16.
//  Copyright © 2016 wry. All rights reserved.
//

#import "Validations.h"

@implementation Validations


#pragma mark
#pragma mark VALIDATORS
#pragma mark


#pragma mark removeWhiteSpace
+(NSString*)removeWhiteSpace:(NSString *)str{
    return [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


#pragma mark removeDoubleSpace
+(NSString*)removeDoubleSpace:(NSString *)str{
    while ([str rangeOfString:@"  "].location != NSNotFound) {
        str = [str stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    }
    return str;
}


#pragma mark isValidEmail
+(BOOL) isValidEmail:(NSString *)checkString{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}


+(BOOL)isThereCapitalAlphabet:(NSString*)password{
    NSRegularExpression* regex = [[NSRegularExpression alloc] initWithPattern:@"^.*(?=.{6,})(?=.*[a-z])(?=.*[A-Z]).*$" options:0 error:nil];
    return [regex numberOfMatchesInString:password options:0 range:NSMakeRange(0, [password length])] > 0;
}

+(BOOL)isValidPhoneNo:(NSString*)phone{
    NSRegularExpression* regex = [[NSRegularExpression alloc] initWithPattern:@"^\\d{10}$" options:0 error:nil];
    return [regex numberOfMatchesInString:phone options:0 range:NSMakeRange(0, [phone length])] > 0;
}


+(BOOL)isNumericExists:(NSString *)str{
    if ([str rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound) {
        return TRUE;
    }
    return FALSE;
}


+(BOOL)isNameValid:(NSString *)str{
    NSString *emailRegex = @"[a-zA-z]+([ '-][a-zA-Z]+)*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL isValid = [emailTest evaluateWithObject:str];
    return isValid;
}

+(BOOL)isValidUsZipCode:(NSString *)str{
    NSString * zipUS = @"^(\\d{5}(-\\d{4})?|[a-z]\\d[a-z][- ]*\\d[a-z]\\d)$";
    NSPredicate * zipTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", zipUS];
    BOOL isValid = [zipTest evaluateWithObject:str];
    return isValid;
}




#pragma mark isObjectNull
+(BOOL)isObjectNull:(id)obj{
    if (!obj || obj == [NSNull null] ){
        return TRUE;
    }
    if ([obj isKindOfClass:[NSString class]]) {
        if (!obj || obj == [NSNull null]|| [obj isEqualToString:@"<null>"] ){
            return TRUE;
        }
    }
    return FALSE;
}


#pragma mark saveObject
+(void)setBool:(BOOL)object ForKey:(NSString *)str{
    
    [[NSUserDefaults standardUserDefaults] setBool:object forKey:str];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)saveObject:(id)object ForKey:(NSString *)str{
    
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:str];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark getObject
+(BOOL)getBoolForKey:(NSString*)str{
    BOOL strobject =     [[NSUserDefaults standardUserDefaults]
                          stringForKey:str];
    return strobject;
}


+(NSString*)getObjectForKey:(NSString *)str{
    
    if ([[NSUserDefaults  standardUserDefaults] objectForKey:str] != nil) {
        NSString   * strobject =  [[NSUserDefaults standardUserDefaults] stringForKey:str];
        return strobject;
    }
    
    return @"";
}


#pragma mark resetAllUserDefaults
+(void)resetAllUserDefaults{
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
}

+(void)removeObjectForKey:(NSString *)str{
    if ([[NSUserDefaults  standardUserDefaults] objectForKey:str] == nil) {
    }else{
        [[NSUserDefaults  standardUserDefaults] removeObjectForKey:str];
    }
}


+(NSString*)getHTMLString:(NSString*)str{
    NSAttributedString * atr_string = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil];
    return  [atr_string string];
}

+(void)resetUserDefaultForKey:(NSString *)str{
    [[NSUserDefaults  standardUserDefaults] removeObjectForKey:str];
}






#pragma mark - save json
+(NSString *)convertJsonDictionaryToString:(NSDictionary *)dictJson{
    NSError * err;
    NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:dictJson options:0 error:&err];
    NSString * strJson = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
    if (!err) {
        return strJson;
    }else{
        return @"";
    }
}


+(NSDictionary *)convertJsonStringToDictionary:(NSString *)strJson{
    NSError * err;
    NSData * data =[strJson dataUsingEncoding:NSUTF8StringEncoding];
    if(data!=nil){
        
        NSDictionary * response = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
        if (!err) {
            return response;
        }else{
            return @{};
        }
        
    }else{
        return @{};
    }
}

@end

