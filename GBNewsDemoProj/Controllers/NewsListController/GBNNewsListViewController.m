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

@property (weak, nonatomic) IBOutlet UITableView *tableViewNewsItem;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentCtrlSort;


@end

@implementation GBNNewsListViewController
{
    NSMutableArray *arrNewsItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeValues];
    [self setupUI];
    [self callApiNesListForSortType:0];
}

- (void)initializeValues {
    arrNewsItem = [[NSMutableArray alloc] init];
}

-(void)setupUI {
    [_segmentCtrlSort removeAllSegments];
    int i = 0;
    for (NSString *segmentTitle in _modelSourceObj.sourceSortBysAvailable) {
        [_segmentCtrlSort insertSegmentWithTitle:segmentTitle atIndex:i++ animated:true];
    }
    _segmentCtrlSort.selectedSegmentIndex = 0; // By default will be the 1st one.
    _tableViewNewsItem.rowHeight = UITableViewAutomaticDimension;
    _tableViewNewsItem.estimatedRowHeight = 95;
}

#pragma mark - API Section

- (void)callApiNesListForSortType:(int)sortType {
    
    [[AppUtils sharedUtil] showCommonHud];
    [[ApiManager sharedManager] getNewsItemsFromSourceID:_modelSourceObj.sourceID sortBy:_modelSourceObj.sourceSortBysAvailable[sortType] OnSuccess:^(NSDictionary *response) {
        
        [[AppUtils sharedUtil] hideCommonHud];
        [self handleSuccessResponseNewsList:response];
    } failure:^(NSString *errorMsg, NSError *error) {
        
        [[AppUtils sharedUtil] hideCommonHud];
        [arrNewsItem removeAllObjects];
        [_tableViewNewsItem reloadData];
    }];
}


- (void)handleSuccessResponseNewsList:(NSDictionary *)response
{
    NSArray * arrTempNews = response[@"articles"];
    arrNewsItem = [[NSMutableArray alloc] init];
    [arrTempNews enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ModelNewsItem * objSource = [[ModelNewsItem alloc] init];
        objSource.newsAuthor = (NSString*)obj[@"author"];
        objSource.newsTitle = (NSString*)obj[@"title"];
        objSource.newsDescription = (NSString*)obj[@"description"];
        objSource.newsURL = (NSString*)obj[@"url"];
        
        [arrNewsItem addObject:objSource];
    }];
    [self.tableViewNewsItem reloadData];
}

#pragma mark - Actions

- (IBAction)sortSegmentCtrlAction:(id)sender {
    UISegmentedControl *tempSegmntCtrl = (UISegmentedControl*)sender;
    [self callApiNesListForSortType:(int)tempSegmntCtrl.selectedSegmentIndex];
}

#pragma mark - UItableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrNewsItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelNewsItem *objNewsItem = arrNewsItem[indexPath.row];
    GBNNewsItemCell *cell = (GBNNewsItemCell *)[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([GBNNewsItemCell class])];
    cell.dataSource = objNewsItem;
    return cell;
}

#pragma mark - UITableView Delegates

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GBNNewsItemCell *cell =[tableView cellForRowAtIndexPath:indexPath];
    cell.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        cell.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            cell.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^( BOOL finished) {
            
        }];
    }];
}



@end
