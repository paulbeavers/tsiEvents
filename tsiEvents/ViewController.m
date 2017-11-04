//
//  ViewController.m
//  tsiEvents
//
//  Created by Paul Beavers on 11/1/17.
//  Copyright © 2017 Paul Beavers. All rights reserved.
//

#import "ViewController.h"
#import "tsiObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)sendEvent:(id)sender
{
    tsiObject * myObject = [[tsiObject alloc] init];
    
    myObject.APIKey = @"5a869976-35d4-4bbb-ba8a-4d752fccd6d1";
    myObject.tsiURL = @"api.truesight.bmc.com/v1/events/";
    myObject.deviceName = [[UIDevice currentDevice] name];
    myObject.appID = @"TrueSight Mobile";
    myObject.parentViewController = (UIViewController *) self;
    
    [myObject postEvent:eventText.text];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
