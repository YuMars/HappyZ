//
//  ResultVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/18.
//  Copyright © 2023 chc. All rights reserved.
//

#import "ResultVC.h"

@interface ResultVC ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIButton *doneBtn;

@end

@implementation ResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubviews:@[
        self.label,
        self.doneBtn,
    ]];
    
    self.label.frame = self.view.bounds;
    
    self.doneBtn.frame = CGRectMake((self.view.width - FitFloat(110.0)) / 2.0, self.view.height - FitFloat(48.0 + 36.0), FitFloat(110.0), FitFloat(36.0));
}

- (void)doneBtnAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (UILabel *)label {
    if (!_label) {
        _label = [UILabel labelWithText:@"训练结束\n这个是数据页" font:FitFontBold(30.0) textColor:[UIColor blackColor]];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
    }
    return _label;
}

- (UIButton *)doneBtn {
    if (!_doneBtn) {
        _doneBtn = [UIButton buttonWithTitle:@"完成" color:[UIColor whiteColor] font:FitFontBold(20.0)];
        _doneBtn.backgroundColor = [UIColor colorWithHexString:@"#5EB9A9"];
        _doneBtn.layer.cornerRadius = FitFloat(18.0);
        _doneBtn.layer.masksToBounds = YES;
        [_doneBtn addTarget:self action:@selector(doneBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}

@end
