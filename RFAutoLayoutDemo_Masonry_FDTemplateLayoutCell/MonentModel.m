//
//  MonentModel.m
//  RFAutoLayoutDemo_Masonry_FDTemplateLayoutCell
//
//  Created by riceFun on 2018/9/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "MonentModel.h"

@implementation MonentModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _identifier = [self uniqueIdentifier];
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}

- (NSString *)uniqueIdentifier
{
    static NSInteger counter = 0;
    return [NSString stringWithFormat:@"unique-id-%@", @(counter++)];
}

@end
