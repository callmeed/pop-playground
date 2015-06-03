//
//  PPRotateImageViewController.m
//  PopPlayground
//
//  Created by Akring on 15/6/3.
//  Copyright (c) 2015年 Callmeed. All rights reserved.
//

#import "PPRotateImageViewController.h"
#import <POP/POP.h>

#define ZoomIn @"ZoomIn"
#define ZoomOut @"ZoomOut"

@interface PPRotateImageViewController (){
    
    BOOL resetImage;
}

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PPRotateImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Rotate Image";
    
    [self initImageView];
    
    
}

- (void)initImageView{
    
    _imageView.layer.masksToBounds = YES;
    _imageView.layer.cornerRadius = 25;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView)];
    _imageView.userInteractionEnabled = YES;
    [_imageView addGestureRecognizer:tap];
}

- (void)tapImageView{
    
    [self setImageAnimation];
    
    resetImage  = !resetImage;
}

- (void)setImageAnimation{
    
    POPSpringAnimation *rotate = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
    rotate.springBounciness = 8;
    rotate.springSpeed = 15;
    if (resetImage) {
        
        rotate.fromValue = @(M_PI * 4);
        rotate.toValue = @(0);
    }
    else{
        
        rotate.fromValue = @(0);
        rotate.toValue = @(M_PI * 4);
        
    }
    
    POPSpringAnimation *scale = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    scale.springBounciness = 15;
    scale.springSpeed = 15;
    
    if (resetImage) {
        
        scale.toValue = [NSValue valueWithCGSize:CGSizeMake(50, 50)];
    }
    else{
        
        scale.toValue = [NSValue valueWithCGSize:CGSizeMake(320, 200)];
        
    }
    
    [_imageView.layer pop_addAnimation:rotate forKey:@"rotate"];
    [_imageView.layer pop_addAnimation:scale forKey:@"scale"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
