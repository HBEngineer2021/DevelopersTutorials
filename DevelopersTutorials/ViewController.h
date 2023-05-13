//
//  ViewController.h
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/05.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (void)getQiitaArticleData;
- (void)setupLayout;
- (void)reloadQiitaArticleData;
@end

