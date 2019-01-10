//
//  HomeAnnotation.m
// aditya
//
//  Created by // aditya Kumar on 5/7/18.
//  Copyright © 2018 // aditya. All rights reserved.
//

#import "HomeAnnotation.h"

@implementation HomeAnnotation

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // make sure the x and y of the CGRect are half it's
        // width and height, so the callout shows when user clicks
        // in the middle of the image
        CGRect  viewRect = CGRectMake(-20, -20, 40, 40);
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:viewRect];
        
        // keeps the image dimensions correct
        // so if you have a rectangle image, it will show up as a rectangle,
        // instead of being resized into a square
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.imgV = imageView;
        [self addSubview:self.imgV];
    }
    return self;
}


- (void)setImage:(UIImage *)image{
    // when an image is set for the annotation view,
    // it actually adds the image to the image view
    self.imgV.image = image;
}



@end
