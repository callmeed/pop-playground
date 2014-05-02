//
//  PPCustomSegue.m
//  PopPlayground
//
//  Created by Erik Dungan on 5/2/14.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//
//  Special thanks to Zakir Hyder for his blog post on custom segues
//  http://blog.jambura.com/2012/07/05/custom-segue-animation-left-to-right-using-catransition/


#import "PPCustomSegue.h"
#import <POP/POP.h>

@implementation PPCustomSegue

-(void)perform {
    
    UIViewController *sourceViewController = (UIViewController*)[self sourceViewController];
    UIViewController *destinationController = (UIViewController*)[self destinationViewController];
    
    CALayer *layer = destinationController.view.layer;
    [layer pop_removeAllAnimations];
    
    NSLog(@"Layer frame X: %f", layer.frame.origin.x);
    NSLog(@"Layer frame width: %f", layer.frame.size.width);
    
    POPSpringAnimation *xAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    POPSpringAnimation *sizeAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    xAnim.fromValue = @(320);
    xAnim.springBounciness = 16;
    xAnim.springSpeed = 10;
    
    // About 20% of it's normal size
    sizeAnim.fromValue = [NSValue valueWithCGSize:CGSizeMake(64, 114)];
    
    xAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
        NSLog(@"Layer frame X: %f", layer.frame.origin.x);
    };
    
    [layer pop_addAnimation:xAnim forKey:@"position"];
    [layer pop_addAnimation:sizeAnim forKey:@"size"];
    
    [sourceViewController.navigationController pushViewController:destinationController animated:NO];
}

@end
