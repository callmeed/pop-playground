//
//  PPFirstViewController.m
//  PopPlayground
//
//  Created by Erik Dungan on 4/28/14.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import "PPFirstViewController.h"
#import <POP/POP.h>

@interface PPFirstViewController ()

@end

@implementation PPFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performAnimation];
}

- (void)performAnimation
{
    // We are just referencing the label via tag, because we're lazy
    UILabel *layer = (UILabel *)[self.view viewWithTag:10];
    // First let's remove any existing animations
    [layer pop_removeAllAnimations];
    // POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    POPDecayAnimation  *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    //    anim.toValue = @(20.0);
    anim.fromValue = @(0.0);
    anim.velocity = @(self.velocitySlider.value);
    anim.deceleration = self.decelSlider.value;
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
    };
    [layer pop_addAnimation:anim forKey:@"size"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)velocitySliderUpdated:(UISlider *)sender {
    NSLog(@"Velocity value changed. Value is now: %f", sender.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:30];
    label.text = [NSString stringWithFormat:@"Velocity: %f", sender.value];
    [self performAnimation];
}

- (IBAction)decelSliderUpdated:(UISlider *)sender {
    NSLog(@"Deceleration value changed. Value is now: %f", sender.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:20];
    label.text = [NSString stringWithFormat:@"Deceleration: %f", sender.value];
    [self performAnimation];
}
@end
