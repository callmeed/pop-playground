//
//  PPPictureViewController.m
//  PopPlayground
//
//  Created by Francescu on 29/04/2014.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import "PPPictureViewController.h"

@interface PPPictureViewController ()
@end

@implementation PPPictureViewController


- (IBAction)fullscreenButtonWasPressed:(UIButton *)sender
{
    [self performFullScreenAnimation];
    
    _isInFullscreen = !_isInFullscreen;
}



- (void)performFullScreenAnimation
{
    CGRect baseRect = CGRectMake(69, self.view.center.y - 118 / 2, 182, 118);
    CGRect fullRect = CGRectMake(0,self.view.center.y - 208 / 2, 320, 208);
    
    [self.imageView pop_removeAllAnimations];
    
    
    POPSpringAnimation *animation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    animation.springBounciness = 8;
    
    if (!_isInFullscreen)
    {
        animation.toValue = [NSValue valueWithCGRect:fullRect];
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
