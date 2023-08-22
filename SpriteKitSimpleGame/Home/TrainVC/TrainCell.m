//
//  TrainCell.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/18.
//  Copyright © 2023 chc. All rights reserved.
//

#import "TrainCell.h"

@interface TrainCell ()

@property (nonatomic, strong) STImageView *bgV;
@property (nonatomic, strong) UIView *maskV;
@property (nonatomic, strong) STImageView *headImgV;
@property (nonatomic, strong) UILabel *nameLbl;
@property (nonatomic, strong) UILabel *tagLbl1;
@property (nonatomic, strong) UILabel *tagLbl2;
@property (nonatomic, strong) UILabel *subLbl;
@property (nonatomic, strong) UILabel *tipLbl;


@end

@implementation TrainCell

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
     
    self.bgV.image = [UIImage imageNamed:dataArray[0]];
//    [self.bgV setUrl:dataArray[0] placehodlerName:@"train_bg"];
    self.headImgV.hidden = [dataArray[1] length] == 0;
    [self.headImgV setUrl:dataArray[1] placehodlerName:@"home_head"];
    self.nameLbl.text = dataArray[2];
    self.nameLbl.hidden = [dataArray[2] length] == 0;
    
    self.tagLbl1.text = dataArray[3];
    self.tagLbl2.text = dataArray[4];
    self.subLbl.text = dataArray[5];
    self.tipLbl.text = dataArray[6];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

+ (CGFloat)height {
    return FitFloat(166.0 + 20.0);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubviews:@[
            self.bgV,
            
        ]];
        
        [self.bgV addSubviews:@[
            self.maskV,
            self.headImgV,
            self.nameLbl,
            self.tagLbl1,
            self.tagLbl2,
            self.subLbl,
            self.tipLbl
        ]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.bgV.frame = CGRectMake(FitFloat(21.0), FitFloat(20.0), self.width - FitFloat(21.0 * 2), self.height - FitFloat(20.0));
    self.maskV.frame = self.bgV.bounds;
    
    CGFloat leftX = FitFloat(24.0);
    if (!self.headImgV.hidden) {
        self.headImgV.frame = CGRectMake(leftX, FitFloat(22.0), FitFloat(30.0), FitFloat(30.0));
        leftX = self.headImgV.right;
    }
    
    if (!self.nameLbl.hidden) {
        self.nameLbl.frame = CGRectMake(leftX + FitFloat(8.0), FitFloat(28.0), [self.nameLbl.text getWidthWithFont:self.nameLbl.font height:FitFloat(17.0)], FitFloat(17.0));
        leftX = self.nameLbl.right;
    }
    
    CGFloat width = [self.tagLbl1.text getWidthWithFont:self.tagLbl1.font height:18.0] + FitFloat(5.0 * 2);
    self.tagLbl1.frame = CGRectMake(leftX + FitFloat(8.0), FitFloat(28.0), width, FitFloat(18.0));
    width = [self.tagLbl2.text getWidthWithFont:self.tagLbl2.font height:18.0] + FitFloat(5.0 * 2);
    self.tagLbl2.frame = CGRectMake(self.tagLbl1.right + FitFloat(8.0), self.tagLbl1.y, width, self.tagLbl1.height);
    self.subLbl.frame = CGRectMake(FitFloat(24.0), FitFloat(101.0), self.bgV.width - FitFloat(24.0 * 2), FitFloat(28.0));
    self.tipLbl.frame = CGRectMake(FitFloat(24.0), self.subLbl.bottom + FitFloat(5.0), self.subLbl.width, FitFloat(17.0));
}

- (UIView *)maskV {
    if (!_maskV) {
        _maskV = [[UIView alloc] init];
        _maskV.backgroundColor = [UIColor colorWithHexString:@"#3F3E4573"].alpha(0.45);
        _maskV.layer.cornerRadius = FitFloat(15.0);
        _maskV.layer.masksToBounds = YES;
    }
    return _maskV;
}

- (STImageView *)bgV {
    if (!_bgV) {
        _bgV = [[STImageView alloc] init];
        _bgV.image = [UIImage imageNamed:@"home_recommand_bg"];
        _bgV.layer.cornerRadius = FitFloat(15.0);
        _bgV.layer.masksToBounds = YES;
    }
    return _bgV;
}

- (STImageView *)headImgV {
    if (!_headImgV) {
        _headImgV = [[STImageView alloc] init];
        _headImgV.layer.cornerRadius = FitFloat(15.0);
        _headImgV.layer.masksToBounds = YES;
        _headImgV.layer.borderColor = [UIColor whiteColor].CGColor;
        _headImgV.layer.borderWidth = 1.0;
    }
    return _headImgV;
}

- (UILabel *)nameLbl {
    if (!_nameLbl) {
        _nameLbl = [UILabel labelWithFont:FitFontNormal(12.0) textColor:[UIColor whiteColor]];
    }
    return _nameLbl;
}

- (UILabel *)tagLbl1 {
    if (!_tagLbl1) {
        _tagLbl1 = [UILabel labelWithFont:FitFontNormal(10.0) textColor:[UIColor whiteColor]];
        _tagLbl1.backgroundColor = [UIColor colorWithHexString:@"#5EB9A9"];
        _tagLbl1.textAlignment = NSTextAlignmentCenter;
        _tagLbl1.layer.cornerRadius = FitFloat(5.0);
        _tagLbl1.layer.masksToBounds = YES;
    }
    return _tagLbl1;
}

- (UILabel *)tagLbl2 {
    if (!_tagLbl2) {
        _tagLbl2 = [UILabel labelWithFont:FitFontNormal(10.0) textColor:[UIColor whiteColor]];
        _tagLbl2.backgroundColor = [UIColor colorWithHexString:@"#836EFE"];
        _tagLbl2.textAlignment = NSTextAlignmentCenter;
        _tagLbl2.layer.cornerRadius = FitFloat(5.0);
        _tagLbl2.layer.masksToBounds = YES;
    }
    return _tagLbl2;
}

- (UILabel *)subLbl {
    if (!_subLbl) {
        _subLbl = [UILabel labelWithFont:FitFontBold(20.0) textColor:[UIColor whiteColor]];
    }
    return _subLbl;
}

- (UILabel *)tipLbl {
    if (!_tipLbl) {
        _tipLbl = [UILabel labelWithFont:FitFontBold(12.0) textColor:[UIColor colorWithHexString:@"#FFFFFF"]];
    }
    return _tipLbl;
}

@end
