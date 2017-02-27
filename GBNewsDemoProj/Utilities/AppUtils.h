//
//  AppUtils.h
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "ApiManager.h"
#import "Models.h"

//Macros
#define BASE_URL @"https://newsapi.org/v1/"
#define ENDPOINT(X) [NSString stringWithFormat:@"%@%@",BASE_URL,X]
#define NEWS_API_KEY @"ab2b5d0062f847eca6774b4a291da46c"

#define Reachable ([[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus] != AFNetworkReachabilityStatusNotReachable)
# define APPDELEGATE (AppDelegate*)[UIApplication sharedApplication].delegate


@interface AppUtils : NSObject

+(AppUtils *)sharedUtil;

- (void)showCommonHud;
- (void)hideCommonHud;

@end
