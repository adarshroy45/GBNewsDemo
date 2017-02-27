//
//  GBNSourcesViewController.m
//  GBNewsDemoProj
//
//  Created by Adarsh on 21/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import "GBNSourcesViewController.h"
#import "GBNSourceCell.h"
#import "GBNNewsListViewController.h"
#import "AppUtils.h"

@interface GBNSourcesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewSources;


@end

@implementation GBNSourcesViewController
{
    NSMutableArray *arrSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeValues];
    [self callApiSourceList];
}

- (void)initializeValues {
    arrSources = [[NSMutableArray alloc] init];
}

#pragma mark - API Section

- (void)callApiSourceList {
    
    [[AppUtils sharedUtil] showCommonHud];
    
    [[ApiManager sharedManager] getNewsSourcesOfLanguage:@"en" OnSuccess:^(NSDictionary *response) {
        
        [[AppUtils sharedUtil] hideCommonHud];
        [self handleSuccessResponseSourceList:response];
    } failure:^(NSString *errorMsg, NSError *error) {
        
        [[AppUtils sharedUtil] hideCommonHud];
    }];
}

    
- (void)handleSuccessResponseSourceList:(NSDictionary *)response
{
    NSArray * arrTempSources = response[@"sources"];
    arrSources = [[NSMutableArray alloc] init];
    [arrTempSources enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        @autoreleasepool {
//            ModelSource * objSource = [[ModelSource alloc] init];
//            objSource.sourceID = obj[@"id"];
//            objSource.sourceName = obj[@"name"];
//            objSource.sourceDescription = obj[@"description"];
//            objSource.sourceURL = obj[@"url"];
//            
//            [arrSources addObject:obj];
        }
        
    }];
    [self.tableViewSources reloadData];
}

#pragma mark - UItableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSources.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    ModelSource *obj = arrSources[indexPath.row];
    GBNSourceCell *cell = (GBNSourceCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GBNSourceCell class])];
//    cell.dataSource = obj;
    return cell;
}

#pragma mark - UITableView Delegates

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBNSourceCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    cell.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        cell.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^( BOOL finished) {
//            ModelSource *obj = arrSources[indexPath.row];
            GBNNewsListViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([GBNNewsListViewController class])];
//            vc.modelSourceObj = obj;
            [self.navigationController pushViewController:vc animated:YES];
            
        }];
    }];
}


@end
