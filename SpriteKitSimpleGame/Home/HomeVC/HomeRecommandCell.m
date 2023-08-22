//
//  HomeRecommandCell.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/17.
//  Copyright © 2023 chc. All rights reserved.
//

#import "HomeRecommandCell.h"
#import "TrainVC.h"
#import "ResultVC.h"
@interface HomeRecommandCollectionCell : UICollectionViewCell

@property (nonatomic, strong) STImageView *bgV;
@property (nonatomic, strong) UIView *maskV;
@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UILabel *tagLbl1;
@property (nonatomic, strong) UILabel *tagLbl2;
@property (nonatomic, strong) UILabel *subLbl;
@property (nonatomic, strong) UILabel *tipLbl;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation HomeRecommandCollectionCell

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;

//    [self.bgV setUrl:dataArray[0] placehodlerName:@"home_recommand_bg"];
    self.bgV.image = [UIImage imageNamed:dataArray[0]];
    self.titleLbl.text = dataArray[1];
    self.tagLbl1.text = dataArray[2];
    self.tagLbl2.hidden = [dataArray[3] length] == 0;
    self.tagLbl2.text = dataArray[3];
    self.subLbl.text = dataArray[4];
    self.tipLbl.text = dataArray[5];
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
    
    self.bgV.frame = self.bounds;
    self.maskV.frame = self.bgV.frame;
    self.titleLbl.frame = CGRectMake(FitFloat(18.0), FitFloat(13.0), self.width - FitFloat(18.0) * 2, FitFloat(28.0));
    CGFloat width = [self.tagLbl1.text getWidthWithFont:self.tagLbl1.font height:FitFloat(18.0)] + FitFloat(5.0 * 2);
    self.tagLbl1.frame = CGRectMake(FitFloat(18.0), self.titleLbl.bottom + FitFloat(5.0), width, FitFloat(18.0));
    width = [self.tagLbl2.text getWidthWithFont:self.tagLbl2.font height:FitFloat(18.0)] + FitFloat(5.0 * 2);
    self.tagLbl2.frame = CGRectMake(self.tagLbl1.right + FitFloat(5.0), self.titleLbl.bottom + FitFloat(5.0), width, FitFloat(20.0));
    self.subLbl.frame = CGRectMake(FitFloat(18.0), self.tagLbl1.bottom + FitFloat(76.0), self.width - FitFloat(10.0) * 2, FitFloat(20.0));
    self.tipLbl.frame = CGRectMake(FitFloat(18.0), self.subLbl.bottom + FitFloat(5.0), self.width - FitFloat(10.0) * 2, FitFloat(20.0));
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

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [UILabel labelWithFont:FitFontBold(20.0) textColor:[UIColor whiteColor]];
    }
    return _titleLbl;
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
        _tipLbl = [UILabel labelWithFont:FitFontNormal(12.0) textColor:[UIColor colorWithHexString:@"#EDEDED"]];
    }
    return _tipLbl;
}


@end

@interface HomeRecommandCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UICollectionView *collectV;

@end

@implementation HomeRecommandCell

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    
    [self.collectV reloadData];
}

+ (CGFloat)height {
    return FitFloat(200.0);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubviews:@[
            self.collectV,
        ]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectV.frame = self.bounds;
}

#pragma mark - UICollectionViewDataSource UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeRecommandCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeRecommandCollectionCell class]) forIndexPath:indexPath];
    cell.dataArray = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
//    ResultVC *vc = [[ResultVC alloc] init];
    TrainVC *vc = [[TrainVC alloc] init];
    vc.string = self.dataArray[indexPath.row][1];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

- (UICollectionView *)collectV {
    if (!_collectV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = CGFLOAT_MIN;
        layout.minimumLineSpacing = FitFloat(20.0);
        // 横向滚动
        layout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(FitFloat(263.0), FitFloat(200.0));
        layout.sectionInset = UIEdgeInsetsMake(0.0, FitFloat(17.0), 0.0, FitFloat(17.0));
 
        // 使用UICollectionView必须设置UICollectionViewLayout属性
        _collectV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectV.backgroundColor = [UIColor clearColor];
        _collectV.dataSource = self;
        _collectV.delegate = self;
        [_collectV setShowsHorizontalScrollIndicator:NO];
        [_collectV registerClass:[HomeRecommandCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeRecommandCollectionCell class])];
    }
    return _collectV;;
}

@end
