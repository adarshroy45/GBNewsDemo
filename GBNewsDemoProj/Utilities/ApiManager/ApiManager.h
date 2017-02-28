//
//  ApiManager.h
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ApiManager : AFHTTPSessionManager

+(ApiManager*)sharedManager;

-(void)getNewsSourcesOfLanguage:(NSString*)lang OnSuccess:(void(^)(NSDictionary *response))success failure:(void(^)(NSString *errorMsg,NSError *error))failure;
-(void)getNewsItemsFromSourceID:(NSString*)sourceID sortBy:(NSString*)sortBy OnSuccess:(void(^)(NSDictionary *response))success failure:(void(^)(NSString *errorMsg,NSError *error))failure;

@end
