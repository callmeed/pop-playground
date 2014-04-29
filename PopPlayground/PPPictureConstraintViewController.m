//
//  PPPictureConstraintViewController.m
//  PopPlayground
//
//  Created by Francescu SANTONI on 29/04/2014.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import "PPPictureConstraintViewController.h"

@interface PPPictureConstraintViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@end

@implementation PPPictureConstraintViewController

- (void)performFullScreenAnimation
{
    [self.widthConstraint pop_removeAllAnimations];
    [self.heightConstraint pop_removeAllAnimations];
    
    POPSpringAnimation *heightAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
    heightAnimation.springBounciness = 8;
    
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
    animation.springBounciness = 8;
    
    if (!_isInFullscreen)
    {
        animation.toValue = @(320.);
        heightAnimation.toValue = @(208.);
    }
    else
    {
        animation.toValue = @(182.);
        heightAnimation.toValue = @(118.);
    }
    
    [self.heightConstraint pop_addAnimation:heightAnimation forKey:@"fullscreen"];
    [self.widthConstraint pop_addAnimation:animation forKey:@"fullscreen"];
    
}

@end
