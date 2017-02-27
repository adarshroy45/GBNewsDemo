//
//  GBNNewsListViewController.m
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import "GBNNewsListViewController.h"
#import "GBNNewsItemCell.h"

@interface GBNNewsListViewController ()

@end

@implementation GBNNewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - UItableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBNNewsItemCell *cell = (GBNNewsItemCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GBNNewsItemCell class])];
    return cell;
}

#pragma mark - UITableView Delegates

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}


@end
