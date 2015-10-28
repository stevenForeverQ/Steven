//
//  DIENetworkManager.h
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIENetworkManager : NSObject


+ (void)request: (NSString*)NewsHttpUrl withNewsHttpArg: (NSString*)NewsHttpArg;
+ (void)request: (NSString*)AmusementHttpUrl withAmusementHttpArg: (NSString*)AmusementHttpArg;
+ (void)requestJoke:(NSString *)JokeHttpUrl withJokeHttpArg:(NSString *)JokeHttpArg;
+ (void)requestSports:(NSString *)SportsHttpUrl withSportsHttpArg:(NSString *)SportsHttpArg;
+ (void)requestAnecdotes:(NSString *)AnecdotesHttpUrl withAnecdotesHttpArg:(NSString *)AnecdotesHttpArg;
+ (void)requestHealth:(NSString *)HealthHttpUrl withHealthHttpArg:(NSString *)HealthHttpArg;
+ (void)requestTravels:(NSString *)TravelsHttpUrl withTravelsHttpArg:(NSString *)TravelsHttpArg;
+ (void)requestSocialNews:(NSString *)SocialNewsHttpUrl withSocialNewsHttpArg:(NSString *)SocialNewsHttpArg;
+ (void)requestInternationalNews:(NSString *)InternationalNewsHttpUrl withInternationalNewsHttpArg:(NSString *)InternationalNewsHttpArg;
+ (void)requestTechnologyNews:(NSString *)TechnologyNewsHttpUrl withTechnologyNewsHttpArg:(NSString *)TechnologyNewsHttpArg;
@end

