//
//  User.h
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/06.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *profileImageUrl;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
