//
//  DIEJokeModel.m
//  DayByDay
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEJokeModel.h"
#import "DIEDataManager.h"
@implementation DIEJokeModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"ct":@"ct",
             @"text":@"text",
             @"title":@"title",
             @"type":@"type"
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
+ (void)JokeModelFromJSONDictionary:(NSDictionary *)dictionary
{
    NSArray *array= [[[dictionary objectForKey:@"showapi_res_body"] objectForKey:@"contentlist"] allObjects];
    [[DIEDataManager sharedManager] parseJokeArray:array];
    
}
@end
