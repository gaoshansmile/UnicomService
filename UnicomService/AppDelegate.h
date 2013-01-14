//
//  AppDelegate.h
//  UnicomService
//
//  Created by Thierry on 13-1-11.
//  Copyright (c) 2013年 Enway. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginController.h"
#import "UIColor-RGB.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property UINavigationController *navController;
@property LoginController *loginController;

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (UIFont *)getGlobalFont:(CGFloat)fontSize;

@end
