//
//  ViewController.m
//  DevelopersTutorials
//
//  Created by Motoki Onayama on 2023/05/05.
//  Copyright © 2023年 Motoki Onayama. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "QiitaModel.h"
#import "QiitaListCell.h"
#import "User.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *qiitaListTableView;
@property (nonatomic,strong) NSArray *articleList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayout];
    [self getQiitaArticleData];
}

- (void)getQiitaArticleData {
    
    [[HTTPService instance]getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSLog(@"Dictionary: %@", dataArray.debugDescription);
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            
            for (NSDictionary *data in dataArray) {
                QiitaModel *model = [[QiitaModel alloc]init];
                model.title = [data objectForKey:@"title"];
                model.user = [data objectForKey:@"user"];
                model.url = [data objectForKey:@"url"];
                [arr addObject:model];
            }
            
            self.articleList = arr;
            NSLog(@"Qiita Article Data: %@", self.articleList);
            [self reloadQiitaArticleData];
            
        } else if (errMessage) {
            NSLog(@"Error Reason: %@", errMessage);
        }
    }];
    
}

- (void)setupLayout {
    // qiitaListTableView
    self.qiitaListTableView.dataSource = self;
    self.qiitaListTableView.delegate = self;
}

- (void)reloadQiitaArticleData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.qiitaListTableView reloadData];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QiitaListCell *cell = (QiitaListCell*)[tableView dequeueReusableCellWithIdentifier:@"QiitaListCell"];
    if (!cell) {
        cell = [[QiitaListCell alloc]init];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    QiitaModel *qiita = (QiitaModel*)[self.articleList objectAtIndex:indexPath.row];
    QiitaListCell *qiitaListCell = (QiitaListCell*)cell;
    [qiitaListCell updateQiita:qiita];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    QiitaModel *qiita = (QiitaModel*)[self.articleList objectAtIndex:indexPath.row];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:qiita.url]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:qiita.url]];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articleList.count;
}

@end
