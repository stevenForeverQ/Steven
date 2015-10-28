//
//  DIEDataManager.h
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DIENewModel.h"
@interface DIEDataManager : NSObject
@property (nonatomic,strong,readonly) NSMutableArray *NewsArray;//一共18组新闻 每组都有
@property (nonatomic,strong,readonly) NSMutableArray *AmusementArray;
@property (nonatomic,strong,readonly) NSMutableArray *JokeArray;
@property (nonatomic,strong,readonly) NSMutableArray *SportsArray;
@property (nonatomic,strong,readonly) NSMutableArray *AnecdotesArray;
@property (nonatomic,strong,readonly) NSMutableArray *HealthArray;
@property (nonatomic,strong,readonly) NSMutableArray *TravelsArray;
@property (nonatomic,strong,readonly) NSMutableArray *SocialNewsArray;
@property (nonatomic,strong,readonly) NSMutableArray *InternationalNewsArray;
@property (nonatomic,strong,readonly) NSMutableArray *TechnologyNewsArray;
+ (instancetype)sharedManager;
- (void)UpdateWithNewsApiKey;
- (void)parseNewsArray:(NSArray *)array;

- (void)UpdateWithAmusementApiKey;
- (void)parseAmusementArray:(NSArray *)array;

- (void)UpdateWithJokeApiKey;
- (void)parseJokeArray:(NSArray *)array;

- (void)UpdateWithSportsApiKey;
- (void)parseSportsArray:(NSArray *)array;

- (void)UpdateWithAnecdotesApiKey;
- (void)parseAnecdotesArray:(NSArray *)array;

- (void)UpdateWithHealthApiKey;
- (void)parseHealthArray:(NSArray *)array;

- (void)UpdateWithTravelsApiKey;
- (void)parseTravelsArray:(NSArray *)array;

- (void)UpdateWithSocialNewsApiKey;
- (void)parseSocialNews:(NSArray *)array;

- (void)UpdateWithInternationalNewsApiKey;
- (void)parseInternationalNews:(NSArray *)array;

- (void)UpdateWithTechnologyNewsApiKey;
- (void)parseTechnologyNews:(NSArray *)array;
@end
