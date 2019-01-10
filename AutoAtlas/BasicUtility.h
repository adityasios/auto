//
//  BasicUtility.h
//  EnVOLO
//
//  Created by WebMaazix on 22/09/16.
//  Copyright © 2016 WebMaazix. All rights reserved.
//

#import <Foundation/Foundation.h>

//constant
#import "Constant.h"
#import "Macros.h"

//3rdparty
#import "Reachability.h"
#import <UIView+Toast.h>
#import "InstagramActivityIndicator.h"
#import "DGActivityIndicatorView.h"
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"

@import MapKit;
@import UIKit;
@import AVKit;
@import AVFoundation;


@interface BasicUtility : NSObject

+(UIImage *)generateThumbImage:(NSString *)filepath WithSize:(CGSize)size;
+(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize ;
+(void)addDropShadow:(UIView *)view;
+(void)addBottomBorder:(UIView *)view;
+(UIImage *)createSnapShotImagesFromView:(UIView *)view;
+(NSAttributedString*)setAttribtedText:(NSString *)title  WithTxt:(NSString*)txt;
+(UIColor*)colorWithHexString:(NSString*)hex;
+(UIImage *)changeImage :(UIImage *)imgOrginal      WithColor:(UIColor *)col;
+ (NSString *)stringByStrippingHTML:(NSString *)str;
+(NSString*)getHTMLString:(NSString*)str;
+ (void)textToSpeech:(NSString *)text;
+ (UIImage *)renderImageFromView:(UIView *)view withRect:(CGRect)frame ;
+(void)addDropShadowWithCornerRadius:(UIView *)view;
+(void)setStatusBarBackgroundColor:(UIColor *)color ;
+(BOOL)isInternetAvailable;

+(void)showToastinView:(UIView *)view WithDesc:(NSString *)desc;
+(void)showToastinViewWithImage:(UIView *)view WithDesc:(NSString *)desc;

+(void)showLoaderInView:(UIView *)view;
+(void)hideLoaderInView:(UIView *)view;
+(UIImage*)maskImage:(UIImage *)image withMask:(UIImage *)maskImage;


@end


