//
//  AppDelegate.m
//  ShowKiForiOS
//
//  Created by Sunny on 2017/4/20.
//  Copyright © 2017年 Sunny. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "LoginViewController.h"
#import "NaViewController.h"
#import "Constants.h"
#import "LaunchDemo.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
- (void)setNav {
    
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //set the color
    bar.barTintColor = NAVIGATION_BAR_COLOR;
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setNav];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    RootViewController *rootVC = [[RootViewController alloc]init];
    NaViewController *nav = [[NaViewController alloc]initWithRootViewController:rootVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    LaunchDemo *demo = [LaunchDemo new];
    demo.iconFrame = CGRectMake((ScreenWidth - 213) * 0.5, 80, 213, 54);
    demo.desLabelFreme = CGRectMake(0, ScreenHeight - 34, ScreenWidth, 25);
    [demo loadLaunchImage:@"start_up_image.jpg"
                 iconName:@"logo_coding_top"
              appearStyle:JRApperaStyleNone
                  bgImage:@"bg.png"
                disappear:JRDisApperaStyleLeft
           descriptionStr:@"Showki"];
    demo.desLabel.font = [UIFont systemFontOfSize:12];
    demo.desLabel.textColor = [UIColor whiteColor];
    
  
    
    [self keyboard];
    
    return YES;
}

- (void)keyboard{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = NO;
    manager.enableAutoToolbar = YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
