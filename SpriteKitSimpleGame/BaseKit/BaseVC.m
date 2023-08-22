//
//  BaseVC.m
//  5GST
//
//  Created by Red-Fish on 2020/4/13.
//  Copyright © 2020 Red-Fish. All rights reserved.
//

#import "BaseVC.h"

#import "UIViewController+HBD.h"

@interface BaseVC ()

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hbd_barTintColor = [UIColor clearColor];
    
    NSDictionary *dict = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                           NSFontAttributeName : [UIFont boldSystemFontOfSize:17.0],};
    self.hbd_titleTextAttributes = dict;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.hbd_tintColor = [UIColor clearColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

@end
