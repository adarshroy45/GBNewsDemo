//
//  GBNNewsItemCell.h
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppUtils.h"

@interface GBNNewsItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelTopic;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;

@property (strong, nonatomic) ModelNewsItem *dataSource;

@end
