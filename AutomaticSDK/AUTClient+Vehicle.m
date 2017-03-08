//
//  AUTClient+Vehicle.m
//  AutomaticSDK
//
//  Created by Robert Böhnke on 10/03/15.
//  Copyright (c) 2015 Automatic Labs. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "AUTClient+Vehicle.h"

@implementation AUTClient (Vehicle)

- (NSURLSessionDataTask *)fetchVehiclesForCurrentUserWithSuccess:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    return [self.sessionManager
        GET:@"vehicle/"
        parameters:nil
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

- (NSURLSessionDataTask *)fetchVehiclesForUserWithID:(NSString *)userID success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    NSParameterAssert(userID != nil);

    return [self.sessionManager
        GET:[NSString stringWithFormat:@"user/%@/vehicle/", userID]
        parameters:nil
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

- (NSURLSessionDataTask *)fetchVehicleWithID:(NSString *)vehicleID success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    NSParameterAssert(vehicleID != nil);

    return [self.sessionManager
        GET:[NSString stringWithFormat:@"vehicle/%@/", vehicleID]
        parameters:nil
        progress:nil
        success:AUTExtractResponseObject(success)
        failure:AUTExtractError(failure)];
}

@end
