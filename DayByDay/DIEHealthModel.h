//
//  DIEHealthModel.h
//  DayByDay
//
//  Created by apple on 15/10/21.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
@interface DIEHealthModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSURL *url;

+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;

+ (void)HealthModelFromJSONDictionary:(NSDictionary *)dictionary;
@end
