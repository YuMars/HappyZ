//
//  HomeVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/11.
//  Copyright © 2023 chc. All rights reserved.
//

#import "HomeVC.h"
#import "HomeHeaderView.h"
#import "HomeRecommandCell.h"
#import "HomeTraningCell.h"

@interface HomeVC ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *recommandArray;
@property (nonatomic, strong) NSMutableArray *trainArray;

@end

@implementation HomeVC



#pragma mark – Public Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.tableView];
    
    self.tableView.frame = self.view.bounds;
    
    self.recommandArray = [NSMutableArray arrayWithArray:@[
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
          @"今日训练计划",
          @"习惯养成",
          @"术后2-3天",
          @"DAY 5-踝关节康复",
          @"10分钟髋关节置换下地行走打卡"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
          @"运动小tips",
          @"科学训练",
          @"",
          @"练前热身 练后拉伸",
          @"练前练后的热身拉伸运动"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],@"明日训练计划", @"跟练计划",
          @"坚持",
          @"如何做到循环呼吸",
          @"两步一呼两步一吸"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
          @"膝盖恢复",
          @"半月板",
          @"明天",
          @"身体的蜕变离不开坚定的意志",
          @"大体重尽量避免"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
          @"酷暑开练",
          @"逆袭",
          @"",
          @"是狂热还是痴狂",
          @"提升耐力"],
    ].mutableCopy];
    
    self.trainArray = [NSMutableArray arrayWithArray:@[
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000], @"官方教程", @"术后2周", @"5分钟辅助被动抬腿训练",@"W1 术后1周 防静脉血栓"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000], @"AR趣味课", @"术后1周", @"5分钟下肢力量",@"W1 术后1周"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000], @"逆袭", @"术后", @"是狂热还是痴狂",@"提升耐力"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000], @"跟练计划", @"坚持", @"如何做到循环呼吸", @"两步一呼两步一吸"],
        @[[NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000], @"半月板", @"明天", @"身体的蜕变离不开坚定的意志",@"大体重尽量避免"],
    ].mutableCopy];
}

#pragma mark – Override

#pragma mark – Private Methods

#pragma mark – Private Selector

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [HomeHeaderView height];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HomeHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([HomeHeaderView class])];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return [HomeRecommandCell height];
    } else {
        return [HomeTraningCell height];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HomeRecommandCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeRecommandCell class])];
        cell.dataArray = self.recommandArray;
        return cell;
    } else {
        HomeTraningCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeTraningCell class])];
        cell.dataArray = self.trainArray;
        return cell;
    }
}

#pragma mark - Custom Delegates

#pragma mark - Private Property


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        
        if (@available(iOS 15.0, *)) {
            self.tableView.sectionHeaderTopPadding = CGFLOAT_MIN;
        }
        
        if (@available(iOS 11.0, *)) {
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        if (@available(iOS 13.0, *)) {
            _tableView.automaticallyAdjustsScrollIndicatorInsets = NO;
        }
        
        [_tableView registerClass:[HomeHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([HomeHeaderView class])];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        [_tableView registerClass:[HomeRecommandCell class] forCellReuseIdentifier:NSStringFromClass([HomeRecommandCell class])];
        [_tableView registerClass:[HomeTraningCell class] forCellReuseIdentifier:NSStringFromClass([HomeTraningCell class])];
    }
    return _tableView;
}

@end
