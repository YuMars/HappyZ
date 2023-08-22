//
//  TrainDetailVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/19.
//  Copyright © 2023 chc. All rights reserved.
//

#import "TrainDetailVC.h"
#import "GameViewController.h"
#import "TrainDetailCell.h"
#import <AVKit/AVKit.h>


@interface TrainDetailVC ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
AVPlayerViewControllerDelegate
>

@property (nonatomic, strong) AVPlayerViewController *playerV;
@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerItem *item;
@property (nonatomic, strong) UIImageView *playActionV;

@property (nonatomic, strong) UIView *topV;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UILabel *titleLbl;

@property (nonatomic, strong) UIView *playBG;
@property (nonatomic, strong) UIView *playcorV;
@property (nonatomic, strong) UILabel *courseLbl;

@property (nonatomic, strong) UICollectionView *collectionV;

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

@implementation TrainDetailVC

- (void)setString:(NSString *)string {
    _string = string;
    
    self.titleLbl.text = string;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[
        @[@"train_cover_1_1",
          @"课程开始",@"00:14"],
        @[@"train_cover_1_2",
          @"踝关节左右拉伸",@"02:14"],
        @[@"train_cover_1_3",
          @"踝关节环绕训练",@"20:54"],
        @[@"train_cover_1_4",
          @"踝关节动作保持",@"10:13"],
        @[@"train_cover_1_5",
          @"放松踝关节",@"14:14"],
        @[@"train_cover_1_6",
          @"练后拉伸",@"22:33"],
        @[@"train_cover_1_7",
          @"拉伸课程",@"03:16"],
        @[@"train_cover_1_8",
          @"放松动作",@"2c0:14"],
        @[@"train_cover_1_1",
          @"课程结束",@"00:14"]
    ].mutableCopy;
    
    [self player];
    
    [self.view addSubviews:@[
        self.topV,
        self.playBG,
        self.collectionV,
        self.bottomView,
    ]];
    
    [self.topV addSubviews:@[
        self.backBtn,
        self.titleLbl,
    ]];
    
    [self.playBG addSubviews:@[
        self.playerV.view,
        self.playcorV,
        self.courseLbl,
        self.playActionV,
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
    
    self.playBG.frame = CGRectMake(0.0, self.topV.bottom + FitFloat(20.0), self.view.width, FitFloat(248.0));
    self.playerV.view.frame = CGRectMake(0.0, 0.0, self.view.width, FitFloat(231.0));
//    self.playerV.view.frame = self.view.bounds;
    self.playcorV.frame = CGRectMake(0.0, FitFloat(212.0), self.view.width, FitFloat(46.0));
    self.courseLbl.frame = CGRectMake(FitFloat(31.0), FitFloat(226.0), self.view.width - FitFloat(31.0 * 2), FitFloat(22.0));
    self.playActionV.frame = CGRectMake(0.0, 0.0, FitFloat(50.0), FitFloat(50.0));
    self.playActionV.center = self.playerV.view.center;
    
    
    self.collectionV.frame = CGRectMake(0.0, self.playBG.bottom, self.view.width, self.view.height - self.bottomView.height - self.playBG.bottom - self.topV.height);
    
    self.bottomView.frame = CGRectMake(0.0, self.view.height - FitFloat(82.0), self.view.width, FitFloat(82.0));
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


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [self.avPlayer pause];
}

- (void)dealloc {
    [self.item removeObserver:self forKeyPath:@"loadedTimeRanges" context:nil];
    [self.item removeObserver:self forKeyPath:@"status" context:nil];
}

- (void)player {
    //设置本地视频路径
    NSString *mpath=[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"play%d", arc4random() % 3] ofType:@"mp4"];
    
    NSURL *url=[NSURL fileURLWithPath:mpath];
    
    AVAsset *asset = [AVAsset assetWithURL:url];
    
    self.item=[AVPlayerItem playerItemWithAsset:asset];
    
    //设置流媒体视频路径
    //self.item=[AVPlayerItem playerItemWithURL:movieURL];
    
    //设置AVPlayer中的AVPlayerItem
    self.avPlayer=[AVPlayer playerWithPlayerItem:self.item];
    
    //初始化AVPlayerViewController
    self.playerV = [[AVPlayerViewController alloc]init];
    self.playerV.showsPlaybackControls = YES;
    self.playerV.videoGravity = kCAGravityResizeAspect;
    [self addChildViewController:self.playerV];
    
    
    self.playerV.player=self.avPlayer;
    
    [self.view addSubview:self.playerV.view];
    
    self.playerV.delegate = self;
    
    [self.playerV.view addGestureTapTarget:self action:@selector(playActionVAction)];
    
    //替换AVPlayer中的AVPlayerItem
    //[self.player replaceCurrentItemWithPlayerItem:self.item];
    
    //监听status属性，注意监听的是AVPlayerItem
    [self.item addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    //监听loadedTimeRanges属性
    [self.item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    
    //设置监听函数，监听视频播放进度的变化，每播放一秒，回调此函数
    __weak __typeof(self) weakSelf = self;
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        //当前播放的时间
        NSTimeInterval current = CMTimeGetSeconds(time);
        //视频的总时间
        NSTimeInterval total = CMTimeGetSeconds(weakSelf.avPlayer.currentItem.duration);
        
        //输出当前播放的时间
        NSLog(@"now %f",current);
    }];
}

//AVPlayerItem监听的回调函数
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        double t=[self availableDurationWithplayerItem:self.item];
        NSLog(@"loadranges %f",t);
        
    }else if ([keyPath isEqualToString:@"status"]){
        if (playerItem.status == AVPlayerItemStatusReadyToPlay){
            NSLog(@"playerItem is ready");
            
            //如果视频准备好 就开始播放
//            [self.avPlayer play];
            
        } else if(playerItem.status==AVPlayerStatusUnknown){
            NSLog(@"playerItem Unknown错误");
        }
        else if (playerItem.status==AVPlayerStatusFailed){
            NSLog(@"playerItem 失败");
        }
    }
}

//计算缓冲进度的函数
- (NSTimeInterval)availableDurationWithplayerItem:(AVPlayerItem *)playerItem {
    NSArray *loadedTimeRanges = [playerItem loadedTimeRanges];
    CMTimeRange timeRange = [loadedTimeRanges.firstObject CMTimeRangeValue];// 获取缓冲区域
    NSTimeInterval startSeconds = CMTimeGetSeconds(timeRange.start);
    NSTimeInterval durationSeconds = CMTimeGetSeconds(timeRange.duration);
    NSTimeInterval result = startSeconds + durationSeconds;// 计算缓冲总进度
    return result;
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


#pragma mark - UICollectionViewDataSource UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TrainDetailCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TrainDetailCell class]) forIndexPath:indexPath];
    cell.data = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - Custom Delegates

- (void)playActionVAction {
    
    if (self.playActionV.hidden) {
        self.playActionV.hidden = NO;
        [self.avPlayer pause];
    } else {
        self.playActionV.hidden = YES;
        [self.avPlayer play];
    }

    
}

#pragma mark - Private Property

- (void)backBtnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UICollectionView *)collectionV {
    if (!_collectionV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = FitFloat(8.0);
        layout.minimumLineSpacing = FitFloat(9.0);
        // 横向滚动
        layout.scrollDirection  = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsMake(0.0, FitFloat(31.0), 0.0, FitFloat(31.0));
        layout.itemSize = CGSizeMake(FitFloat(181.0), FitFloat(133.0));
        // 使用UICollectionView必须设置UICollectionViewLayout属性
        _collectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionV.backgroundColor = [UIColor clearColor];
        _collectionV.dataSource = self;
        _collectionV.delegate = self;
        [_collectionV setShowsHorizontalScrollIndicator:NO];
        [_collectionV registerClass:[TrainDetailCell class] forCellWithReuseIdentifier:NSStringFromClass([TrainDetailCell class])];
    }
    return _collectionV;
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

- (UIView *)playBG {
    if (!_playBG) {
        _playBG = [[UIView alloc] init];
    }
    return _playBG;
}

- (UIImageView *)playActionV {
    if (!_playActionV) {
        _playActionV = [[UIImageView alloc] init];
        _playActionV.image = [UIImage imageNamed:@"train_detail_play"];
        _playActionV.hidden = YES;
    }
    return _playActionV;
}

- (UIView *)playcorV {
    if (!_playcorV) {
        _playcorV = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, ScreenWidth, FitFloat(46.0))];
        _playcorV.backgroundColor = [UIColor whiteColor];
        [_playcorV addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight radius:CGSizeMake(FitFloat(23.0), FitFloat(23.0))];
    }
    return _playcorV;
}

- (UILabel *)courseLbl {
    if (!_courseLbl) {
        _courseLbl = [UILabel labelWithText:@"课程阶段" font:FitFontNormal(16.0) textColor:[UIColor colorWithHexString:@"#222222"]];
    }
    return _courseLbl;
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
        [_rightImgV addGestureTapEventHandle:^(id sender, UITapGestureRecognizer *gestureRecognizer) {
            
            
        }];
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
