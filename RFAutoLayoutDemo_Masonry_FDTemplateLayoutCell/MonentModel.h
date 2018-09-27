//
//  MonentModel.h
//  RFAutoLayoutDemo_Masonry_FDTemplateLayoutCell
//
//  Created by riceFun on 2018/9/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonentModel : NSObject
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;

@end
