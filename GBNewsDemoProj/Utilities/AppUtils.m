//
//  AppUtils.m
//  GBNewsDemoProj
//
//  Created by Adarsh on 23/02/17.
//  Copyright © 2017 Adarsh. All rights reserved.
//

#import "AppUtils.h"
#import "MBProgressHUD.h"

static AppUtils *sharedUtil;
@implementation AppUtils

+(AppUtils *)sharedUtil
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedUtil=[[AppUtils alloc] init];
    });
    
    return sharedUtil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark -

+(BOOL)isSafeString:(NSString*)str {
    if ((str == (id)[NSNull null]) || !str) {
        return  false;
    }
    else {
        return true;
    }
}

#pragma mark - HUD

- (void)showCommonHud
{
    [MBProgressHUD showHUDAddedTo:(APPDELEGATE).window animated:YES];
}

- (void)hideCommonHud
{
    [MBProgressHUD hideHUDForView:(APPDELEGATE).window animated:YES];
}

@end
