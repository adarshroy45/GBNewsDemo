//
//  Models.h
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Models : NSObject

@end

@interface ModelSource : NSObject

@property (strong, nonatomic) NSString *sourceID;
@property (strong, nonatomic) NSString *sourceName;
@property (strong, nonatomic) NSString *sourceDescription;
@property (strong, nonatomic) NSString *sourceURL;

@end
