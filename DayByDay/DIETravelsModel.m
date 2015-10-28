//
//  DIETravelsModel.m
//  DayByDay
//
//  Created by apple on 15/10/21.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIETravelsModel.h"
#import "DIEDataManager.h"
@implementation DIETravelsModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"bookUrl":@"bookUrl",
             @"title":@"title",
             @"headImage":@"headImage",
             @"userName":@"userName",
             @"userHeadImg":@"userHeadImg",
             @"startTime":@"startTime",
             @"routeDays":@"routeDays",
             @"bookImgNum":@"bookImgNum",
             @"viewCount":@"viewCount",
             @"likeCount":@"likeCount",
             @"commentCount":@"commentCount",
             @"text":@"text",
             @"elite":@"elite"
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
+ (void)TravelsModelFromJSONDictionary:(NSDictionary *)dictionary
{
    
    NSArray *array=[dictionary[@"data"] objectForKey:@"books"];
    [[DIEDataManager sharedManager] parseTravelsArray:array];
    
}

@end
