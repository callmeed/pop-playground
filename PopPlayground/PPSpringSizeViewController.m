//
//  PPSpringSizeViewController.m
//  PopPlayground
//
//  Created by Francescu on 29/04/2014.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import "PPSpringSizeViewController.h"
#import <POP/POP.h>

@interface PPSpringSizeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;
@property (weak, nonatomic) IBOutlet UISlider *springSpeedSlider;
@property (weak, nonatomic) IBOutlet UISlider *springBouncinessSlider;

@end

@implementation PPSpringSizeViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        
    }
    return self;
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
    self.tapGesture.enabled = NO;
    
    // First let's remove any existing animations
    CALayer *layer = self.label.layer;
    [layer pop_removeAllAnimations];
    
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    anim.fromValue = @(100);
    anim.toValue = @(300);
    anim.springBounciness = self.springBouncinessSlider.value;
    anim.springSpeed = self.springSpeedSlider.value;
 

    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"Animation has completed.");
        self.tapGesture.enabled = YES;
    };
    
    [layer pop_addAnimation:anim forKey:@"size"];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)springSpeedSliderUpdated:(UISlider *)sender
{
    UILabel *label = (UILabel *)[self.view viewWithTag:20];
    label.text = [NSString stringWithFormat:@"Spring Speed: %f", sender.value];
}

- (IBAction)springBouncinessSliderUpdated:(UISlider *)sender
{
    UILabel *label = (UILabel *)[self.view viewWithTag:30];
    label.text = [NSString stringWithFormat:@"Spring Bounciness: %f", sender.value];
}

@end
