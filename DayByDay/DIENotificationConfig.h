//
//  DIENotificationConfig.h
//  DayByDay
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DIEPost(name, obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj]

#define DIEAddObserver(observer, action, n, obj) [[NSNotificationCenter defaultCenter] addObserver:observer selector:action name:n object:obj]

#define DIERemoveObserver(observer, n, obj) [[NSNotificationCenter defaultCenter] removeObserver:observer name:n object:obj]

FOUNDATION_EXTERN NSString * const kDIENewsUpdateNotif;
FOUNDATION_EXTERN NSString * const kDIEJokeUpdateNotif;
FOUNDATION_EXTERN NSString * const kDIEAmusementUpdateNotif;
FOUNDATION_EXTERN NSString * const kDIESportsUpdateNotif;
FOUNDATION_EXPORT NSString * const kDIEAnecdotesUpdateNotif;
FOUNDATION_EXPORT NSString * const kDIEHealthUpdateNotif;
FOUNDATION_EXPORT NSString * const kDIETravelsUpdateNotif;
FOUNDATION_EXPORT NSString * const kDIESociaNewsUpdateNotif;
FOUNDATION_EXPORT NSString * const kDIEInternationalNewsUpdateNotif;
FOUNDATION_EXPORT NSString * const kDIETechnologyNewsUpdateNotif;