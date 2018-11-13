//
//  KTBaseController.m
//  shopping
//
//  Created by nike on 2018/11/13.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTBaseController.h"

@interface KTBaseController ()

@end

@implementation KTBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



#pragma 页面跳转时,导航栏的显示与隐藏
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
@end
