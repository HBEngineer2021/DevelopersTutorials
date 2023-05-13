//
//  QiitaListCell.m
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/10.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import "QiitaListCell.h"
#import "QiitaModel.h"
#import "User.h"

@interface QiitaListCell()
@property (weak, nonatomic) IBOutlet UILabel *articleTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *articleDescriptionLabel;
@end

@implementation QiitaListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupLayout {
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0 / 255.0 green:157.0 / 255.0 blue:157.0 / 255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.cornerRadius = 60;
}

- (void)updateQiita:(QiitaModel *)qiita {
    self.articleTitleLabel.text = qiita.title;
    NSString *description = [(NSDictionary*)qiita.user objectForKey:@"description"];
    if (description != nil) {
        self.articleDescriptionLabel.text = description;
    }
    NSString *imageURL = [(NSDictionary*)qiita.user objectForKey:@"profile_image_url"];
    UIImage *profileImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]];
    if (imageURL != nil && profileImage != nil) {
        self.profileImageView.image = profileImage;
    }
}

@end
