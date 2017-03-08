//
//  AUTClient+Vehicle.h
//  AutomaticSDK
//
//  Created by Robert Böhnke on 10/03/15.
//  Copyright (c) 2015 Automatic Labs. All rights reserved.
//

#import <AutomaticSDK/AutomaticSDK.h>

NS_ASSUME_NONNULL_BEGIN

@interface AUTClient (Vehicle)

/**
 *  Fetches the vehicles for the currently authenticated user.
 *
 *  @param success A block object to be invoked with the results if the request
 *                 succeeds.
 *  @param failure A block object to be invoked with an error if the request
 *                 fails.
 *
 *  @return An `NSURLSessionDataTask` representing the request.
 */
- (NSURLSessionDataTask *)fetchVehiclesForCurrentUserWithSuccess:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure;

/**
 *  Fetches the vehicles belonging to the user with the given ID.
 *
 *  @param userID  The ID of the user whose vehicles you are interested in. This
 *                 argument must not be nil.
 *  @param success A block object to be invoked with the results if the request
 *                 succeeds.
 *  @param failure A block object to be invoked with an error if the request
 *                 fails.
 *
 *  @return An `NSURLSessionDataTask` representing the request.
 */
- (NSURLSessionDataTask *)fetchVehiclesForUserWithID:(NSString *)userID success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure;

/**
 *  Fetches a vehicles with a given ID.
 *
 *  @param vehicleID The ID of the trip you are interested in. This argument
 *                   must not be nil.
 *  @param success   A block object to be invoked with the results if the
 *                   request succeeds.
 *  @param failure   A block object to be invoked with an error if the request
 *                   fails.
 *
 *  @return An `NSURLSessionDataTask` representing the request.
 */
- (NSURLSessionDataTask *)fetchVehicleWithID:(NSString *)vehicleID success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
