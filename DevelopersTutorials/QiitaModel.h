//
//  QiitaModel.h
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/06.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface QiitaModel : NSObject
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) User *user;
@property (nonatomic,strong) NSString *url;
@end
