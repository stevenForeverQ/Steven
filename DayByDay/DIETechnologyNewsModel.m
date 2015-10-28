//
//  DIETechnologyNewsModel.m
//  DayByDay
//
//  Created by apple on 15/10/25.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIETechnologyNewsModel.h"
#import "DIEDataManager.h"
@implementation DIETechnologyNewsModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"time":@"time",
             @"title":@"title",
             @"desc":@"description",
             @"picUrl":@"picUrl",
             @"url":@"url"
             };
}

+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary {
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionary error:nil];
}

+ (NSArray *)modelsFromJSONArray:(NSArray *)array {
    return [MTLJSONAdapter modelsOfClass:[self class] fromJSONArray:array error:nil];
}

+ (NSValueTransformer *)urlJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (void)TechnologyNewsModelFromJSONDictionary:(NSDictionary *)dictionary
{
    NSArray *array=[dictionary allValues];
    [[DIEDataManager sharedManager] parseTechnologyNews:array];
    
}
@end
