//
//  HJTabarItemButton.m
//  HJShop
//
//  Created by Red-Fish on 2020/3/13.
//  Copyright © 2020 HJShop. All rights reserved.
//

#import "HJTabbarItemButton.h"

#import "UILabel+Util.h"
#import "NSString+Size.h"

@interface HJTabbarItemButton ()

@property (nonatomic, strong) UILabel *numLbl;

@end

@implementation HJTabbarItemButton

- (void)setBadge:(int)badge {
    _badge = badge;
    
    self.numLbl.hidden = (badge <= 0);
    
    if (!self.numLbl.hidden) {
        self.numLbl.text = [NSString stringWithFormat:@"+%d", badge];
    }
    
    [self setNeedsLayout];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat width = [self.numLbl.text getWidthWithFont:self.numLbl.font height:16.0];
    CGFloat height = 16.0;
    self.numLbl.frame = CGRectMake( self.width - width, - (height / 2.0), width, height);
}

- (void)addSubviews {
    [self addSubviews:@[
        self.numLbl
    ]];
}

- (UILabel *)numLbl {
    if (!_numLbl) {
        _numLbl = [UILabel labelWithFont:[UIFont systemFontOfSize:14.0] textColor:[UIColor whiteColor]];
        _numLbl.backgroundColor = [UIColor redColor];
        _numLbl.textAlignment = NSTextAlignmentCenter;
        _numLbl.hidden = YES;
    }
    return _numLbl;
}

@end
