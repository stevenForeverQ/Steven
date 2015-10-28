//
//  DIETravelsModel.h
//  DayByDay
//
//  Created by apple on 15/10/21.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"
@interface DIETravelsModel : MTLModel<MTLJSONSerializing>
@property (nonatomic,strong) NSURL * bookUrl;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSURL *headImage;
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSURL * userHeadImg;
@property (nonatomic,strong) NSString *startTime;
@property (nonatomic,assign) NSInteger routeDays;
@property (nonatomic,assign) NSInteger bookImgNum;
@property (nonatomic,assign) NSInteger viewCount;
@property (nonatomic,assign) NSInteger likeCount;
@property (nonatomic,assign) NSInteger commentCount;
@property (nonatomic,strong) NSString * text;
@property (nonatomic,strong) NSString * elite;//true or false 



+ (instancetype)modelFromJSONDictionary:(NSDictionary *)dictionary;
+ (NSArray *)modelsFromJSONArray:(NSArray *)array;

+ (void)TravelsModelFromJSONDictionary:(NSDictionary *)dictionary;
@end
