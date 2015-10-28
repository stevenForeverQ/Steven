//
//  DIEJokeModel.h
//  DayByDay
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
@interface DIEJokeModel : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString *ct;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger type;


+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;

+ (void)JokeModelFromJSONDictionary:(NSDictionary *)dictionary;
@end
