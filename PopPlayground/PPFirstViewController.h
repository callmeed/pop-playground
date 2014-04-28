//
//  PPFirstViewController.h
//  PopPlayground
//
//  Created by Erik Dungan on 4/28/14.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPFirstViewController : UIViewController
- (IBAction)velocitySliderUpdated:(UISlider *)sender;
- (IBAction)decelSliderUpdated:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *decelSlider;
@property (weak, nonatomic) IBOutlet UISlider *velocitySlider;

@end
