//
//  BasicUtility.m
//  EnVOLO
//
//  Created by  on 22/09/16.
//  Copyright © 2016 . All rights reserved.
//

#import "BasicUtility.h"

@implementation BasicUtility


static CGFloat radius = 1;
static int shadowOffsetWidth = 0;
static int shadowOffsetHeight = 2;
static float shadowOpacity = 0.3;




#pragma mark - GENERATE THUBIMAGE FROM VIDEO


+(UIImage *)generateThumbImage : (NSString *)filepath WithSize:(CGSize)size{
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:filepath ofType:@"mp4"]];
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    AVAssetImageGenerator *generateImg = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    NSError *error = NULL;
    CMTime time = CMTimeMake(1, 1);
    CGImageRef refImg = [generateImg copyCGImageAtTime:time actualTime:NULL error:&error];
    UIImage *FrameImage= [[UIImage alloc] initWithCGImage:refImg];
    FrameImage =[self  imageWithImage:FrameImage scaledToSize:size];
    return FrameImage;
}


#pragma mark - IMAGE SIZEING

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}






#pragma mark - SHADOW EFFECT


+(void)addDropShadow:(UIView *)view{
    UIBezierPath *shadowPath = [UIBezierPath
                                bezierPathWithRoundedRect: view.bounds
                                cornerRadius: radius];
    view.layer.masksToBounds = false;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    
    //NORMAL CASE
    view.layer.shadowOffset = CGSizeMake(shadowOffsetWidth, shadowOffsetHeight);
    view.layer.shadowOpacity = shadowOpacity;
    view.layer.shadowPath = shadowPath.CGPath;
}


+(void)addDropShadowWithCornerRadius:(UIView *)view{
    
    // drop shadow
    [view.layer setShadowColor:[UIColor blackColor].CGColor];
    [view.layer setShadowOpacity:0.9];
    [view.layer setShadowRadius:6.0];
    [view.layer setShadowOffset:CGSizeMake(4.0, 4.0)];
}




#pragma mark - STATUS BG COLOR
+ (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}








#pragma mark - BOTTOM BORDER
+(void)addBottomBorder:(UIView *)view{
    // UIView * viewLine = [[UIView  alloc] initWithFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y+view.frame.size.height-01 ,view.frame.size.width, 02)];
}




#pragma mark - TAKE SCREEN SHOT

+(UIImage *)createSnapShotImagesFromView:(UIView *)view{
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(view.window.bounds.size, NO, [UIScreen mainScreen].scale);
    } else {
        UIGraphicsBeginImageContext(view.window.bounds.size);
    }
    
    [view.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = UIImagePNGRepresentation(image);
    if (imageData) {
        [imageData writeToFile:@"screenshot.png" atomically:YES];
    } else {
        NSLog(@"error while taking screenshot");
    }
    return image;
    
    //    UIView *subView = view;
    //    UIGraphicsBeginImageContextWithOptions(subView.bounds.size, YES, 0.0f);
    //    CGContextRef context = UIGraphicsGetCurrentContext();
    //    [subView.layer renderInContext:context];
    //    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    //    UIGraphicsEndImageContext();
    //    return snapshotImage;
}





+ (UIImage *)renderImageFromView:(UIView *)view withRect:(CGRect)frame {
    // Create a new context the size of the frame
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Render the view
    [view.layer renderInContext:context];
    //[view drawRect:frame];
    
    // Get the image from the context
    UIImage *renderedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Cleanup the context you created
    UIGraphicsEndImageContext();
    return renderedImage;
}









#pragma mark - ATTRIBUTED TEXT

+(NSAttributedString*)setAttribtedText:(NSString *)title  WithTxt:(NSString *)txt{
    NSMutableAttributedString * mstrCode = [NSMutableAttributedString  new];
    /*
    //TITLE
    NSDictionary * dictTitle = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(kVoloColorSilver),NSForegroundColorAttributeName, [UIFont  fontWithName:kfontAvenir_Book size:15],NSFontAttributeName,nil];
    NSAttributedString * strTitle = [[NSAttributedString  alloc] initWithString:[NSString  stringWithFormat:@"%@",title] attributes:dictTitle];
    
    //TEXT
    NSDictionary * dictTxt = [[NSDictionary  alloc] initWithObjectsAndKeys:UIColorFromRGB(kVoloColorSilver),NSForegroundColorAttributeName,[UIFont  fontWithName:kfontAvenir_Book size:16],NSFontAttributeName,nil];
    NSAttributedString * strTxt = [[NSAttributedString  alloc] initWithString:txt attributes:dictTxt];
    
    [mstrCode  appendAttributedString:strTitle];
    [mstrCode  appendAttributedString:strTxt];
     */
    
    return mstrCode;
}



#pragma mark - HTML STRING

+(NSString*)getHTMLString:(NSString*)str{
    NSAttributedString * atr_string = [[NSAttributedString alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding]options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]} documentAttributes:nil error:nil];
    return   [atr_string string];
}


+ (NSString *)stringByStrippingHTML:(NSString *)str{
    
    NSScanner *myScanner;
    NSString *text = nil;
    myScanner = [NSScanner scannerWithString:str];
    while ([myScanner isAtEnd] == NO) {
        [myScanner scanUpToString:@"<" intoString:NULL] ;
        [myScanner scanUpToString:@">" intoString:&text] ;
        str = [str stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return str;
}



#pragma mark - STRING COLOR


+(UIColor*)colorWithHexString:(NSString*)hex{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    // strip # if it appears
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}




#pragma mark - CHANGE IMAGE


+(UIImage*)changeImage:(UIImage *)imgOrginal WithColor:(UIColor *)col{
    
    CGRect rect = CGRectMake(0, 0, imgOrginal.size.width, imgOrginal.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, imgOrginal.CGImage);
    CGContextSetFillColorWithColor(context, [col CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage scale:1.0 orientation: UIImageOrientationDownMirrored];
    return flippedImage;
}




#pragma mark - NETWORK CHECK
+(BOOL)isInternetAvailable{
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus]==NotReachable){
        return FALSE;
    }else{
        return TRUE;
    }
}






#pragma mark - TEXT TO SPEECH

+(void)textToSpeech:(NSString *)text{
    AVSpeechSynthesizer *synthesizer = [[AVSpeechSynthesizer alloc]init];
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:text];
    [utterance setRate:0.5f];
    [synthesizer speakUtterance:utterance];
}








#pragma mark - TOAST VIEW

+(void)showToastinView:(UIView *)view WithDesc:(NSString *)desc{
    [view makeToast:desc duration:3.0  position:CSToastPositionBottom];
}

+(void)showToastinViewWithImage:(UIView *)view WithDesc:(NSString *)desc{
    [view  makeToast:desc duration:2.0 position:CSToastPositionBottom title:nil image:[UIImage imageNamed:@"toast"] style:nil completion:nil];
}


#pragma mark - LOADER VIEW
+(void)showLoaderInView:(UIView *)view{
    
    UIView * viewloader = [UIView  new];
    viewloader.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    viewloader.backgroundColor = UIColorFromRGBWithAlpha(kappleLightGrey, 0.3);
    viewloader.tag = 123456789;
    [view  addSubview:viewloader];
    
    FLAnimatedImageView * imgVLoader = [[FLAnimatedImageView  alloc] initWithFrame:CGRectMake(view.frame.size.width/2, view.frame.size.height/2, 80, 80)];
    imgVLoader.center = viewloader.center;
    
    [viewloader addSubview:imgVLoader];
    
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"spinner" withExtension:@"gif"];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    FLAnimatedImage * animatedload = [FLAnimatedImage animatedImageWithGIFData:data1];
    imgVLoader.animatedImage = animatedload;
    
    
    /*
    DGActivityIndicatorView *  activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeBallClipRotateMultiple tintColor:UIColorFromRGB(kAutoAtlasGreen) size:SCREEN_WIDTH*0.5];
    activityIndicatorView.center = CGPointMake(viewloader.center.x, viewloader.center.y - 64);
    [viewloader addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    */
    
    
    
    /*
    InstagramActivityIndicator *indicator = [[InstagramActivityIndicator alloc]initWithFrame:CGRectMake(0, 0,100,100)];
    indicator.lineWidth = 3;
    indicator.strokeColor = UIColorFromRGB(kAutoAtlasGreen);
    indicator.numSegments = 18;
    indicator.rotationDuration = 12;
    indicator.animationDuration = 0.8;
    indicator.center =  CGPointMake(viewloader.center.x, viewloader.center.y*0.6);
    [viewloader addSubview:indicator];
    [indicator startAnimating];
    
    UIImageView * imgVCar = [[UIImageView  alloc]initWithImage:[UIImage  imageNamed:@"load_car"]];
    imgVCar.center = indicator.center;
    [viewloader addSubview:imgVCar];
     */
}


+(void)hideLoaderInView:(UIView *)view{
    [view.subviews  enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIView * viewSub = (UIView *)obj;
        if (viewSub.tag == 123456789) {
            [viewSub removeFromSuperview];
            *stop = YES;
            return;
        }
    }];
}





+ (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {
    CGImageRef maskRef = maskImage.CGImage;
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),CGImageGetHeight(maskRef),CGImageGetBitsPerComponent(maskRef),
                                        CGImageGetBitsPerPixel(maskRef),CGImageGetBytesPerRow(maskRef),CGImageGetDataProvider(maskRef), NULL, false);
    CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);
    return [UIImage imageWithCGImage:masked];
}





/*
[UIView  transitionWithView:viewSub duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
} completion:^(BOOL finished) {
}];
*/



@end
