//
//  ResultVC.m
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/18.
//  Copyright © 2023 chc. All rights reserved.
//

#import "ResultVC.h"
#import "StepSlider.h"
#import "AAChartKit.h"
@interface ResultVC ()

@property (nonatomic, strong) UIScrollView *scrollV;
@property (nonatomic, strong) UIImageView *topBgV;
@property (nonatomic, strong) UIView *maskV;
@property (nonatomic, strong) STImageView *headImgV;
@property (nonatomic, strong) UILabel *tip1Lbl;
@property (nonatomic, strong) UILabel *tip2Lbl;
@property (nonatomic, strong) UILabel *tip3Lbl;

@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) UILabel *timeLbl;
@property (nonatomic, strong) UILabel *timeLbl1;
@property (nonatomic, strong) UIImageView *sepMask1;
@property (nonatomic, strong) UILabel *kllLbl;
@property (nonatomic, strong) UILabel *kllLbl1;
@property (nonatomic, strong) UIImageView *sepMask2;
@property (nonatomic, strong) UILabel *levelLbl;
@property (nonatomic, strong) UILabel *levelLbl1;

@property (nonatomic, strong) UIView *corV;

@property (nonatomic, strong) UILabel *plcdLbl;
@property (nonatomic, strong) UILabel *plcdLbl1;
@property (nonatomic, strong) UIImageView *leftImgV;
@property (nonatomic, strong) UILabel *leftLbl;
@property (nonatomic, strong) UIImageView *rightImgV;
@property (nonatomic, strong) UILabel *rightLbl;

@property (nonatomic, strong) NSMutableArray <UILabel *> *num1LblArray;
@property (nonatomic, strong) StepSlider *sliderV;

@property (nonatomic, strong) UIView *sepLine1;

@property (nonatomic, strong) UILabel *ttcdLbl;
@property (nonatomic, strong) UILabel *ttcdLbl1;
@property (nonatomic, strong) UIImageView *ttleftImgV;
@property (nonatomic, strong) UILabel *ttleftLbl;
@property (nonatomic, strong) UIImageView *ttrightImgV;
@property (nonatomic, strong) UILabel *ttrightLbl;

@property (nonatomic, strong) NSMutableArray <UILabel *> *num2LblArray;
@property (nonatomic, strong) StepSlider *ttsliderV;

@property (nonatomic, strong) UIView *sepLine2;

@property (nonatomic, strong) UILabel *pljlLbl;
@property (nonatomic, strong) UILabel *pljlLbl1;

@property (nonatomic, strong) AAChartView *chartV;

@property (nonatomic, strong) UIView *sepLine3;

@property (nonatomic, strong) UILabel *ttjlLbl;
@property (nonatomic, strong) UILabel *ttjlLbl1;

@property (nonatomic, strong) UIButton *doneBtn;


@end

@implementation ResultVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubviews:@[
        self.scrollV,
    ]];
    
    [self.scrollV addSubviews:@[
        self.topBgV,
        self.maskV,
        self.headImgV,
        self.tip1Lbl,
        self.tip2Lbl,
        self.tip3Lbl,
        self.toolBar,
        self.timeLbl,
        self.timeLbl1,
        self.sepMask1,
        self.kllLbl,
        self.kllLbl1,
        self.sepMask2,
        self.levelLbl,
        self.levelLbl1,
        self.corV,
        self.plcdLbl,
        self.plcdLbl1,
        self.leftImgV,
        self.leftLbl,
        self.rightImgV,
        self.rightLbl,
        self.sliderV,
        self.sepLine1,
        self.ttcdLbl,
        self.ttcdLbl1,
        self.ttleftImgV,
        self.ttleftLbl,
        self.ttrightImgV,
        self.ttrightLbl,
        self.ttsliderV,
        self.sepLine2,
        self.pljlLbl,
        self.pljlLbl1,
        self.chartV,
        self.sepLine3,
        self.ttjlLbl,
        self.ttjlLbl1,
        self.doneBtn,
    ]];
    
    self.scrollV.frame = self.view.bounds;
    
    self.topBgV.frame = CGRectMake(0.0, 0.0, self.view.width, FitFloat(431.0));
    self.maskV.frame = self.topBgV.bounds;
    self.headImgV.frame = CGRectMake(self.view.width - FitFloat(74.0) - FitFloat(27.0), StatusBarHeight, FitFloat(74.0), FitFloat(74.0));
    self.tip1Lbl.frame = CGRectMake(FitFloat(35.0), self.headImgV.bottom + FitFloat(3.0), self.view.width - FitFloat(35.0 * 2), FitFloat(22.0));
    self.tip2Lbl.frame = CGRectMake(FitFloat(35.0), self.tip1Lbl.bottom, self.tip1Lbl.width, FitFloat(39.0));
    self.tip3Lbl.frame = CGRectMake(FitFloat(35.0), self.tip2Lbl.bottom, self.tip1Lbl.width, FitFloat(39.0));
    self.toolBar.frame = CGRectMake((self.view.width - FitFloat(394.0)) / 2.0, self.tip3Lbl.bottom + FitFloat(20.0), FitFloat(394.0), FitFloat(110.0));
    CGFloat width = self.toolBar.width / 3.0;
    self.timeLbl.frame = CGRectMake(self.toolBar.x, self.toolBar.y + FitFloat(30.0), width, FitFloat(22.0));
    self.timeLbl1.frame = CGRectMake(self.timeLbl.x, self.timeLbl.bottom + FitFloat(9.0), width, FitFloat(22.0));
    self.sepMask1.frame = CGRectMake(self.timeLbl.right, self.toolBar.y + FitFloat(33.0), FitFloat(1.0), FitFloat(50.0));
    self.kllLbl.frame = CGRectMake(self.timeLbl.right, self.timeLbl.y, width, FitFloat(22.0));
    self.kllLbl1.frame = CGRectMake(self.timeLbl.right, self.timeLbl1.y, width, FitFloat(22.0));
    self.sepMask2.frame = CGRectMake(self.kllLbl.right, self.sepMask1.y, FitFloat(1.0), FitFloat(50.0));
    self.levelLbl.frame = CGRectMake(self.kllLbl.right, self.timeLbl.y, width, FitFloat(22.0));
    self.levelLbl1.frame = CGRectMake(self.kllLbl.right, self.timeLbl1.y, width, FitFloat(22.0));
    self.corV.frame = CGRectMake(0.0, self.headImgV.bottom + FitFloat(250.0), self.view.width, FitFloat(76.0));
    self.plcdLbl.frame = CGRectMake(FitFloat(18.0), self.toolBar.bottom + FitFloat(60.0), self.view.width - FitFloat(30.0 * 2), FitFloat(22.0));
    self.plcdLbl1.frame = CGRectMake(FitFloat(18.0), self.plcdLbl.bottom, self.plcdLbl.width, FitFloat(18.0));
    self.leftImgV.frame = CGRectMake(FitFloat(27.0), self.plcdLbl1.bottom + FitFloat(4.0), FitFloat(30.0), FitFloat(30.0));
    self.leftLbl.frame = CGRectMake(0.0, self.leftImgV.bottom, FitFloat(60.0), FitFloat(14.0));
    self.leftLbl.centerX = self.leftImgV.centerX;
    self.rightImgV.frame = CGRectMake(self.view.width - FitFloat(30.0) - FitFloat(30.0), self.leftImgV.y, FitFloat(30.0), FitFloat(30.0));
    self.rightLbl.frame = CGRectMake(0.0, self.leftLbl.y, FitFloat(60.0), self.leftLbl.height);
    self.rightLbl.centerX = self.rightImgV.centerX;
    
    // todo
    
    
    self.sliderV.frame = CGRectMake(FitFloat(18.0), self.leftLbl.bottom + FitFloat(15.0), self.view.width - FitFloat(18.0 * 2), FitFloat(30.0));
    self.sepLine1.frame = CGRectMake(FitFloat(55.0), self.leftLbl.bottom + FitFloat(90.0), self.view.width - FitFloat(55.0 * 2), 0.5);
    
    self.ttcdLbl.frame = CGRectMake(FitFloat(18.0), self.sepLine1.bottom + FitFloat(12.0), self.view.width - FitFloat(18.0 * 2), FitFloat(22.0));
    self.ttcdLbl1.frame = CGRectMake(FitFloat(18.0), self.ttcdLbl.bottom, self.view.width - FitFloat(18.0 * 2), FitFloat(18.0));
    self.ttleftImgV.frame = CGRectMake(FitFloat(27.0), self.ttcdLbl1.bottom + FitFloat(4.0), FitFloat(30.0), FitFloat(30.0));
    self.ttleftLbl.frame = CGRectMake(0.0, self.ttleftImgV.bottom, FitFloat(60.0), FitFloat(14.0));
    self.ttleftLbl.centerX = self.ttleftImgV.centerX;
    self.ttrightImgV.frame = CGRectMake(self.view.width - FitFloat(30.0) - FitFloat(30.0), self.ttleftImgV.y, FitFloat(30.0), FitFloat(30.0));
    self.ttrightLbl.frame = CGRectMake(0.0, self.ttleftLbl.y, FitFloat(60.0), self.ttleftLbl.height);
    self.ttrightLbl.centerX = self.ttrightImgV.centerX;
    self.ttsliderV.frame = CGRectMake(FitFloat(18.0), self.ttleftLbl.bottom + FitFloat(15.0), self.view.width - FitFloat(18.0 * 2), FitFloat(30.0));
    
    self.sepLine2.frame = CGRectMake(FitFloat(55.0), self.ttleftLbl.bottom + FitFloat(90.0), self.view.width - FitFloat(55.0 * 2), 0.5);
    self.pljlLbl.frame = CGRectMake(FitFloat(18.0), self.sepLine2.bottom + FitFloat(12.0), self.view.width - FitFloat(18.0 * 2), FitFloat(22.0));
    self.pljlLbl1.frame = CGRectMake(FitFloat(18.0), self.pljlLbl.bottom, self.view.width - FitFloat(18.0 * 2), FitFloat(18.0));
    self.chartV.frame = CGRectMake(0.0, self.pljlLbl1.bottom + FitFloat(50.0), self.view.width, FitFloat(230.0));
    self.sepLine3.frame = CGRectMake(FitFloat(55.0), self.chartV.bottom + FitFloat(40.0), self.view.width - FitFloat(55.0), 1.0);
    self.ttjlLbl.frame = CGRectMake(FitFloat(18.0), self.sepLine3.bottom + FitFloat(12.0), self.view.width - FitFloat(18.0 * 2), FitFloat(22.0));
    self.ttjlLbl1.frame = CGRectMake(FitFloat(18.0), self.ttjlLbl.bottom, self.view.width - FitFloat(18.0 * 2), FitFloat(18.0));
    self.doneBtn.frame = CGRectMake((self.view.width - FitFloat(110.0)) / 2.0, self.ttjlLbl1.bottom + FitFloat(17.0), FitFloat(110.0), FitFloat(36.0));
    
    self.scrollV.contentSize = CGSizeMake(0.0, self.doneBtn.bottom + FitFloat(50.0));
    
}

- (AAChartModel *)configureNegativeColorMixedAreasplineChart {
    NSArray *blueStopsArr = @[
        @[@0.0, AARgbaColor(30, 144, 255, 0.0)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.5, AARgbaColor(30, 144, 255, 0.0)],
        @[@1.0, AARgbaColor(30, 144, 255, 0.6)]
    ];
    NSDictionary *gradientBlueColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                                     stopsArray:blueStopsArr];
    
    
    NSArray *redStopsArr = @[
        @[@0.0, AARgbaColor(255, 0, 0, 0.6)],//颜色字符串设置支持十六进制类型和 rgba 类型
        @[@0.5, AARgbaColor(255, 0, 0, 0.0)],
        @[@1.0, AARgbaColor(255, 0, 0, 0.0)]
    ];
    NSDictionary *gradientRedColorDic =
    [AAGradientColor gradientColorWithDirection:AALinearGradientDirectionToTop
                                     stopsArray:redStopsArr];
    
    
    return AAChartModel.new
    .chartTypeSet(AAChartTypeAreaspline)
    .legendEnabledSet(false)
    .dataLabelsEnabledSet(false)
    .markerRadiusSet(@5)
    .markerSymbolStyleSet(AAChartSymbolStyleTypeInnerBlank)
    .yAxisGridLineStyleSet([AALineStyle styleWithWidth:@0])
    .seriesSet(@[
        AASeriesElement.new
        .nameSet(@"Column")
        .dataSet(@[
            @7.0, @6.9, @2.5, @14.5, @18.2, @21.5, @5.2, @26.5, @23.3, @45.3, @13.9, @9.6,
            @-7.0, @-6.9, @-2.5, @-14.5, @-18.2, @-21.5, @-5.2, @-26.5, @-23.3, @-45.3, @-13.9, @-9.6,
                 ])
        .lineWidthSet(@5)
        .colorSet(AARgbaColor(30, 144, 255, 1.0))
        .negativeColorSet(AARgbaColor(255, 0, 0, 1.0))
        .fillColorSet((id)gradientBlueColorDic)
        .negativeFillColorSet((id)gradientRedColorDic)
        .thresholdSet(@0)//default:0
        ,
               ]);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)doneBtnAction {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (UIScrollView *)scrollV {
    if (!_scrollV) {
        _scrollV = [[UIScrollView alloc] init];
        _scrollV.showsVerticalScrollIndicator = NO;
        _scrollV.showsHorizontalScrollIndicator = NO;
        
        if (@available(iOS 11.0, *)) {
            _scrollV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _scrollV;
}

- (UIImageView *)topBgV {
    if (!_topBgV) {
        _topBgV = [[UIImageView alloc] init];
        _topBgV.image = [UIImage imageNamed:@"result_bg"];
    }
    return _topBgV;
}

- (UIView *)maskV {
    if (!_maskV) {
        _maskV = [[UIView alloc] init];
        _maskV.backgroundColor = [UIColor colorWithHexString:@"#242424"].alpha(0.6);
    }
    return _maskV;
}

- (STImageView *)headImgV {
    if (!_headImgV) {
        _headImgV = [[STImageView alloc] init];
        _headImgV.layer.cornerRadius = FitFloat(74.0) / 2.0;
        _headImgV.layer.masksToBounds = YES;
    }
    return _headImgV;
}

- (UILabel *)tip1Lbl {
    if (!_tip1Lbl) {
        _tip1Lbl = [UILabel labelWithText:@"Wow Amazing" font:FitFontNormal(16.) textColor:[UIColor whiteColor]];
    }
    return _tip1Lbl;
}

- (UILabel *)tip2Lbl {
    if (!_tip2Lbl) {
        _tip2Lbl = [UILabel labelWithText:@"恭喜你！" font:FitFontBold(28.0) textColor:[UIColor whiteColor]];
    }
    return _tip2Lbl;
}

- (UILabel *)tip3Lbl {
    if (!_tip3Lbl) {
        _tip3Lbl = [UILabel labelWithText:@"完成第4次康复训练" font:FitFontBold(28.0) textColor:[UIColor whiteColor]];
    }
    return _tip3Lbl;
}

- (UIToolbar *)toolBar {
    if (!_toolBar) {
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, FitFloat(394.0), FitFloat(110.0))];
        _toolBar.barStyle = UIBarStyleDefault;
        _toolBar.layer.cornerRadius = FitFloat(20.0);
        _toolBar.layer.masksToBounds = YES;
    }
    return _toolBar;
}

- (UILabel *)timeLbl {
    if (!_timeLbl) {
        _timeLbl = [UILabel labelWithText:@"用时" font:FitFontNormal(16.0) textColor:[UIColor whiteColor]];
        _timeLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLbl;
}

- (UILabel *)timeLbl1 {
    if (!_timeLbl1) {
        _timeLbl1 = [UILabel labelWithText:@"15:02" font:FitFontBold(16.0) textColor:[UIColor whiteColor]];
        _timeLbl1.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLbl1;
}

- (UIImageView *)sepMask1 {
    if (!_sepMask1) {
        _sepMask1 = [[UIImageView alloc] init];
        _sepMask1.image = [UIImage imageNamed:@"result_sep"];
    }
    return _sepMask1;
}

- (UILabel *)kllLbl {
    if (!_kllLbl) {
        _kllLbl = [UILabel labelWithText:@"卡路里" font:FitFontNormal(16.0) textColor:[UIColor whiteColor]];
        _kllLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _kllLbl;
}

- (UILabel *)kllLbl1 {
    if (!_kllLbl1) {
        _kllLbl1 = [UILabel labelWithText:@"112千卡" font:FitFontBold(16.0) textColor:[UIColor whiteColor]];
        _kllLbl1.textAlignment = NSTextAlignmentCenter;
    }
    return _kllLbl1;
}

- (UIImageView *)sepMask2 {
    if (!_sepMask2) {
        _sepMask2 = [[UIImageView alloc] init];
        _sepMask2.image = [UIImage imageNamed:@"result_sep"];
    }
    return _sepMask2;
}


- (UILabel *)levelLbl {
    if (!_levelLbl) {
        _levelLbl = [UILabel labelWithText:@"康复等级" font:FitFontNormal(16.0) textColor:[UIColor whiteColor]];
        _levelLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _levelLbl;
}

- (UILabel *)levelLbl1 {
    if (!_levelLbl1) {
        _levelLbl1 = [UILabel labelWithText:@"LV 6" font:FitFontBold(16.0) textColor:[UIColor whiteColor]];
        _levelLbl1.textAlignment = NSTextAlignmentCenter;
    }
    return _levelLbl1;
}

- (UIView *)corV {
    if (!_corV) {
        _corV = [[UIView alloc] init];
        _corV.backgroundColor = [UIColor whiteColor];
        _corV.frame = CGRectMake(0.0, 0.0, self.view.width, FitFloat(76.0));
        [_corV addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight radius:CGSizeMake(FitFloat(30.0), FitFloat(30.0))];
    }
    return _corV;
}

- (UILabel *)plcdLbl {
    if (!_plcdLbl) {
        _plcdLbl = [UILabel labelWithText:@"" font:FitFontBold(16.0) textColor:[UIColor whiteColor]];
        NSString *str1 = @"在本次训练感受到的";
        NSString *str2 = @"疲劳程度";
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", str1, str2]];
        [attr addAttribute:NSFontAttributeName value:FitFontBold(16.0) range:NSMakeRange(0, attr.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#343434"] range:NSMakeRange(0, str1.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#5EB9A9"] range:NSMakeRange(str1.length, str2.length)];
        _plcdLbl.attributedText = attr;
    }
    return _plcdLbl;
}

- (UILabel *)plcdLbl1 {
    if (!_plcdLbl1) {
        _plcdLbl1 = [UILabel labelWithText:@"拖动滑块对疲劳感进行评分" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
    }
    return _plcdLbl1;
}

- (UIImageView *)leftImgV {
    if (!_leftImgV) {
        _leftImgV = [[UIImageView alloc] init];
        _leftImgV.image = [UIImage imageNamed:@"train_detail_left_1"];
    }
    return _leftImgV;
}

- (UILabel *)leftLbl {
    if (!_leftLbl) {
        _leftLbl = [UILabel labelWithText:@"非常劳累" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
        _leftLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _leftLbl;
}

- (UIImageView *)rightImgV {
    if (!_rightImgV) {
        _rightImgV = [[UIImageView alloc] init];
        _rightImgV.image = [UIImage imageNamed:@"train_detail_right_1"];
    }
    return _rightImgV;
}

- (UILabel *)rightLbl {
    if (!_rightLbl) {
        _rightLbl = [UILabel labelWithText:@"非常轻松" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
        _rightLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _rightLbl;
}

- (StepSlider *)sliderV {
    if (!_sliderV) {
        _sliderV = [[StepSlider alloc] initWithFrame:CGRectMake(FitFloat(18.0), StatusBarHeight +  FitFloat(74.0) + FitFloat(369.0), self.view.width - FitFloat(18.0 * 2), FitFloat(30.0))];
        _sliderV.maxCount = 10.0;
        _sliderV.labelOffset = FitFloat(18.0);
        _sliderV.labels = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
        _sliderV.labelFont = FitFontBold(10.0);
        _sliderV.labelColor = [UIColor grayColor];
        _sliderV.index = 5;
        _sliderV.trackColor = [UIColor colorWithHexString:@"#5EB9A9"];
        _sliderV.sliderCircleColor = [UIColor colorWithHexString:@"#836EFE"];
        _sliderV.labelOrientation = StepSliderTextOrientationUp;
        _sliderV.tintColor = [UIColor colorWithHexString:@"#836EFE"];
    }
    return _sliderV;
}

- (UIView *)sepLine1 {
    if (!_sepLine1) {
        _sepLine1 = [[UIView alloc] init];
        _sepLine1.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
    }
    return _sepLine1;
}

- (UILabel *)ttcdLbl {
    if (!_ttcdLbl) {
        _ttcdLbl = [UILabel labelWithText:@"" font:FitFontBold(16.0) textColor:[UIColor whiteColor]];
        NSString *str1 = @"在本次训练感受到的";
        NSString *str2 = @"不适（疼痛）程度";
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@", str1, str2]];
        [attr addAttribute:NSFontAttributeName value:FitFontBold(16.0) range:NSMakeRange(0, attr.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#343434"] range:NSMakeRange(0, str1.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#836EFE"] range:NSMakeRange(str1.length, str2.length)];
        _ttcdLbl.attributedText = attr;
    }
    return _ttcdLbl;
}

- (UILabel *)ttcdLbl1 {
    if (!_ttcdLbl1) {
        _ttcdLbl1 = [UILabel labelWithText:@"拖动滑块对不适（疼痛）感进行评分" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
    }
    return _ttcdLbl1;
}

- (UIImageView *)ttleftImgV {
    if (!_ttleftImgV) {
        _ttleftImgV = [[UIImageView alloc] init];
        _ttleftImgV.image = [UIImage imageNamed:@"train_detail_left_2"];
    }
    return _ttleftImgV;
}

- (UILabel *)ttleftLbl {
    if (!_ttleftLbl) {
        _ttleftLbl = [UILabel labelWithText:@"非常劳累" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
        _ttleftLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _ttleftLbl;
}
    
- (UIImageView *)ttrightImgV {
    if (!_ttrightImgV) {
        _ttrightImgV = [[UIImageView alloc] init];
        _ttrightImgV.image = [UIImage imageNamed:@"train_detail_right_2"];
    }
    return _ttrightImgV;
}

- (UILabel *)ttrightLbl {
    if (!_ttrightLbl) {
        _ttrightLbl = [UILabel labelWithText:@"非常劳累" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
        _ttrightLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _ttrightLbl;
}

- (StepSlider *)ttsliderV {
    if (!_ttsliderV) {
        _ttsliderV = [[StepSlider alloc] initWithFrame:CGRectMake(FitFloat(18.0), StatusBarHeight +  FitFloat(74.0) + FitFloat(369.0), self.view.width - FitFloat(18.0 * 2), FitFloat(30.0))];
        _ttsliderV.maxCount = 10.0;
        _ttsliderV.labelOffset = FitFloat(18.0);
        _ttsliderV.labels = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10"];
        _ttsliderV.labelFont = FitFontBold(10.0);
        _ttsliderV.labelColor = [UIColor grayColor];
        _ttsliderV.index = 5;
        _ttsliderV.trackColor = [UIColor colorWithHexString:@"#5EB9A9"];
        _ttsliderV.sliderCircleColor = [UIColor colorWithHexString:@"#5EB9A9"];
        _ttsliderV.labelOrientation = StepSliderTextOrientationUp;
        _ttsliderV.tintColor = [UIColor colorWithHexString:@"#836EFE"];
    }
    return _ttsliderV;
}

- (UIView *)sepLine2 {
    if (!_sepLine2) {
        _sepLine2 = [[UIView alloc] init];
        _sepLine2.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
    }
    return _sepLine2;
}

- (UILabel *)pljlLbl {
    if (!_pljlLbl) {
        _pljlLbl = [UILabel labelWithText:@"" font:FitFontBold(16.0) textColor:[UIColor whiteColor]];
        NSString *str1 = @"训练";
        NSString *str2 = @"疲劳程度";
        NSString *str3 = @"记录";
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", str1, str2, str3]];
        [attr addAttribute:NSFontAttributeName value:FitFontBold(16.0) range:NSMakeRange(0, attr.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#343434"] range:NSMakeRange(0, str1.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#5EB9A9"] range:NSMakeRange(str1.length, str2.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#343434"] range:NSMakeRange(str1.length + str2.length, str3.length)];
        _pljlLbl.attributedText = attr;
    }
    return _pljlLbl;
}

- (UILabel *)pljlLbl1 {
    if (!_pljlLbl1) {
        _pljlLbl1 = [UILabel labelWithText:@"已记录8次训练后的疲劳程度" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
    }
    return _pljlLbl1;
}

- (AAChartView *)chartV {
    if (!_chartV) {
        _chartV = [[AAChartView alloc] init];
        _chartV.scrollEnabled = NO;
        _chartV.frame = CGRectMake(0.0, 0.0, self.view.width, FitFloat(230.0));
        _chartV.backgroundColor = [UIColor redColor].alpha(0.1);
        
        if (@available(iOS 11.0, *)) {
            _chartV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            
        }
        
        [self.view addSubview:_chartV];
        
        //在 didReceiveScriptMessage 代理方法中获得点击 X轴的文字🏷标签的回调
        [_chartV didReceiveScriptMessageHandler:^(AAChartView *aaChartView, WKScriptMessage *message) {
            NSLog(@"Clicked X axis label,  name is %@", message.body);
        }];
        
        AAAnimation *aaAnimation = AAAnimation.new
        .durationSet(@800)
        .easingSet(AAChartAnimationEaseOutQuart);
        [_chartV aa_adaptiveScreenRotationWithAnimation:aaAnimation];
        [_chartV aa_drawChartWithChartModel:[self configureNegativeColorMixedAreasplineChart]];
    }
    return _chartV;
}

- (UIView *)sepLine3 {
    if (!_sepLine3) {
        _sepLine3 = [[UIView alloc] init];
        _sepLine3.backgroundColor = [UIColor colorWithHexString:@"#DEDEDE"];
    }
    return _sepLine3;
}

- (UILabel *)ttjlLbl {
    if (!_ttjlLbl) {
        _ttjlLbl = [UILabel labelWithText:@"" font:FitFontBold(16.0) textColor:[UIColor whiteColor]];
        NSString *str1 = @"训练";
        NSString *str2 = @"不适（疼痛）程度";
        NSString *str3 = @"记录";
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@", str1, str2, str3]];
        [attr addAttribute:NSFontAttributeName value:FitFontBold(16.0) range:NSMakeRange(0, attr.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#343434"] range:NSMakeRange(0, str1.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#836EFE"] range:NSMakeRange(str1.length, str2.length)];
        [attr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#343434"] range:NSMakeRange(str1.length + str2.length, str3.length)];
        _ttjlLbl.attributedText = attr;
    }
    return _ttjlLbl;
}

- (UILabel *)ttjlLbl1 {
    if (!_ttjlLbl1) {
        _ttjlLbl1 = [UILabel labelWithText:@"已记录8次训练后的不适（疼痛）程度" font:FitFontBold(13.0) textColor:[UIColor colorWithHexString:@"#909090"]];
    }
    return _ttjlLbl1;
}

- (UIButton *)doneBtn {
    if (!_doneBtn) {
        _doneBtn = [UIButton buttonWithTitle:@"完成" color:[UIColor whiteColor] font:FitFontNormal(20.0)];
        _doneBtn.layer.cornerRadius = FitFloat(18.0);
        _doneBtn.layer.masksToBounds = YES;
        _doneBtn.backgroundColor = [UIColor colorWithHexString:@"#5EB9A9"];
        [_doneBtn addTarget:self action:@selector(doneBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _doneBtn;
}

@end
