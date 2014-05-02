//
//  PPSpringButtonViewController.m
//  PopPlayground
//
//  Created by Francescu on 29/04/2014.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import "PPSpringButtonViewController.h"
#import <POP/POP.h>

@interface PPSpringButtonViewController ()
{
    BOOL _buttonToggle;
}
@end

@implementation PPSpringButtonViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)bigBounceButtonWasPressed:(UIButton *)sender
{
    _buttonToggle = !_buttonToggle;
    
    CALayer *layer = sender.layer;
    
    // First let's remove any existing animations
    [layer pop_removeAllAnimations];
    POPSpringAnimation  *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    POPSpringAnimation *rotation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];

    if (_buttonToggle)
    {
        anim.toValue = [NSValue valueWithCGSize:CGSizeMake(44, 44)];
        rotation.toValue = @(M_PI_4);
        sender.tintColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
    }
    else
    {
        anim.toValue = [NSValue valueWithCGSize:CGSizeMake(34, 34)];
        rotation.toValue = @(0);
        sender.tintColor = [UIColor redColor];
    }
    
    anim.springBounciness = 20;
    anim.springSpeed = 16;
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
    };
    [layer pop_addAnimation:anim forKey:@"size"];
    [layer pop_addAnimation:rotation forKey:@"rotation"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
