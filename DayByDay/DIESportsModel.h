//
//  DIESportsModel.h
//  DayByDay
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
@interface DIESportsModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSURL *url;


+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;//封装用

+ (void)SportsModelFromJSONDictionary:(NSDictionary *)dictionary;//转化用
@end
