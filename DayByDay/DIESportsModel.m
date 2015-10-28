//
//  DIESportsModel.m
//  DayByDay
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIESportsModel.h"
#import "DIEDataManager.h"
@implementation DIESportsModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
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

+ (void)SportsModelFromJSONDictionary:(NSDictionary *)dictionary
{
    NSArray *array=[dictionary allValues];
    [[DIEDataManager sharedManager] parseSportsArray:array];
    
}
@end
