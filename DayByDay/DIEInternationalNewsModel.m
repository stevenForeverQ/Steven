//
//  DIEInternationalNewsModel.m
//  DayByDay
//
//  Created by apple on 15/10/25.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEInternationalNewsModel.h"
#import "DIEDataManager.h"
@implementation DIEInternationalNewsModel
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

+ (void)InternationalNewsModelFromJSONDictionary:(NSDictionary *)dictionary
{
    NSArray *array=[dictionary allValues];
    [[DIEDataManager sharedManager] parseInternationalNews:array];
    
}
@end
