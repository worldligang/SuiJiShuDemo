//
//  AppDelegate.m
//  SuiJiShuDemo
//
//  Created by ligang on 14-3-14.
//  Copyright (c) 2014年 JiangNan. All rights reserved.
//

#import "AppDelegate.h"

// 一次产生六个随机数
#define SHU_COUNT 10

#define ALL_NUM 100

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.backgroundColor = [UIColor orangeColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor purpleColor]];
    [btn addTarget:self action:@selector(actionSuiJi:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 200, 40);
    btn.center = self.window.center;
    [self.window addSubview:btn];
    [btn setTitle:@"一次产生多个随机数" forState:UIControlStateNormal];
    
    UITextView  *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(60, 100, 200, 80);
    textView.tag = 1;
    [textView setFont:[UIFont systemFontOfSize:17]];
    textView.textAlignment = NSTextAlignmentCenter;
    [self.window addSubview:textView];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (IBAction)actionSuiJi:(id)sender
{
    int z = 0;
    int x = SHU_COUNT;
    NSMutableArray *mutArrGet = [NSMutableArray array];
    for (int i = 0; i < x; i++) {
        z++;
        int b = arc4random()%ALL_NUM+1;
        BOOL isUse = [self compare:mutArrGet andNum:b];
        if (isUse) {
            [mutArrGet addObject:[NSString stringWithFormat:@"%d",b]];
        }else{
            x++;
        }
        if ([mutArrGet count] == SHU_COUNT) break;
    }
    
    UITextView *tv = (UITextView *)[self.window viewWithTag:1];    
    NSMutableString *mutS = [[NSMutableString alloc] init];
    for (NSString *s in mutArrGet) {
        [mutS appendString:s];
        [mutS appendString:@"-"];
    }
    tv.text = mutS;
}


- (BOOL)compare:(NSMutableArray *)mutArr andNum:(int)index
{
    for (NSString *s in mutArr) {
        if (index == [s integerValue]) {
            return NO;
        }
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
