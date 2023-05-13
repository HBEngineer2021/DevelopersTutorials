//
//  QiitaListCell.h
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/10.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QiitaModel;

@interface QiitaListCell : UITableViewCell
- (void)updateQiita:(nonnull QiitaModel*)qiita;
- (void)setupLayout;
@end
