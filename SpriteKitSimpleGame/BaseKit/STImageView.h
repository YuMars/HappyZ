//
//  STImageView.h
//  5GST
//
//  Created by Red-Fish on 2020/4/20.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class STImageView;

@protocol STImageViewDelegate <NSObject>

- (void)hjImageViewClicked:(STImageView *)imageView;

@end

@interface STImageView : UIImageView


@property (nonatomic, weak) id <STImageViewDelegate> delegate;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) void(^imageViewClickBlock)(STImageView *imageView);

- (void)setUrl:(NSString *)url placehodlerName:(NSString *)placeholderName;
- (void)setUrl:(NSString *)url placehodlerImage:(UIImage *)placeholderImage;

@end

NS_ASSUME_NONNULL_END
