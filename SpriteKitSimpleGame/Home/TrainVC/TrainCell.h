//
//  TrainCell.h
//  SpriteKitSimpleGame
//
//  Created by Red-Fish on 2023/8/18.
//  Copyright © 2023 chc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrainCell : UITableViewCell

+ (CGFloat)height;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
