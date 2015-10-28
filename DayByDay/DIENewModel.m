//
//  DIENewModel.m
//  DayByDay
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIENewModel.h"
#import "DIEDataManager.h"
@implementation DIENewModel
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
     return @{
              @"channelId":@"channelId",
              @"channelName":@"channelName",
              @"desc":@"desc",
              @"imageurls":@"imageurls",
              @"link": @"link",
              @"nid":@"nid",
              @"pubDate":@"pubDate",
              @"source": @"source",
              @"title":@"title"
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
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    return [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dict error:nil];
}
+ (NSArray *)modelsWithArray:(NSArray *)array {
    return [MTLJSONAdapter modelsOfClass:[self class] fromJSONArray:array error:nil];
}


+ (void)NewsModelFromJSONDictionary:(NSDictionary *)dictionary
{
   NSArray *array= [[[dictionary objectForKey:@"showapi_res_body"] objectForKey:@"pagebean"] objectForKey:@"contentlist"];
    [[DIEDataManager sharedManager] parseNewsArray:array];
   
}

@end
