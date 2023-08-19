//
//  SportVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/11.
//  Copyright © 2023 chc. All rights reserved.
//

#import "SportVC.h"

@interface SportVC ()

@property (nonatomic, strong) UILabel *lbl;

@end

@implementation SportVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubviews:@[
        self.lbl
    ]];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#deab8a"];
    self.lbl.frame = self.view.bounds;
}


- (UILabel *)lbl {
    if (!_lbl) {
        _lbl = [UILabel labelWithText:@"第二个界面" font:FitFontNormal(36.0) textColor:[UIColor colorWithHexString:@"#ffffff"]];
        _lbl.textAlignment = NSTextAlignmentCenter;
    }
    return _lbl;
}

@end
