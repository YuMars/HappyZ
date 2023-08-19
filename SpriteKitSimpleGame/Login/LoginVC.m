//
//  LoginVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/17.
//  Copyright © 2023 chc. All rights reserved.
//

#import "LoginVC.h"

#import "AppDelegate.h"
#import "BaseTabBarVC.h"



@interface LoginVC ()

@property (nonatomic, strong) UIImageView *bgImgV;
@property (nonatomic, strong) UIButton *jumpBtn;
@property (nonatomic, strong) UIButton *otherPhoneBtn;
@property (nonatomic, strong) UIImageView *logoImgV;
@property (nonatomic, strong) UILabel *numLbl;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *wxBtn;
@property (nonatomic, strong) UIButton *qqBtn;
@property (nonatomic, strong) UIButton *moreBtn;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubviews:@[
        self.bgImgV,
        self.jumpBtn,
        self.otherPhoneBtn,
        self.logoImgV,
        self.numLbl,
        self.loginBtn,
        self.wxBtn,
        self.qqBtn,
        self.moreBtn,
    ]];
    
    self.bgImgV.frame = self.view.bounds;
    self.jumpBtn.frame = CGRectMake(0.0, StatusBarHeight, FitFloat(96.0), FitFloat(22.0));
    self.otherPhoneBtn.frame = CGRectMake(self.view.width - FitFloat(142.0), StatusBarHeight, FitFloat(142.0), FitFloat(22.0));
    self.logoImgV.frame = CGRectMake((self.view.width - FitFloat(364.0)) / 2.0, NavigationBarHeight + FitFloat(290.0), FitFloat(364.0), FitFloat(42.0));
    self.numLbl.frame = CGRectMake(0.0, self.logoImgV.bottom + FitFloat(150.0), self.view.width, FitFloat(50.0));
    self.loginBtn.frame = CGRectMake((self.view.width - FitFloat(212.0)) / 2.0, self.numLbl.bottom + FitFloat(20.0), FitFloat(212.0), FitFloat(44.0));
    self.wxBtn.frame = CGRectMake(FitFloat(106.0), self.loginBtn.bottom + FitFloat(85.0), FitFloat(40.), FitFloat(40.0));
    self.qqBtn.frame = CGRectMake(self.wxBtn.right + FitFloat(50.0), self.wxBtn.top, FitFloat(40.0), FitFloat(40.0));
    self.moreBtn.frame = CGRectMake(self.qqBtn.right + FitFloat(50.0), self.wxBtn.top, FitFloat(40.0), FitFloat(40.0));
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

- (void)jumpBtnAction {
    [self jumpToMainVC];
    
    [MBProgressHUD showMessage:@"正在跳过..."];
    
    HZUserDefault.didLogin = NO;
}

- (void)otherPhoneBtnAction {
    [self jumpToMainVC];
    
    [MBProgressHUD showSuccess:@"其他手机号登录，自动登录"];
    
    HZUserDefault.didLogin = YES;
}

- (void)loginBtnAction {
    [self jumpToMainVC];
    
    [MBProgressHUD showSuccess:@"一键登录成功"];
    
    HZUserDefault.didLogin = YES;
}

- (void)wxBtnAction {
    [self jumpToMainVC];
    
    [MBProgressHUD showSuccess:@"微信登录成功"];
    
    HZUserDefault.didLogin = YES;
}

- (void)qqBtnAction {
    [self jumpToMainVC];
    
    [MBProgressHUD showSuccess:@"QQ登录成功"];
    
    HZUserDefault.didLogin = YES;
}

- (void)moreBtnAction {
    [self jumpToMainVC];
    
    [MBProgressHUD showSuccess:@"更多方式登录成功"];
    
    HZUserDefault.didLogin = YES;
}

- (void)jumpToMainVC {
//    HZUserDefault.didLogin = NO;
    AppDelegate *appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    appDelegate.window.rootViewController = [[BaseTabBarVC alloc] init];
}

- (UIImageView *)bgImgV {
    if (!_bgImgV) {
        _bgImgV = [[UIImageView alloc] init];
        _bgImgV.image = [UIImage imageNamed:@"login_bg"];
    }
    return _bgImgV;
}

- (UIButton *)jumpBtn {
    if (!_jumpBtn) {
        _jumpBtn = [UIButton buttonWithTitle:@"跳过" color:[UIColor whiteColor] font:FitFontNormal(16.0)];
        [_jumpBtn addTarget:self action:@selector(jumpBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpBtn;
}

- (UIButton *)otherPhoneBtn {
    if (!_otherPhoneBtn) {
        _otherPhoneBtn = [UIButton buttonWithTitle:@"其他手机号登录" color:[UIColor whiteColor] font:FitFontNormal(16.0)];
        [_otherPhoneBtn addTarget:self action:@selector(otherPhoneBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _otherPhoneBtn;
}

- (UIImageView *)logoImgV {
    if (!_logoImgV) {
        _logoImgV = [[UIImageView alloc] init];
        _logoImgV.image = [UIImage imageNamed:@"login_logo"];
    }
    return _logoImgV;
}

- (UILabel *)numLbl {
    if (!_numLbl) {
        _numLbl = [UILabel labelWithText:@"195****2564" font:FitFontBold(36.0) textColor:[UIColor whiteColor]];
        _numLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _numLbl;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithTitle:@"一键登录/注册" color:[UIColor whiteColor] font:FitFontNormal(24.0)];
        _loginBtn.backgroundColor = [UIColor colorWithHexString:@"#836EFE"];
        _loginBtn.layer.masksToBounds = YES;
        _loginBtn.layer.cornerRadius = 22.0;
        [_loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)wxBtn {
    if (!_wxBtn) {
        _wxBtn = [[UIButton alloc] init];
        [_wxBtn setImage:[UIImage imageNamed:@"login_btn_wx"] forState:UIControlStateNormal];
        [_wxBtn addTarget:self action:@selector(wxBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wxBtn;
}

- (UIButton *)qqBtn {
    if (!_qqBtn) {
        _qqBtn = [[UIButton alloc] init];
        [_qqBtn setImage:[UIImage imageNamed:@"login_btn_qq"] forState:UIControlStateNormal];
        [_qqBtn addTarget:self action:@selector(qqBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qqBtn;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [[UIButton alloc] init];
        [_moreBtn setImage:[UIImage imageNamed:@"login_btn_more"] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

@end
