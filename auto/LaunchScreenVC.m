//
//  LaunchScreenVC.m
// aditya
//
//  Created by // aditya Kumar on 3/29/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "LaunchScreenVC.h"

@interface LaunchScreenVC ()

@end

@implementation LaunchScreenVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"spinner" withExtension:@"gif"];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    FLAnimatedImage * animatedload = [FLAnimatedImage animatedImageWithGIFData:data1];
    self.imgVLoader.animatedImage = animatedload;
    [NSTimer scheduledTimerWithTimeInterval:0.9*4 target: self selector:@selector(onTick:) userInfo:nil repeats:NO];
}

-(void)onTick:(NSTimer *)timer{
    NSLog(@"onTick");
    UINavigationController * nav = [self.storyboard  instantiateViewControllerWithIdentifier:@"nav"];
    [nav setModalPresentationStyle:UIModalPresentationCustom];
    [nav setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self  presentViewController:nav animated:YES completion:nil];
}







@end
