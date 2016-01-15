//
//  AppDelegate.m
//  Demo3DTouch
//
//  Created by 张林峰 on 16/1/14.
//  Copyright © 2016年 张林峰. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SearchViewController.h"
#import "SharedViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建应用图标上的3D touch快捷选项
    [self creatShortcutItem];
    
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    //如果是从快捷选项标签启动app，则根据不同标识执行不同操作，然后返回NO，防止调用- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
    if (shortcutItem) {
        //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"com.mycompany.myapp.one"]){
            NSArray *arr = @[@"hello 3D Touch"];
            UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
            }];
        } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.search"]) {//进入搜索界面
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:@"mainController"];
            UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
            
            self.window.rootViewController = mainNav;
            [self.window makeKeyAndVisible];
            
            SearchViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"searchController"];
            [mainNav pushViewController:childVC animated:NO];
        } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.share"]) {//进入分享界面
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:@"mainController"];
            UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
            
            self.window.rootViewController = mainNav;
            [self.window makeKeyAndVisible];
            
            SharedViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"sharedController"];
            [mainNav pushViewController:childVC animated:NO];
        }
        return NO;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//如果app在后台，通过快捷选项标签进入app，则调用该方法，如果app不在后台已杀死，则处理通过快捷选项标签进入app的逻辑在- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions中
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    //判断先前我们设置的快捷选项标签唯一标识，根据不同标识执行不同操作
    if([shortcutItem.type isEqualToString:@"com.mycompany.myapp.one"]){
        NSArray *arr = @[@"hello 3D Touch"];
        UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
        [self.window.rootViewController presentViewController:vc animated:YES completion:^{
        }];
    } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.search"]) {//进入搜索界面
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:@"mainController"];
        UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
        
        self.window.rootViewController = mainNav;
        [self.window makeKeyAndVisible];
        
        SearchViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"searchController"];
        [mainNav pushViewController:childVC animated:NO];
    } else if ([shortcutItem.type isEqualToString:@"com.mycompany.myapp.share"]) {//进入分享界面
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *mainView = [storyboard instantiateViewControllerWithIdentifier:@"mainController"];
        UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainView];
        
        self.window.rootViewController = mainNav;
        [self.window makeKeyAndVisible];
        
        SharedViewController *childVC = [storyboard instantiateViewControllerWithIdentifier:@"sharedController"];
        [mainNav pushViewController:childVC animated:NO];
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
}

//创建应用图标上的3D touch快捷选项
- (void)creatShortcutItem {
    //创建系统风格的icon
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    
//    //创建自定义图标的icon
//    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"分享.png"];
    
    //创建快捷选项
    UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"com.mycompany.myapp.share" localizedTitle:@"分享" localizedSubtitle:@"分享副标题" icon:icon userInfo:nil];
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[item];
}

@end
