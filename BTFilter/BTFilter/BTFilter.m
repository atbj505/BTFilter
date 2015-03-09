//
//  BTFilter.m
//  BTFilter
//
//  Created by Robert on 15/3/9.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "BTFilter.h"

@implementation BTFilter{
    NSString *_filePath;
}

static BTFilter *sharedBTFilter = nil;
+ (BTFilter *)shareBTFilter{
    @synchronized(self){
        if (sharedBTFilter == nil) {
            sharedBTFilter = [[self alloc]init];
        }
        return sharedBTFilter;
    }
}
-(instancetype)init{
    self = [super init];
    if (self) {
        //获取解析plist
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
        NSArray *array = [[NSDictionary dictionaryWithContentsOfFile:dataPath] allValues];
        _filePath = [array componentsJoinedByString:@""];
    }
    return self;
}
- (NSString *)filterWithString:(NSString *)string{
    //字符过滤
    NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:_filePath];
    NSString *filter = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@"*"];
    return filter;
}
@end
