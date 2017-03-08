//
//  AUTClient+User.m
//  AutomaticSDK
//
//  Created by Robert Böhnke on 06/03/15.
//  Copyright (c) 2015 Automatic Labs. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "AUTClient+User.h"

@implementation AUTClient (User)

- (NSURLSessionDataTask *)fetchCurrentUserWithSuccess:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    return [self.sessionManager
        GET:@"user/me/"
        parameters:nil
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

- (NSURLSessionDataTask *)fetchCurrentUserWithID:(NSString *)userID success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    NSParameterAssert(userID != nil);

    return [self.sessionManager
        GET:[NSString stringWithFormat:@"user/%@/", userID]
        parameters:nil
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

@end
