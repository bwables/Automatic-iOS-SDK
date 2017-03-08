//
//  AUTClient+Pagination.m
//  AutomaticSDK
//
//  Created by Robert Böhnke on 11/03/15.
//  Copyright (c) 2015 Automatic Labs. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "AUTClient+Pagination.h"

@implementation AUTClient (Pagination)

- (NSURLSessionDataTask *)fetchPage:(NSURL *)pageURL success:(nullable AUTResponseBlock)success failure:(nullable AUTFailureBlock)failure {
    NSParameterAssert(pageURL != nil);

    NSError *error;
    NSURLRequest *request = [self.sessionManager.requestSerializer
        requestBySerializingRequest:[NSURLRequest requestWithURL:pageURL]
        withParameters:nil
        error:&error];

    if (request == nil && failure != nil) {
        dispatch_async(self.sessionManager.completionQueue ?: dispatch_get_main_queue(), ^{
            failure(error);
        });
    }

    NSURLSessionDataTask *operation = [self.sessionManager
        dataTaskWithRequest:request
        completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
            if (error == nil) {
                if (success != nil) {
                    success(responseObject);
                }
            } else {
                if (failure != nil) {
                    failure(error);
                }
            }
        }];

    [operation resume];

    return operation;
}

@end
