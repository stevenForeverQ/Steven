//
//  DIEApiConfig.m
//  DayByDay
//
//  Created by apple on 15/10/20.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIEApiConfig.h"
//num为数量 page 为页面 都可以改
NSString * const kDIENewsApi = @"http://apis.baidu.com/showapi_open_bus/channel_news/search_news";
NSString  * const kDIENewsApiArg = @"channelId=5572a109b3cdc86cf39001db&channelName=%E5%9B%BD%E5%86%85%E6%9C%80%E6%96%B0&title=%E4%B8%8A%E5%B8%82&page=1";

NSString * const kDIEAmusementApi = @"http://apis.baidu.com/txapi/huabian/newtop";
NSString * const kDIEAmusementApiArg = @"num=10&page=1";//arg num page页面个数可以改动

NSString * const kDIEJokeApi = @"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text";
NSString * const kDIEJokeApiArg = @"page=1";//页面

NSString * const kDIESportsApi = @"http://apis.baidu.com/txapi/tiyu/tiyu";
NSString * const kDIESportsApiArg = @"num=10&page=1";

NSString * const kDIEAnecdotesApi = @"http://apis.baidu.com/txapi/qiwen/qiwen";
NSString * const kDIEAnecdotesApiArg = @"num=10";

NSString * const kDIEHealthApi = @"http://apis.baidu.com/txapi/health/health";
NSString * const kDIEHealthApiArg = @"num=10&page=1";

NSString * const kDIETravelsApi = @"http://apis.baidu.com/qunartravel/travellist/travellist";
NSString * const kDIETravelsApiArg = @"query=%22%22&page=1";

NSString * const kDIESociaNewsApi = @"http://apis.baidu.com/txapi/social/social";
NSString * const kDIESociaNewsApiArg = @"num=10&page=1";

NSString * const kDIEInternationalNewsApi = @"http://apis.baidu.com/txapi/world/world";
NSString * const kDIEInternationalNewsApiArg = @"num=10&page=1";

NSString * const kDIETechnologyNewsApi = @"http://apis.baidu.com/txapi/keji/keji";
NSString * const kDIETechnologyNewsApiArg = @"num=10&page=1";

