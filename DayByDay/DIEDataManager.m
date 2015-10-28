//
//  DIEDataManager.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEDataManager.h"
#import "DIENetworkManager.h"
#import "DIEApiConfig.h"

static DIEDataManager *instnce;
@implementation DIEDataManager
+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instnce = [DIEDataManager new];
    });
    return instnce;
}
- (instancetype)init
{
    if (self = [super init]) {
        //初始化数组
        _NewsArray = [NSMutableArray array];
        _AmusementArray = [NSMutableArray array];
        _JokeArray = [NSMutableArray array];
        _SportsArray = [NSMutableArray array];
        _AnecdotesArray = [NSMutableArray array];
        _HealthArray = [NSMutableArray array];
        _TravelsArray = [NSMutableArray array];
        _SocialNewsArray = [NSMutableArray array];
        _InternationalNewsArray = [NSMutableArray array];
        _TechnologyNewsArray = [NSMutableArray array];
    }
    return self;
}

#pragma mark NewsData Update
- (void)UpdateWithNewsApiKey
{
    [DIENetworkManager request:kDIENewsApi withNewsHttpArg:kDIENewsApiArg];
}
- (void)parseNewsArray:(NSArray *)array
{
    [_NewsArray removeAllObjects];
  
    [_NewsArray addObjectsFromArray:array];
    
    
    
   
}
#pragma mark Amusement Update
- (void)UpdateWithAmusementApiKey
{
    [DIENetworkManager request:kDIEAmusementApi withAmusementHttpArg:kDIEAmusementApiArg];
}
- (void)parseAmusementArray:(NSArray *)array
{
    [_AmusementArray removeAllObjects];
    for (NSArray *array2 in array) {
        if ([array2 isKindOfClass:[NSDictionary class]]) {
            [_AmusementArray addObject:array2];
        }
    }
    NSLog(@"%@",_AmusementArray);
    
}
#pragma mark Joke Update
- (void)UpdateWithJokeApiKey
{
    [DIENetworkManager requestJoke:kDIEJokeApi withJokeHttpArg:kDIEJokeApiArg];
}
- (void)parseJokeArray:(NSArray *)array
{   [_JokeArray removeAllObjects];
    [_JokeArray addObjectsFromArray:array];
}
#pragma mark Sports Update
- (void)UpdateWithSportsApiKey
{
    [DIENetworkManager requestSports:kDIESportsApi withSportsHttpArg:kDIESportsApiArg];
}
- (void)parseSportsArray:(NSArray *)array
{
    [_SportsArray removeAllObjects];
    for (NSArray *array2 in array) {
        if ([array2 isKindOfClass:[NSDictionary class]]) {
            [_SportsArray addObject:array2];
        }
    }
    NSLog(@"%@",_SportsArray);
}
#pragma mark Anecdotes Update
- (void)UpdateWithAnecdotesApiKey
{
    [DIENetworkManager requestAnecdotes:kDIEAnecdotesApi withAnecdotesHttpArg:kDIEAnecdotesApiArg];
}
- (void)parseAnecdotesArray:(NSArray *)array
{
    [_AnecdotesArray removeAllObjects];
    for (NSArray *array2 in array) {
        if ([array2 isKindOfClass:[NSDictionary class]]) {
            [_AnecdotesArray addObject:array2];
        }
    }
    NSLog(@"%@",_AnecdotesArray);
}
#pragma mark Health Update
- (void)UpdateWithHealthApiKey
{
    [DIENetworkManager requestHealth:kDIEHealthApi withHealthHttpArg:kDIEHealthApiArg];

}
- (void)parseHealthArray:(NSArray *)array
{
    [_HealthArray removeAllObjects];
    for (NSArray *array2 in array) {
        if ([array2 isKindOfClass:[NSDictionary class]]) {
            [_HealthArray addObject:array2];
        }
    }
    NSLog(@"%@",_HealthArray);
}
#pragma mark Travels Update 7.
- (void)UpdateWithTravelsApiKey
{
    [DIENetworkManager requestTravels:kDIETravelsApi withTravelsHttpArg:kDIETravelsApiArg];
}
- (void)parseTravelsArray:(NSArray *)array
{
    [_TravelsArray removeAllObjects];
    [_TravelsArray addObjectsFromArray:array];
}
#pragma mark Social news Update 8;
- (void)UpdateWithSocialNewsApiKey
{
    [DIENetworkManager requestSocialNews:kDIESociaNewsApi withSocialNewsHttpArg:kDIESociaNewsApiArg];
}
- (void)parseSocialNews:(NSArray *)array
{
    [_SocialNewsArray removeAllObjects];
    for (NSArray *array2 in array) {
        if ([array2 isKindOfClass:[NSDictionary class]]) {
            [_SocialNewsArray addObject:array2];
        }
    }
    NSLog(@"%@",_SocialNewsArray);
}
#pragma mark InternationalNews Update 9;
- (void)UpdateWithInternationalNewsApiKey
{
    [DIENetworkManager requestInternationalNews:kDIEInternationalNewsApi withInternationalNewsHttpArg:kDIEInternationalNewsApiArg];
}
- (void)parseInternationalNews:(NSArray *)array
{
    [_InternationalNewsArray removeAllObjects];
    for (NSArray *array2 in array) {
        if ([array2 isKindOfClass:[NSDictionary class]]) {
            [_InternationalNewsArray addObject:array2];
        }
    }
    NSLog(@"%@",_InternationalNewsArray);
}
#pragma mark   TechnologyNews Update 10
- (void)UpdateWithTechnologyNewsApiKey
{
    [DIENetworkManager requestTechnologyNews:kDIETechnologyNewsApi withTechnologyNewsHttpArg:kDIETechnologyNewsApiArg];
}
- (void)parseTechnologyNews:(NSArray *)array
{
    [_TechnologyNewsArray removeAllObjects];
    for (NSArray *array2 in array) {
        if ([array2 isKindOfClass:[NSDictionary class]]) {
            [_TechnologyNewsArray addObject:array2];
        }
    }
    NSLog(@"%@",_TechnologyNewsArray);
}
@end
