//
//  PPPictureViewController.h
//  PopPlayground
//
//  Created by Francescu on 29/04/2014.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <POP/POP.h>

@interface PPPictureViewController : UIViewController
{
    BOOL _isInFullscreen;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (void)performFullScreenAnimation;
@end
