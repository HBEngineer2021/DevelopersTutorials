//
//  HTTPService.m
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/05.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "https://qiita.com/api/v2/items?page=1&per_page=20"

@implementation HTTPService

+ (id) instance {
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}

- (void) getTutorials:(nullable onComplete)completeHandler {
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"%s", URL_BASE]];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completeHandler(json, nil);
            } else {
                completeHandler(nil, @"Data is corrupt. Please try again");
            }
        } else {
            NSLog(@"Network Err: %@", error.debugDescription);
            completeHandler(nil, @"Problem connecting to the sever");
        }
        
    }] resume];
    
}

@end
