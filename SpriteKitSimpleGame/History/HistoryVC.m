//
//  HistoryVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/11.
//  Copyright © 2023 chc. All rights reserved.
//

#import "HistoryVC.h"

@interface HistoryVC ()

@property (nonatomic, strong) UIImageView *bgV;

@end

@implementation HistoryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.view addSubviews:@[
        self.bgV
    ]];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#45b97c"];
    self.bgV.frame = self.view.bounds;
}

- (UIImageView *)bgV {
    if (!_bgV) {
        _bgV = [[UIImageView alloc] init];
        _bgV.image = [UIImage imageNamed:@"main_view_3"];
    }
    return _bgV;
}

@end
