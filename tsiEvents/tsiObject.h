//
//  tsiObject.h
//  tsiEvents
//
//  Created by Paul Beavers on 10/27/17.
//  Copyright © 2017 Paul Beavers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface tsiObject : NSObject
{
    NSString * APIName;
    NSString * APIKey;
    NSString * tsiURL;
    NSString * appID;
    UIViewController * parentViewController;
}

@property(copy) NSString *APIName;
@property(copy) NSString *APIKey;
@property(copy) NSString *tsiURL;
@property(copy) NSString *appID;
@property(copy) NSString *deviceName;
@property(retain) UIViewController *parentViewController;

- (tsiObject *) init;
- (int) postEvent: (NSString *) evText;

@end

