//
//  MeVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/11.
//  Copyright © 2023 chc. All rights reserved.
//

#import "MeVC.h"
#import "AppDelegate.h"
#import "LoginVC.h"
@interface MeVC ()

@property (nonatomic, strong) UIImageView *bgV;
@property (nonatomic, strong) UIButton *logoutBtn;

@end

@implementation MeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubviews:@[
        self.bgV,
        self.logoutBtn,
    ]];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#afb4db"];
    self.bgV.frame = self.view.bounds;
    self.logoutBtn.frame = CGRectMake((self.view.width - FitFloat(100.0)) / 2.0, (self.view.height -  FitFloat(44.0)) - FitFloat(100.0), FitFloat(100.0), FitFloat(44.0));
}

- (void)logoutBtnAction {
    HZUserDefault.didLogin = NO;
    AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = [[LoginVC alloc] init];
}

- (UIImageView *)bgV {
    if (!_bgV) {
        _bgV = [[UIImageView alloc] init];
        _bgV.image = [UIImage imageNamed:@"main_view_2"];
    }
    return _bgV;
}

- (UIButton *)logoutBtn {
    if (!_logoutBtn) {
        _logoutBtn = [UIButton buttonWithTitle:@"退出登录" color:[UIColor whiteColor] font:FitFontNormal(20.0)];
        _logoutBtn.backgroundColor = [UIColor colorWithHexString:@"#5EB9A9"];
        _logoutBtn.layer.cornerRadius = FitFloat(22.0);
        _logoutBtn.layer.masksToBounds = YES;
        [_logoutBtn addTarget:self action:@selector(logoutBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}

@end
