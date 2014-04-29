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
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

@end

@implementation PPFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)tapGesturePerformed:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [self performAnimation];
    }
}

- (void)performAnimation
{
    [self.tapGesture setEnabled:NO];
    // We are just referencing the label via tag, because we're lazy
    CALayer *layer = [(UILabel *)[self.view viewWithTag:10] layer];
    // First let's remove any existing animations
    [layer pop_removeAllAnimations];
    // POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    POPDecayAnimation  *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    
    anim.fromValue = @(150);
//    anim.toValue = @(200.0);
    anim.velocity = @(self.velocitySlider.value);
    anim.deceleration = self.decelSlider.value;
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
        [self.tapGesture setEnabled:YES];
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
}

- (IBAction)decelSliderUpdated:(UISlider *)sender {
    NSLog(@"Deceleration value changed. Value is now: %f", sender.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:20];
    label.text = [NSString stringWithFormat:@"Deceleration: %f", sender.value];
}
@end
