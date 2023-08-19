//
//  BaseTabBarItem.m
//  5GST
//
//  Created by Red-Fish on 2020/4/13.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "BaseTabBarItem.h"

@implementation BaseTabBarItem

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return _titleRect;
}
    
    
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return _imageRect;
}


@end
