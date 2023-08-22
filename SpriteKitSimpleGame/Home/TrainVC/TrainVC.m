//
//  TrainVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/18.
//  Copyright © 2023 chc. All rights reserved.
//

#import "TrainVC.h"
#import "TrainCell.h"
#import "GameViewController.h"
#import "TrainDetailVC.h"

@interface TrainVC ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UIView *topV;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UILabel *titleLbl;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UIImageView *likeImgV;
@property (nonatomic, strong) UILabel *likeLbl;

@property (nonatomic, strong) UIButton *dayBtn;
@property (nonatomic, strong) UIImageView *dayImgV;
@property (nonatomic, strong) UILabel *dayLbl;

@property (nonatomic, strong) UIImageView *leftImgV;
@property (nonatomic, strong) UIImageView *rightImgV;
@property (nonatomic, strong) UIImageView *eyeImgV;
@property (nonatomic, strong) UILabel *leftLbl;
@property (nonatomic, strong) UILabel *rightLbl;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation TrainVC


#pragma mark – Public Methods

- (void)setString:(NSString *)string {
    _string = string;
    
    self.titleLbl.text = string;
}

#pragma mark – Override

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[
        @[@"train_cover_1",
          [NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
        @"浙江省人民医院",@"习惯养成", @"术后2-3周", @"步态训练", @"W2 术后2-3天 5组 10分钟 健康第一步",],
        @[@"train_cover_2",
          [NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
        @"省立同德医院",@"趣味课", @"术后2周", @"股四头肌强化训练", @"W1 术后1周 15分钟 防静脉血栓",],
        @[@"train_cover_3",
          [NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
        @"",@"习惯养成", @"术后2-3周", @"步态训练", @"W2 术后2-3天 5组 10分钟 健康第一步",],
        @[@"train_cover_4",
          [NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
        @"",@"习惯养成", @"术后2-3周", @"步态训练", @"W2 术后2-3天 5组 10分钟 健康第一步",],
        @[@"train_cover_5",
          [NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
        @"",@"习惯养成", @"术后2-3周", @"步态训练", @"W2 术后2-3天 5组 10分钟 健康第一步",],
        @[@"train_cover_6",
          [NSString stringWithFormat:@"https://source.unsplash.com/random/%dx%d", arc4random() % 1000,arc4random() % 1000],
        @"",@"习惯养成", @"术后2-3周", @"步态训练", @"W2 术后2-3天 5组 10分钟 健康第一步",],
    ].mutableCopy;
    
    [self.view addSubviews:@[
        self.topV,
//        self.backBtn,
//        self.titleLbl,
        self.tableView,
        self.bottomView,
    ]];
    
    [self.topV addSubviews:@[
        self.backBtn,
        self.titleLbl,
    ]];
    
    [self.bottomView addSubviews:@[
        self.likeLbl,
        self.likeImgV,
        self.likeBtn,
        self.dayLbl,
        self.dayImgV,
        self.dayBtn,
        self.leftImgV,
        self.rightImgV,
        self.eyeImgV,
        self.leftLbl,
        self.rightLbl,
    ]];
    
    self.topV.frame = CGRectMake(0.0, 0.0, self.view.width, NavigationBarHeight);
    self.backBtn.frame = CGRectMake(FitFloat(19.0), FitFloat(13.0) + StatusBarHeight, FitFloat(44.0), FitFloat(44.0));
    self.titleLbl.frame = CGRectMake(0.0, StatusBarHeight + FitFloat(19.0), self.view.width, FitFloat(34.0));
    self.bottomView.frame = CGRectMake(0.0, self.view.height - FitFloat(82.0), self.view.width, FitFloat(82.0));
    self.tableView.frame = CGRectMake(0.0, self.topV.bottom, self.view.width, self.view.height - self.bottomView.height - self.topV.height);
    
    
    self.likeImgV.frame = CGRectMake(FitFloat(58.0), FitFloat(14.0), FitFloat(27.0), FitFloat(27.0));
    self.likeLbl.frame = CGRectMake(FitFloat(48.0), self.likeImgV.bottom, FitFloat(48.0), FitFloat(17.0));
    self.likeBtn.frame = CGRectMake(self.likeLbl.left, self.likeImgV.y, self.likeLbl.width, self.likeLbl.bottom - self.likeImgV.y);
    
    self.dayImgV.frame = CGRectMake(self.likeImgV.right + FitFloat(35.0), self.likeImgV.y, FitFloat(27.0), FitFloat(27.0));
    self.dayLbl.frame = CGRectMake(self.likeBtn.right + FitFloat(14.0), self.likeLbl.y, FitFloat(50.0), FitFloat(17.0));
    self.dayBtn.frame = CGRectMake(self.likeBtn.right + FitFloat(15.0), self.likeBtn.y, self.likeBtn.width, self.likeBtn.height);
    self.leftImgV.frame = CGRectMake(FitFloat(206.0), FitFloat(19.0), FitFloat(110.0), FitFloat(36.0));
    self.rightImgV.frame = CGRectMake(self.leftImgV.left + FitFloat(84.0), self.leftImgV.y, FitFloat(110.0), FitFloat(36.0));
    self.eyeImgV.frame = CGRectMake(self.leftImgV.left + FitFloat(15.0), self.leftImgV.top + FitFloat(12.0), FitFloat(14.0), FitFloat(11.0));
    self.leftLbl.frame = CGRectMake(self.leftImgV.x + FitFloat(33.0), self.leftImgV.y, FitFloat(56.0), self.leftImgV.height);
    self.rightLbl.frame = CGRectMake(self.rightImgV.x + FitFloat(26.88), self.leftImgV.y, FitFloat(56.0), self.leftImgV.height);
}


#pragma mark – Private Methods

#pragma mark – Private Selector

- (void)likeBtnAction {
    if (self.likeBtn.selected) {
        self.likeLbl.textColor = [UIColor colorWithHexString:@"#414141"];
        self.likeImgV.image = [UIImage imageNamed:@"train_like"];
    } else {
        self.likeLbl.textColor = [UIColor redColor];
        self.likeImgV.image = [[UIImage imageNamed:@"train_like"] imageChangeColor:[UIColor redColor]];
    }
    
    self.likeBtn.selected = !self.likeBtn.selected;
}

- (void)dayBtnAction {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"calshow://"]];
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TrainCell height];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TrainCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TrainCell class])];
    cell.dataArray = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TrainDetailVC *vc = [[TrainDetailVC alloc] init];
    vc.string = self.dataArray[indexPath.row][5];
    vc.data = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Custom Delegates

#pragma mark - Private Property

- (void)backBtnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIView *)topV {
    if (!_topV) {
        _topV = [[UIView alloc] init];
        _topV.backgroundColor = [UIColor whiteColor];
    }
    return _topV;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [[UIButton alloc] init];
        [_backBtn setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [UILabel labelWithText:@"训练计划" font:FitFontBold(24.0) textColor:[UIColor colorWithHexString:@"#222222"]];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLbl;
}

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
        
        [_tableView registerClass:[TrainCell class] forCellReuseIdentifier:NSStringFromClass([TrainCell class])];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.cornerRadius = FitFloat(15.0);
        _bottomView.layer.shadowColor = [UIColor blackColor].alpha(0.03).CGColor;
        _bottomView.layer.shadowOpacity = 1.0;
        _bottomView.layer.shadowRadius = FitFloat(4.0);
        _bottomView.layer.shadowOffset = CGSizeMake(0.0, FitFloat(-4.0));
    }
    return _bottomView;
}

- (UILabel *)likeLbl {
    if (!_likeLbl) {
        _likeLbl = [UILabel labelWithText:@"点赞" font:FitFontNormal(12.0) textColor:[UIColor colorWithHexString:@"#414141"]];
        _likeLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _likeLbl;
}

- (UIImageView *)likeImgV {
    if (!_likeImgV) {
        _likeImgV = [[UIImageView alloc] init];
        _likeImgV.image = [UIImage imageNamed:@"train_like"];
    }
    return _likeImgV;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [[UIButton alloc] init];
        _likeBtn.selected = NO;
        [_likeBtn addTarget:self action:@selector(likeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}

- (UILabel *)dayLbl {
    if (!_dayLbl) {
        _dayLbl = [UILabel labelWithText:@"加入日历" font:FitFontNormal(12.0) textColor:[UIColor colorWithHexString:@"#414141"]];
        _dayLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _dayLbl;
}

- (UIImageView *)dayImgV {
    if (!_dayImgV) {
        _dayImgV = [[UIImageView alloc] init];
        _dayImgV.image = [UIImage imageNamed:@"train_day"];
    }
    return _dayImgV;
}

- (UIButton *)dayBtn {
    if (!_dayBtn) {
        _dayBtn = [[UIButton alloc] init];
        _dayBtn.selected = NO;
        [_dayBtn addTarget:self action:@selector(dayBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _dayBtn;
}

- (UIImageView *)leftImgV {
    if (!_leftImgV) {
        _leftImgV = [[UIImageView alloc] init];
        _leftImgV.image = [UIImage imageNamed:@"train_left"];
        _leftImgV.userInteractionEnabled = YES;
        @weakify(self);
        [_leftImgV addGestureTapEventHandle:^(id sender, UITapGestureRecognizer *gestureRecognizer) {
            @strongify(self);
            GameViewController *vc = [[GameViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _leftImgV;
}

- (UIImageView *)rightImgV {
    if (!_rightImgV) {
        _rightImgV = [[UIImageView alloc] init];
        _rightImgV.image = [UIImage imageNamed:@"train_right"];
        _rightImgV.userInteractionEnabled = YES;
    }
    return _rightImgV;
}

- (UIImageView *)eyeImgV {
    if (!_eyeImgV) {
        _eyeImgV = [[UIImageView alloc] init];
        _eyeImgV.image = [UIImage imageNamed:@"train_eye"];
    }
    return _eyeImgV;
}

- (UILabel *)leftLbl {
    if (!_leftLbl) {
        _leftLbl = [UILabel labelWithText:@"趣味训练" font:FitFontBold(12.0) textColor:[UIColor colorWithHexString:@"#ffffff"]];
    }
    return _leftLbl;
}

- (UILabel *)rightLbl {
    if (!_rightLbl) {
        _rightLbl = [UILabel labelWithText:@"普通训练" font:FitFontNormal(12.0) textColor:[UIColor colorWithHexString:@"#ffffff"]];
    }
    return _rightLbl;
}

@end
