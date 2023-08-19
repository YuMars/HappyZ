//
//  STImageView.m
//  5GST
//
//  Created by Red-Fish on 2020/4/20.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "STImageView.h"
#import "extobjc.h"
#import "NSString+Util.h"
#import "UIImageView+WebCache.h"

@implementation STImageView

- (void)setUrl:(NSString *)url {
    _url = url;
    
    @weakify(self);
    [self sd_setImageWithURL:[NSURL URLWithString:[url urlEncodeString]] placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        @strongify(self);
        if (image) {
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.65f];
            [animation setType:kCATransitionFade];
            animation.removedOnCompletion = YES;
            [self.layer addAnimation:animation forKey:@"transition"];
        }
    }];
    
    [self.layer removeAnimationForKey:@"transition"];
}

- (void)setUrl:(NSString *)url placehodlerName:(NSString *)placeholderName {
    _url = url;
    
    @weakify(self);
    [self sd_setImageWithURL:[NSURL URLWithString:[url urlEncodeString]] placeholderImage:[UIImage imageNamed:placeholderName] options:SDWebImageRetryFailed completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        @strongify(self);
        if (image) {
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.65f];
            [animation setType:kCATransitionFade];
            animation.removedOnCompletion = YES;
            [self.layer addAnimation:animation forKey:@"transition"];
        }
    }];
    
     [self.layer removeAnimationForKey:@"transition"];
}

- (void)setUrl:(NSString *)url placehodlerImage:(UIImage *)placeholderImage {
    _url = url;
    
    [self.layer removeAnimationForKey:@"transition"];
    
    @weakify(self);
    [self sd_setImageWithURL:[NSURL URLWithString:[url urlEncodeString]] placeholderImage:placeholderImage options:SDWebImageRetryFailed completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        @strongify(self);
        if (image) {
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.65f];
            [animation setType:kCATransitionFade];
            animation.removedOnCompletion = YES;
            [self.layer addAnimation:animation forKey:@"transition"];
        }
    }];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.masksToBounds = YES;
        self.userInteractionEnabled = NO;
        
        self.contentMode = UIViewContentModeScaleAspectFill;
        
        UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGrAction:)];
        [self addGestureRecognizer:tapGr];
    }
    return self;
}

- (void)tapGrAction:(UITapGestureRecognizer *)gr {
    
    if (self.imageViewClickBlock) {
        self.imageViewClickBlock(self);
    }
    
    if ([self.delegate respondsToSelector:@selector(hjImageViewClicked:)]) {
        [self.delegate hjImageViewClicked:self];
    }
}

@end
