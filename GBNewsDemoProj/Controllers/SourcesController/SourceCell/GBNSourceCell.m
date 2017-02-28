//
//  SourceCell.m
//  GBNewsDemoProj
//
//  Created by Adarsh on 21/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import "GBNSourceCell.h"

@implementation GBNSourceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataSource:(ModelSource *)dataSource {
    _labelTopic.text = dataSource.sourceName;
    _labelDescription.text = dataSource.sourceDescription;
}

@end
