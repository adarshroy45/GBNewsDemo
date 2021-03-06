//
//  GBNNewsItemCell.m
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import "GBNNewsItemCell.h"

@implementation GBNNewsItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataSource:(ModelNewsItem *)dataSource {
    _labelTopic.text = [AppUtils isSafeString:dataSource.newsTitle] ? dataSource.newsTitle : @"N/A";
    _labelDescription.text = [AppUtils isSafeString:dataSource.newsDescription] ? dataSource.newsDescription : @"N/A";
}

@end
