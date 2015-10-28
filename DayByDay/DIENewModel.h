//
//  DIENewModel.h
//  DayByDay
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
@interface DIENewModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString * channelId;
@property (nonatomic, strong) NSString * channelName;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSArray *imageurls;
@property (nonatomic, copy) NSURL *link;
@property (nonatomic, copy) NSString *nid;
@property (nonatomic, copy) NSDate *pubDate;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;

+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;
+ (instancetype)modelWithDict:(NSDictionary *)dict;
+ (NSArray *)modelsWithArray:(NSArray *)array;

+ (void)NewsModelFromJSONDictionary:(NSDictionary *)dictionary;
@end
