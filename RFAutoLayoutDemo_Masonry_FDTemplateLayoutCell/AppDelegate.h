//
//  AppDelegate.h
//  RFAutoLayoutDemo_Masonry_FDTemplateLayoutCell
//
//  Created by riceFun on 2018/9/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

