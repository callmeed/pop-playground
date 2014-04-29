//
//  PPPictureViewController.m
//  PopPlayground
//
//  Created by Francescu on 29/04/2014.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import "PPPictureViewController.h"
#import <POP/POP.h>

@interface PPPictureViewController ()
{
    BOOL _isInFullscreen;
}
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *constraintImageView;

@end

@implementation PPPictureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)fullscreenButtonWasPressed:(UIButton *)sender
{
    [self performFullScreenAnimationConstraint];
    [self performFullScreenAnimationFrame];
    
    _isInFullscreen = !_isInFullscreen;
}

- (void)performFullScreenAnimationConstraint
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

- (void)performFullScreenAnimationFrame
{
    CGRect baseRect = CGRectMake(69, 335, 182, 118);
    
    [self.imageView pop_removeAllAnimations];
    
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    animation.springBounciness = 8;
    
    if (!_isInFullscreen)
    {
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(0,335, 320, 208)];
    }
    else
    {
        animation.toValue = [NSValue valueWithCGRect:baseRect];
    }
    
    [self.imageView pop_addAnimation:animation forKey:@"fullscreen"];
    
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

@end
