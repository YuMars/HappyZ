//
//  HomeTraningCell.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/17.
//  Copyright © 2023 chc. All rights reserved.
//

#import "HomeTraningCell.h"
#import "TrainVC.h"
@interface HomeTraningCollectionCell : UICollectionViewCell

@property (nonatomic, strong) STImageView *bgV;
@property (nonatomic, strong) UIView *maskV;
@property (nonatomic, strong) UILabel *tagLbl1;
@property (nonatomic, strong) UILabel *tagLbl2;
@property (nonatomic, strong) UILabel *subLbl;
@property (nonatomic, strong) UILabel *tipLbl;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation HomeTraningCollectionCell

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    
//    [self.bgV setUrl:dataArray[0] placehodlerName:@"home_recommand_bg"];
    self.bgV.image = [UIImage imageNamed:dataArray[0]];
    self.tagLbl1.text = dataArray[1];
    self.tagLbl2.hidden = [dataArray[2] length] == 0;
    self.tagLbl2.text = dataArray[2];
    self.subLbl.text = dataArray[3];
    self.tipLbl.text = dataArray[4];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubviews:@[
            self.bgV,
            self.maskV,
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
    self.tagLbl1.frame = CGRectMake(FitFloat(12.0), FitFloat(12.0), FitFloat(50.0), FitFloat(18.0));
    self.tagLbl2.frame = CGRectMake(self.tagLbl1.right + FitFloat(5.0), self.tagLbl1.top, FitFloat(50.0), FitFloat(18.0));
    self.subLbl.frame = CGRectMake(FitFloat(13.0), self.tagLbl1.bottom + FitFloat(160.0), self.width - FitFloat(13.0) * 2, FitFloat(21.0));
    self.tipLbl.frame = CGRectMake(FitFloat(13.0), self.subLbl.bottom + FitFloat(5.0), self.width - FitFloat(13.0) * 2, FitFloat(17.0));
}

- (STImageView *)bgV {
    if (!_bgV) {
        _bgV = [[STImageView alloc] init];
        _bgV.layer.cornerRadius = FitFloat(15.0);
        _bgV.layer.masksToBounds = YES;
    }
    return _bgV;
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

- (UILabel *)tagLbl1 {
    if (!_tagLbl1) {
        _tagLbl1 = [UILabel labelWithFont:FitFontNormal(10.0) textColor:[UIColor whiteColor]];
        _tagLbl1.backgroundColor = [UIColor colorWithHexString:@"#836EFE"];
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
        _tipLbl = [UILabel labelWithFont:FitFontNormal(12.0) textColor:[UIColor colorWithHexString:@"#D9D9D9"]];
    }
    return _tipLbl;
}


@end

@interface HomeTraningCell ()
<
UICollectionViewDelegate,
UICollectionViewDataSource
>

@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UICollectionView *collectV;

@end

@implementation HomeTraningCell

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    
    [self.collectV reloadData];
}

+ (CGFloat)height {
    return FitFloat(340.0);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubviews:@[
            self.titleLbl,
            self.moreBtn,
            self.collectV,
        ]];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLbl.frame = CGRectMake(FitFloat(21.0), FitFloat(25.0), self.width - FitFloat(21.0 * 2), FitFloat(34.0));
    self.moreBtn.frame = CGRectMake(self.width - FitFloat(80.0), FitFloat(35.0), FitFloat(80.0), FitFloat(21.0));
    
    self.collectV.frame = CGRectMake(0.0, self.titleLbl.bottom + FitFloat(4.0), self.width, FitFloat(275.0));
}

- (void)moreBtnAction {
    TrainVC *vc = [[TrainVC alloc] init];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UICollectionViewDataSource UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeTraningCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeTraningCollectionCell class]) forIndexPath:indexPath];
    cell.dataArray = self.dataArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    TrainVC *vc = [[TrainVC alloc] init];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [UILabel labelWithText:@"大家都在练" font:FitFontBold(24.0) textColor:[UIColor colorWithHexString:@"#000000"]];
    }
    return _titleLbl;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithTitle:@"更多" color:[UIColor colorWithHexString:@"#836EFE"] font:FitFontNormal(15.0)];
        [_moreBtn addTarget:self action:@selector(moreBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

- (UICollectionView *)collectV {
    if (!_collectV) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumInteritemSpacing = CGFLOAT_MIN;
        layout.minimumLineSpacing = FitFloat(23.0);
        // 横向滚动
        layout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0.0, FitFloat(21.0), 0.0, FitFloat(21.0));
        layout.itemSize = CGSizeMake(FitFloat(205.0), FitFloat(275.0));
        // 使用UICollectionView必须设置UICollectionViewLayout属性
        _collectV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectV.backgroundColor = [UIColor clearColor];
        _collectV.dataSource = self;
        _collectV.delegate = self;
        [_collectV setShowsHorizontalScrollIndicator:NO];
        [_collectV registerClass:[HomeTraningCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeTraningCollectionCell class])];
    }
    return _collectV;;
}

@end
