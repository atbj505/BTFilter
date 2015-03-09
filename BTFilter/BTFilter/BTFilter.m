//
//  BTFilter.m
//  BTFilter
//
//  Created by Robert on 15/3/9.
//  Copyright (c) 2015年 NationSky. All rights reserved.
//

#import "BTFilter.h"

@interface BTFilter()

@property (nonatomic, copy) NSString *keyString;

@end

@implementation BTFilter

static BTFilter *sharedBTFilter = nil;

/**
 *  单例方法
 *
 *  @return 实例对象
 */
+ (BTFilter *)shareBTFilter{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedBTFilter = [[self alloc] init];
    });
    return sharedBTFilter;
}

/**
 *  初始化方法
 *
 *  @return 实例对象
 */
- (instancetype)init{
    self = [super init];
    if (self) {
        [self keyWordRead];
    }
    return self;
}

/**
 *  字符过滤方法
 *
 *  @param string 被过滤字符
 *
 *  @return 过滤后字符
 */
- (NSString *)filterWithString:(NSString *)string{
    //判断是否存在关键字
    if (!self.keyString) {
        return string;
    }
    
    //字符关键字过滤
    NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:self.keyString];
    NSString *filter = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@"*"];
    return filter;
}

/**
 *  读取关键字
 */
- (void)keyWordRead{
    NSArray *array = [NSArray arrayWithContentsOfFile:[self documentPath]];
    self.keyString = [array componentsJoinedByString:@""];
}

/**
 *  写入关键字
 *
 *  @param array 关键字数组
 */
- (void)keyWordWriteWithArray:(NSArray *)array{
    [array writeToFile:[self documentPath] atomically:YES];
    self.keyString = [array componentsJoinedByString:@""];
}

/**
 *  获取用户路径
 *
 *  @return 用户路径
 */
- (NSString *)documentPath{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    documentPath = [documentPath stringByAppendingPathComponent:@"keyword"];
    return documentPath;
}
@end
