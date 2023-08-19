//
//  HomeHeaderView.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/17.
//  Copyright © 2023 chc. All rights reserved.
//

#import "HomeHeaderView.h"

@interface HomeHeaderView()

@property (nonatomic, strong) UIImageView *timeImgV;
@property (nonatomic, strong) UILabel *timeLbl;
@property (nonatomic, strong) UILabel *tipLbl;
@property (nonatomic, strong) UIView *shadowV;
@property (nonatomic, strong) UIImageView *headImgV;
@property (nonatomic, strong) UILabel *dayLbl;
@property (nonatomic, strong) UIImageView *progressImgV;

@end

@implementation HomeHeaderView

+ (CGFloat)height {
    return FitFloat(220.0) + StatusBarHeight;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubviews:@[
            self.shadowV,
            self.timeImgV,
            self.timeLbl,
            self.tipLbl,
            self.headImgV,
            self.dayLbl,
            self.progressImgV,
        ]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.timeImgV.frame = CGRectMake(FitFloat(5.0), StatusBarHeight + FitFloat(5.0), FitFloat(38.0), FitFloat(38.0));
    self.headImgV.frame = CGRectMake(self.shadowV.right - FitFloat(10.0 + 80.0) , StatusBarHeight + FitFloat(30.0), FitFloat(80.0), FitFloat(80.0));
    self.timeLbl.frame = CGRectMake(FitFloat(40.0), StatusBarHeight + FitFloat(40.0), self.headImgV.left - FitFloat(40.0) - FitFloat(5.0), FitFloat(34.0));
    self.tipLbl.frame = CGRectMake(FitFloat(40.0), self.timeLbl.bottom + FitFloat(3.0), FitFloat(250.0), FitFloat(21.0));
    self.shadowV.frame = CGRectMake(FitFloat(20.0), StatusBarHeight + FitFloat(20.0), self.width - FitFloat(20.0 * 2), FitFloat(135.0));
    
    self.dayLbl.frame = CGRectMake(FitFloat(20.0), self.shadowV.bottom, FitFloat(150.0), FitFloat(30.0));
    self.progressImgV.frame = CGRectMake(FitFloat(18.0), self.dayLbl.bottom, self.width - FitFloat(18.0) - FitFloat(25.0), FitFloat(30.0));
}

- (UIImageView *)timeImgV {
    if (!_timeImgV) {
        _timeImgV = [[UIImageView alloc] init];
        _timeImgV.image = [UIImage imageNamed:@"home_time"];
    }
    return _timeImgV;
}

- (UILabel *)timeLbl {
    if (!_timeLbl) {
        _timeLbl = [UILabel labelWithText:@"早上好！心向阳光" font:FitFontBold(24.0) textColor:[UIColor colorWithHexString:@"#565656"]];
    }
    return _timeLbl;
}

- (UILabel *)tipLbl {
    if (!_tipLbl) {
        _tipLbl = [UILabel labelWithText:@"让更恰当的运动，带来更好更快的康复" font:FitFontNormal(14.0) textColor:[UIColor colorWithHexString:@"#484848"]];
    }
    return _tipLbl;
}

- (UIView *)shadowV {
    if (!_shadowV) {
        _shadowV = [[UIView alloc] init];
        _shadowV.backgroundColor = [UIColor whiteColor];
        _shadowV.layer.cornerRadius = FitFloat(15.0);
        _shadowV.layer.shadowColor = [UIColor blackColor].alpha(0.03).CGColor;
        _shadowV.layer.shadowOpacity = 1.0;
        _shadowV.layer.shadowRadius = FitFloat(4.0);
        _shadowV.layer.shadowOffset = CGSizeMake(0.0, FitFloat(4.0));
    }
    return _shadowV;
}

- (UIImageView *)headImgV {
    if (!_headImgV) {
        _headImgV = [[UIImageView alloc] init];
        _headImgV.image = [UIImage imageNamed:@"home_head"];
    }
    return _headImgV;
}

- (UILabel *)dayLbl {
    if (!_dayLbl) {
        _dayLbl = [UILabel labelWithText:@"DAY 5" font:FitFontNormal(20.0) textColor:[UIColor colorWithHexString:@"#397167"]];
    }
    return _dayLbl;
}

- (UIImageView *)progressImgV {
    if (!_progressImgV) {
        _progressImgV = [[UIImageView alloc] init];
        _progressImgV.image = [UIImage imageNamed:@"home_progress"];
    }
    return _progressImgV;
}

@end
