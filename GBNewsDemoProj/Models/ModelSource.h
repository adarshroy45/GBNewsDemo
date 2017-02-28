//
//  ModelSource.h
//  GBNewsDemoProj
//
//  Created by Adarsh on 27/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelSource : NSObject

@property (strong, nonatomic) NSString *sourceID;
@property (strong, nonatomic) NSString *sourceName;
@property (strong, nonatomic) NSString *sourceDescription;
@property (strong, nonatomic) NSString *sourceURL;
@property (strong, nonatomic) NSArray *sourceSortBysAvailable;

@end

@interface ModelNewsItem : NSObject

@property (strong, nonatomic) NSString *newsAuthor;
@property (strong, nonatomic) NSString *newsTitle;
@property (strong, nonatomic) NSString *newsDescription;
@property (strong, nonatomic) NSString *newsURL;

@end
