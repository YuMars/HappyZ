//
//  TrainDetailCell.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/19.
//  Copyright © 2023 chc. All rights reserved.
//

#import "TrainDetailCell.h"

@interface TrainDetailCell ()

@property (nonatomic, strong) STImageView *bgV;
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *timeLbl;
@property (nonatomic, strong) UIImageView *maskV;


@end

@implementation TrainDetailCell

- (void)setData:(NSMutableArray *)data {
    _data = data;
    
    [self.bgV setUrl:data[0] placehodlerName:@"train_detail_bg"];
    self.titleLbl.text = data[1];
    self.timeLbl.text = data[2];
    
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubviews:@[
            self.bgV,
            self.maskV,
            self.titleLbl,
            self.timeLbl,

        ]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bgV.frame = self.bounds;
    self.maskV.frame = self.bounds;
    self.timeLbl.frame = CGRectMake(self.width - FitFloat(53.0), FitFloat(109.0), FitFloat(53.0), FitFloat(17.0));
    self.titleLbl.frame = CGRectMake(FitFloat(15.0), FitFloat(109.0), self.timeLbl.left - FitFloat(15.0) - FitFloat(5.0), FitFloat(17.0));
    
    
}

- (STImageView *)bgV {
    if (!_bgV) {
        _bgV = [[STImageView alloc] init];
        _bgV.image = [UIImage imageNamed:@"home_recommand_bg"];
        _bgV.layer.cornerRadius = FitFloat(12.0);
        _bgV.layer.masksToBounds = YES;
    }
    return _bgV;
}

- (UIImageView *)maskV {
    if (!_maskV) {
        _maskV = [[UIImageView alloc] init];
        _maskV.image = [UIImage imageNamed:@"train_detail_mask"];
    }
    return _maskV;
}

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [UILabel labelWithFont:FitFontNormal(12.0) textColor:[UIColor whiteColor]];
    }
    return _titleLbl;
}

- (UILabel *)timeLbl {
    if (!_timeLbl) {
        _timeLbl = [UILabel labelWithFont:FitFontNormal(12.0) textColor:[UIColor whiteColor]];
    }
    return _timeLbl;
}

@end
