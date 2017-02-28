//
//  ApiManager.m
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import "ApiManager.h"
#import "AppUtils.h"

static ApiManager *sharedManager;

@implementation ApiManager
{
}

+(ApiManager*)sharedManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        sharedManager=[[ApiManager alloc] init];
    });
    return sharedManager;
}

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


#pragma mark - Api's

-(void)getNewsSourcesOfLanguage:(NSString*)lang OnSuccess:(void(^)(NSDictionary *response))success failure:(void(^)(NSString *errorMsg,NSError *error))failure
{
    if (!Reachable)
    {
        failure(NEWS_API_KEY,nil);
        return;
    }
    
    NSDictionary *params = @{@"language": lang
                             };
    NSString *urlStr=ENDPOINT(@"sources");
    [self GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            failure(@"Response in Incorrect format",nil);
        }
        
        NSDictionary *responseDict=(NSDictionary*)responseObject;
        if ([((NSString*)responseDict[@"status"]) isEqualToString:@"ok"])
        {
            success(responseObject);
        }
        else
        {
            failure(@"Business response failure",nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        failure(@"Afnetworking failure",error);
    }];
}

-(void)getNewsItemsFromSourceID:(NSString*)sourceID sortBy:(NSString*)sortBy OnSuccess:(void(^)(NSDictionary *response))success failure:(void(^)(NSString *errorMsg,NSError *error))failure
{
    if (!Reachable)
    {
        failure(NEWS_API_KEY,nil);
        return;
    }
    
    NSDictionary *params = @{@"source": sourceID,
                             @"sortBy": sortBy,
                             @"apiKey": NEWS_API_KEY
                             };
    NSString *urlStr=ENDPOINT(@"articles");
    [self GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        if (![responseObject isKindOfClass:[NSDictionary class]]) {
            failure(@"Response in Incorrect format",nil);
        }
        
        NSDictionary *responseDict=(NSDictionary*)responseObject;
        if ([((NSString*)responseDict[@"status"]) isEqualToString:@"ok"])
        {
            success(responseObject);
        }
        else
        {
            failure(@"Business response failure",nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        failure(@"Afnetworking failure",error);
    }];
}

@end
