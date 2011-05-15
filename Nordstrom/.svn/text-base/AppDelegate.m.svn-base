//
//  NordstromAppDelegate.m
//  Nordstrom
//
//  Created by Luke Adamson on 4/2/11.
//  Copyright 2011 Nordstrom. All rights reserved.
//

#import "AppDelegate.h"
#import "HotController.h"
#import "ShopController.h"
#import "WishListController.h"
#import "EventsController.h"
#import "AccountController.h"

@implementation AppDelegate

#pragma mark - Synthesize accessors

@synthesize window = window_;

#pragma mark - Initialization and deallocation

- (void)dealloc
{
    [window_ release];
    [super dealloc];
}

#pragma mark - Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{
    // Make status bar black
    [application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    
    // Create the controllers (and the navigation controllers they're embedded in) to manage each major section of the app

    // Hot
    HotController *hotController = [[[HotController alloc] init] autorelease];
    hotController.tabBarItem.title = @"Hot";

    // Shop
    ShopController *shopController = [[[ShopController alloc] init] autorelease];
    UINavigationController *shopNavController = [[[UINavigationController alloc] initWithRootViewController:shopController] autorelease];
    shopNavController.tabBarItem.title = @"Shop";
    
    // Wish List
    WishListController *wishListController = [[[WishListController alloc] init] autorelease];
    wishListController.tabBarItem.title = @"Wish List";
   
    // Events
    EventsController *eventsController = [[[EventsController alloc] init] autorelease];
    UINavigationController *eventsNavController = [[[UINavigationController alloc] initWithRootViewController:eventsController] autorelease];
    eventsNavController.tabBarItem.title = @"Events";
    
    // Account
    AccountController *accountController = [[[AccountController alloc] init] autorelease];
    accountController.tabBarItem.title = @"Account";
    
    // Set up the tab bar and make it the root controller
    UITabBarController *tabBarController = [[[UITabBarController alloc] init] autorelease];
    tabBarController.viewControllers = [NSArray arrayWithObjects:hotController, shopNavController, wishListController, eventsNavController, accountController, nil];
    self.window.rootViewController = tabBarController;

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application;
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
