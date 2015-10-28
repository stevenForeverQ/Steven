//
//  DIENetworkManager.m
//  DayByDay
//
//  Created by apple on 15/10/19.
//  Copyright © 2015年 diveinedu. All rights reserved.
//

#import "DIENetworkManager.h"
#import "DIENewModel.h"
#import "DIEAmusementModel.h"
#import "DIEJokeModel.h"
#import "DIESportsModel.h"
#import "DIEAnecdotesModel.h"
#import "DIEHealthModel.h"
#import "DIETravelsModel.h"
#import "DIESocialNewsModel.h"
#import "DIEInternationalNewsModel.h"
#import "DIETechnologyNewsModel.h"
@interface DIENetworkManager()
{
   
}
@end
@implementation DIENetworkManager
static NSString *apiId=@"a9e3ca285d0c811aa5f6118defa9bce0";
// 代码重复率高  
+ (void)request: (NSString*)NewsHttpUrl withNewsHttpArg: (NSString*)NewsHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", NewsHttpUrl, NewsHttpUrl];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:@"a9e3ca285d0c811aa5f6118defa9bce0" forHTTPHeaderField: @"apikey"];
    
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
            NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];//状态码
//            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];//json数据字符串
            NSDictionary *DemoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            id demo=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([demo isKindOfClass:[NSArray class]]) {
                NSLog(@"%@",demo);
            }
            if ([demo isKindOfClass:[NSDictionary class]]) {
                [DIENewModel NewsModelFromJSONDictionary:DemoDic];

            }
            NSLog(@"HttpResponseCode:%ld", responseCode);

           }
        }];
   
}
+ (void)request: (NSString*)AmusementHttpUrl withAmusementHttpArg: (NSString*)AmusementHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@",AmusementHttpUrl, AmusementHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:@"a9e3ca285d0c811aa5f6118defa9bce0" forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
            NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
//            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];//json代码
            NSLog(@"状态码%ld",responseCode);
            NSDictionary *DemoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            if(DemoDic[@"1"]!=nil)
            {
                DIEAmusementModel *model=[DIEAmusementModel modelFromJSONDictionary:DemoDic[@"1"] ];
                NSLog(@"%@",model);
                
            }//例子可以用model拿到封装的json
            
            [DIEAmusementModel AmusementModelFromJSONDictionary:DemoDic];
        }
    }];
}
+ (void)requestJoke:(NSString *)JokeHttpUrl withJokeHttpArg:(NSString *)JokeHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@",JokeHttpUrl, JokeHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
            NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
            NSLog(@"状态码%ld",responseCode);

//                                   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *DemoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            [DIEJokeModel JokeModelFromJSONDictionary:DemoDic];
        }
    }];
}
+ (void)requestSports:(NSString *)SportsHttpUrl withSportsHttpArg:(NSString *)SportsHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", SportsHttpUrl, SportsHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
            NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
            NSLog(@"HttpResponseCode:%ld", responseCode);
            NSDictionary *DemoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            if(DemoDic[@"1"]!=nil)
            {
                DIESportsModel *model=[DIESportsModel modelFromJSONDictionary:DemoDic[@"1"] ];
                
            }//例子可以用model拿到封装的json
            [DIESportsModel SportsModelFromJSONDictionary:DemoDic];
            }
        }];
}

+ (void)requestAnecdotes:(NSString *)AnecdotesHttpUrl withAnecdotesHttpArg:(NSString *)AnecdotesHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", AnecdotesHttpUrl, AnecdotesHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
            NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
            NSLog(@"HttpResponseCode:%ld", responseCode);
            NSDictionary *DemoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            [DIEAnecdotesModel AnecdotesModelFromJSONDictionary:DemoDic];
        }
    }];
}
+ (void)requestHealth:(NSString *)HealthHttpUrl withHealthHttpArg:(NSString *)HealthHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", HealthHttpUrl, HealthHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
                NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                NSLog(@"HttpResponseCode:%ld", responseCode);
            NSDictionary *DemoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [DIEHealthModel HealthModelFromJSONDictionary:DemoDic];
        }
    }];
}
+ (void)requestTravels:(NSString *)TravelsHttpUrl withTravelsHttpArg:(NSString *)TravelsHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@",TravelsHttpUrl, TravelsHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){
        if (error) {
            NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
        } else {
                NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
                NSLog(@"HttpResponseCode:%ld", responseCode);
              NSDictionary *DemoDic=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [DIETravelsModel TravelsModelFromJSONDictionary:DemoDic];
        }
    }];
}
+ (void)requestSocialNews:(NSString *)SocialNewsHttpUrl withSocialNewsHttpArg:(NSString *)SocialNewsHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@",SocialNewsHttpUrl, SocialNewsHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){ if (error) {
        NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
    } else {
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
       
        NSLog(@"HttpResponseCode:%ld", responseCode);
         NSDictionary *DemoDic=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        [DIESocialNewsModel  SocialNewsModelFromJSONDictionary:DemoDic];
        }
    }];
}
+ (void)requestInternationalNews:(NSString *)InternationalNewsHttpUrl withInternationalNewsHttpArg:(NSString *)InternationalNewsHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@",InternationalNewsHttpUrl, InternationalNewsHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){ if (error) {
        NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
    } else {
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        NSLog(@"HttpResponseCode:%ld", responseCode);
        NSDictionary *DemoDic=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        [DIEInternationalNewsModel InternationalNewsModelFromJSONDictionary:DemoDic];
    }
    }];
}
+ (void)requestTechnologyNews:(NSString *)TechnologyNewsHttpUrl withTechnologyNewsHttpArg:(NSString *)TechnologyNewsHttpArg
{
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@",TechnologyNewsHttpUrl, TechnologyNewsHttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue:apiId forHTTPHeaderField: @"apikey"];
    [NSURLConnection sendAsynchronousRequest: request queue: [NSOperationQueue mainQueue] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error){ if (error) {
        NSLog(@"Httperror: %@%ld", error.localizedDescription, error.code);
    } else {
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        NSLog(@"HttpResponseCode:%ld", responseCode);
        NSDictionary *DemoDic=[NSJSONSerialization  JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        [DIETechnologyNewsModel TechnologyNewsModelFromJSONDictionary:DemoDic];
    }
    }];
}
@end
