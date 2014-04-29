//
//  PPListViewController.m
//  PopPlayground
//
//  Created by Francescu on 29/04/2014.
//  Copyright (c) 2014 Callmeed. All rights reserved.
//

#import "PPListViewController.h"
@interface PPListCellInfo : NSObject 
@property (nonatomic, copy) NSString *cellTitle;
@property (nonatomic, copy) NSString *cellSegueIdentifier;
+ (instancetype)infoWithTitle:(NSString *)title segueIdentifier:(NSString *)identifier;
@end

@implementation PPListCellInfo

+ (instancetype)infoWithTitle:(NSString *)title segueIdentifier:(NSString *)identifier
{
    PPListCellInfo *info = [[PPListCellInfo alloc] init];
    [info setCellTitle:title];
    [info setCellSegueIdentifier:identifier];
    return info;
}
@end

@interface PPListViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *viewControllers; // <PPListCellInfo>
@end

@implementation PPListViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.viewControllers = @[[PPListCellInfo infoWithTitle:@"Decay" segueIdentifier:@"DECAY"],
                                 [PPListCellInfo infoWithTitle:@"Spring Bounce" segueIdentifier:@"SPRING_SIZE"]
                                 ];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ClassicCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    PPListCellInfo *info = [self infoForIndexPath:indexPath];
    [cell.textLabel setText:info.cellTitle];
    
    return cell;
}

- (PPListCellInfo *)infoForIndexPath:(NSIndexPath *)path
{
    return self.viewControllers[path.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewControllers.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPListCellInfo *info = [self infoForIndexPath:indexPath];
    [self performSegueWithIdentifier:info.cellSegueIdentifier sender:self];
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
