//
//  KTTabBarController.m
//  shopping
//
//  Created by nike on 2018/11/13.
//  Copyright © 2018 nike. All rights reserved.
//

#import "KTTabBarController.h"

@interface KTTabBarController ()<UITabBarControllerDelegate>

@end

@implementation KTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.selectedIndex = 2;
    
    self.delegate = self;
}

#pragma mark - 控制器跳转拦截
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
//    if(viewController == [tabBarController.viewControllers objectAtIndex:DCTabBarControllerPerson]){
//
//        if (![[DCObjManager dc_readUserDataForKey:@"isLogin"] isEqualToString:@"1"]) {
//
//            DCLoginViewController *dcLoginVc = [DCLoginViewController new];
//            [self presentViewController:dcLoginVc animated:YES completion:nil];
//            return NO;
//        }
//    }
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
