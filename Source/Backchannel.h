//
//  Backchannel.h
//  BackchannelSDK
//
//  Created by Soroush Khanlou on 5/12/15.
//  Copyright (c) 2015 Backchannel. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@interface Backchannel : NSObject

+ (void)setAPIKey:(NSString *)APIKey rootViewController:(UIViewController *)rootViewController displayName:(NSString*)displayName;
+ (instancetype)setAPIKey:(NSString *)APIKey;
+ (instancetype)backchannel;

- (void)presentModallyOverViewController:(UIViewController *)viewController;

@end
