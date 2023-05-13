//
//  HTTPService.h
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/05.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+ (id) instance;
- (void) getTutorials:(nullable onComplete)completeHandler;

@end
