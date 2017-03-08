//
//  AUTClient+Trip.m
//  AutomaticSDK
//
//  Created by Robert Böhnke on 10/03/15.
//  Copyright (c) 2015 Automatic Labs. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "AUTClient+Trip.h"

static inline NSDictionary * const DefaultTripParameters() {
    return @{
        @"started_at__gte": @(1325376000000), // Jan 1st, 2012
        @"started_at__lte": @(ceil([NSDate date].timeIntervalSince1970 * 1000.0)),
    };
}

@implementation AUTClient (Trip)

- (NSURLSessionDataTask *)fetchTripsForCurrentUserWithSuccess:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    return [self.sessionManager
        GET:@"trip/"
        parameters:DefaultTripParameters()
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

- (NSURLSessionDataTask *)fetchTripsForUserWithID:(NSString *)userID success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    NSParameterAssert(userID != nil);

    return [self.sessionManager
        GET:[NSString stringWithFormat:@"user/%@/trip/", userID]
        parameters:DefaultTripParameters()
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

- (NSURLSessionDataTask *)fetchTripWithID:(NSString *)tripID success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    NSParameterAssert(tripID != nil);

    return [self.sessionManager
        GET:[NSString stringWithFormat:@"trip/%@/", tripID]
        parameters:nil
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

@end
