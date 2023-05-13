//
//  User.m
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/06.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import "User.h"

@implementation User
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _name = [dictionary objectForKey:@"name"];
        _profileImageUrl = [dictionary objectForKey:@"profile_image_url"];
    }
    return self;
}
@end
