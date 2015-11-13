//
//  BAKRequest.h
//  BackchannelSDK
//
//  Created by Soroush Khanlou on 5/21/15.
//  Copyright (c) 2015 Backchannel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BAKRequestTemplate.h"

@interface BAKRemoteConfiguration : NSObject <BAKRemoteConfiguration>

- (instancetype)initWithAPIKey:(NSString *)APIKey displayName:(NSString*)userName;

@property (nonatomic, readonly) NSString *APIKey;
@property (nonatomic, readonly) NSString *userName;

@end
