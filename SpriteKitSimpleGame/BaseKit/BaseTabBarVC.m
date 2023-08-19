//
//  BaseTabBarVC.m
//  5GST
//
//  Created by Red-Fish on 2020/4/10.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "BaseTabBarVC.h"

#import "BaseNavigationVC.h"

#import "HJTabbarItemButton.h"

#define TAG_INIT_NUM 100

//#import "BaseTabBarItem.h"

@interface BaseTabBarVC ()
<
UITabBarControllerDelegate
>

@property (nonatomic, strong) NSArray <NSArray *> *tabbarTitleImgArray;
@property (nonatomic, strong) NSMutableArray <HJTabbarItemButton *> *tabBarItems;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) HJTabbarItemButton *lastSelectedBtn;

@end

@implementation BaseTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setBarTintColor:[UIColor clearColor]];
    
//    [[UITabBarItem appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor STColorEFF7FF], NSFontAttributeName : [UIFont systemFontOfSize:10.0],} forState:UIControlStateNormal];
    
//    [[UITabBarItem appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName : [UIColor STColor64DE90], NSFontAttributeName : [UIFont systemFontOfSize:10.0],} forState:UIControlStateSelected];
    
    self.delegate = self;
    [self addAllChildVC];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.selectedViewController = self.viewControllers[0];
    
    [self.tabBar removeAllSubviews];
    [self.tabBar addSubview:self.bottomView];
    [self.tabBar bringSubviewToFront:self.bottomView];
    [self initBottomBar];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.bottomView.frame = self.tabBar.bounds;
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSUInteger selIndex = tabBarController.selectedIndex;
    for (NSInteger i = 0; i < 4; i++) {
        UIButton * btn = [self.bottomView viewWithTag:TAG_INIT_NUM + i];
        btn.selected = (selIndex == i);
        if (selIndex == i ) {
            [self tabBarButtonClick:btn];
        }
    }
    
}

#pragma mark - Method

- (void)addAllChildVC {
    [self.tabbarTitleImgArray enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIViewController *vc = [NSClassFromString(obj[1]) new];
//        vc.tabBarItem.title = obj[0];
//        vc.tabBarItem.image = [[UIImage imageNamed:obj[2]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        vc.tabBarItem.selectedImage = [[UIImage imageNamed:obj[3]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        BaseNavigationVC *naVC = [[BaseNavigationVC alloc] initWithRootViewController:vc];
        [self addChildViewController:naVC];
    }];
}

- (void)initBottomBar {
    CGFloat w = ScreenWidth / 4.0f;
    
    [self.tabbarTitleImgArray enumerateObjectsUsingBlock:^(NSArray * _Nonnull array, NSUInteger idx, BOOL * _Nonnull stop) {
        HJTabbarItemButton *btn = [HJTabbarItemButton buttonWithType:UIButtonTypeCustom];
//        [btn setContentEdgeInsets:UIEdgeInsetsMake(7.0, 0, 0, 0)];
//        [btn.titleLabel setFont:[UIFont systemFontOfSize:10.0]];
//        [btn setTitle:array[0] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor STColorEFF7FF] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor STColor64DE90] forState:UIControlStateSelected];
        btn.tag = TAG_INIT_NUM + idx;
        [btn addTarget:self action:@selector(openTabAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (idx == 0) {
            self.lastSelectedBtn = btn;
            btn.selected = YES;
        }
        
//        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.frame = CGRectMake(w * idx, 0.0, w , self.tabBar.height);
//        [btn setTitleRect:CGRectMake(0, 35.0, w, 16)];
//        [btn setImageRect:CGRectMake((w - 25.0)/2.0f , 7.0, w, 25.0)];
        
        [btn setImage:[[[UIImage imageNamed:array[2]] imageChangeColor:[UIColor colorWithHexString:@"#333333"]] imageChangeColor:[UIColor colorWithHexString:@"#999999"]] forState:UIControlStateNormal];
        [btn setImage:[[UIImage imageNamed:array[3]] imageChangeColor:[UIColor colorWithHexString:@"#836EFE"]] forState:UIControlStateSelected];
        [btn setImage:[[UIImage imageNamed:array[3]] imageChangeColor:[UIColor colorWithHexString:@"#836EFE"]] forState:UIControlStateFocused];
        [btn setImage:[[UIImage imageNamed:array[3]] imageChangeColor:[UIColor colorWithHexString:@"#836EFE"]] forState:UIControlStateHighlighted];
        
        
        [self.tabBarItems addObject:btn];
        [self.bottomView addSubview:btn];
    }];
}

- (void)openTabAction:(UIButton *)sender {
    self.lastSelectedBtn.selected = NO;
    NSInteger idx = sender.tag - TAG_INIT_NUM;
    self.selectedIndex = idx;
    
    self.tabBarItems[idx].selected = YES;
    self.lastSelectedBtn = self.tabBarItems[idx];
    
    switch (self.selectedIndex) {
        case 0: self.bottomView.backgroundColor = [UIColor whiteColor]; break;
        case 1: self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#deab8a"]; break;
        case 2: self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#45b97c"]; break;
        case 3: self.bottomView.backgroundColor = [UIColor colorWithHexString:@"#afb4db"]; break;
        default: break;
    }
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton {
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UIImageView")]) {
            //需要实现的帧动画,这里根据自己需求改动
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.0];
            animation.duration = 0.3;
            animation.calculationMode = kCAAnimationCubic;
            //添加动画
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}

#pragma mark - Selector

//- (void)openTabbarAction:(BaseTabBarItem *)item {
//    self.selectedIndex = item.tag;
//}


//- (UIView *)tabbarView {
//    if (!_tabbarView) {
//        _tabbarView = [[UIView alloc] init];
//        _tabbarView.backgroundColor = [UIColor purpleColor];
//    }
//    return _tabbarView;
//}

- (NSArray<NSArray *> *)tabbarTitleImgArray {
    if (!_tabbarTitleImgArray) {
        _tabbarTitleImgArray = @
        [@[@"首页", @"HomeVC", @"tab_1", @"tab_1",],
         @[@"运动", @"SportVC", @"tab_2", @"tab_2",],
         @[@"锻炼记录", @"HistoryVC", @"tab_3", @"tab_3",],
         @[@"我的", @"MeVC", @"tab_4", @"tab_4",],];
    }
    return _tabbarTitleImgArray;
}

- (NSMutableArray<HJTabbarItemButton *> *)tabBarItems {
    if (!_tabBarItems) {
        _tabBarItems = [[NSMutableArray alloc] init];
    }
    return _tabBarItems;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

@end
