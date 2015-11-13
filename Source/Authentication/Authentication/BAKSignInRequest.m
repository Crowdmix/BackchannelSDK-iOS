//
//  BAKSignInRequest.m
//  BackchannelSDK
//
//  Created by Soroush Khanlou on 5/21/15.
//  Copyright (c) 2015 Backchannel. All rights reserved.
//

#import "BAKSignInRequest.h"
#import "BAKSession.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation BAKSignInRequest

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password configuration:(BAKRemoteConfiguration *)configuration {
    self = [super init];
    if (!self) return nil;
    
    _email = [NSString stringWithFormat:@"%@@crowdmix.me",[configuration userName]];
    NSData *data = [[configuration userName]dataUsingEncoding:NSASCIIStringEncoding];
    NSMutableData *mutedData = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, data.length,  mutedData.mutableBytes);
    NSString *hashedString = [mutedData base64EncodedStringWithOptions:0];
    _password = hashedString;
    _configuration = configuration;

    return self;
}

- (NSString *)method {
    return @"POST";
}

- (NSString *)path {
    return @"api/v1/users/login";
}

- (NSDictionary *)parameters {
    return @{
             @"email": self.email,
             @"password": self.password,
             };
}

- (void)finalizeWithResponse:(id<BAKResponse>)response {
    if (!response.error) {
        response.result = [BAKSession openSessionWithDictionary:response.result[@"session"]];
    }
}

@end
