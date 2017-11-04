//
//  tsiObject.m
//  tsiEvents
//
//  Created by Paul Beavers on 10/27/17.
//  Copyright © 2017 Paul Beavers. All rights reserved.
//

#import "tsiObject.h"
#import <UIKit/UIKit.h>

@implementation tsiObject

@synthesize APIKey, APIName, appID, deviceName, tsiURL, parentViewController;

- (tsiObject *) init
{
    APIName = @"username";
    parentViewController = nil;
    return self;
}

- (int) postEvent: (NSString *) evText
{
    int rc = 0;
    long tm = (long)(NSTimeInterval)([[NSDate date] timeIntervalSince1970]);
    
    NSString *PostString = [[NSString alloc] initWithFormat:@"{           \
        \"source\":                                                       \
        {                                                                 \
            \"ref\": \"TrueSight  Mobile\",                               \
            \"type\": \"TrueSight  Mobile\",                              \
            \"name\": \"TrueSight  Mobile\"                               \
        },                                                                \
        \"sender\":                                                       \
        {                                                                 \
            \"ref\": \"TrueSight  Mobile\",                               \
            \"type\": \"TrueSight  Mobile\",                              \
            \"name\": \"TrueSight  Mobile\"                               \
        },                                                                \
        \"title\": \"%@\",                                                \
        \"fingerprintFields\": [\"@title\",\"sequenceNumber\"],           \
        \"eventClass\": \"SIRI\",                                         \
        \"status\": \"OPEN\",                                             \
        \"severity\": \"INFO\",                                           \
        \"properties\":                                                   \
        {                                                                 \
            \"app_id\": \"TrueSight Mobile\",                             \
            \"entityId\": \"%@\",                                         \
            \"entityTypeId\": \"MOBILE_DEVICE\",                          \
            \"sequenceNumber\":%ld                                        \
        }                                                                 \
    }",
    evText, deviceName, tm];
    
    NSData *PostData = [PostString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString * urlString = [NSString stringWithFormat:@"https://%@:%@@%@", APIName, APIKey,tsiURL];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:PostData];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error)
        {
            if (parentViewController)
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertController *myAlertController = [UIAlertController alertControllerWithTitle:@"TrueSight"
                           message: @"Error posting event to TrueSight Intelligence" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction* ok = [UIAlertAction
                                         actionWithTitle:@"OK"
                                         style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction * action)
                                         {
                                             [myAlertController dismissViewControllerAnimated:YES completion:nil];
                                         }];
                    [myAlertController addAction: ok];
                    [parentViewController presentViewController:myAlertController animated:YES completion:nil];
                });
            }
        }
    }];
    
    [task resume];
    
    return rc;
}



@end
