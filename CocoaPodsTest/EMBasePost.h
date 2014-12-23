//
//  EMBasePost.h
//  EMURL
//
//  Created by 星宇陈 on 14-5-27.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EMPostBlock)(NSArray *posts, NSError *error);

extern NSString *log_request(NSString *tag, NSString *url, NSDictionary *paramters);

@interface EMBasePost : NSObject <NSCoding>

+ (void)requestWithUrl:(NSString *)url paramers:(NSDictionary *)parameters;
+ (NSURLSessionDataTask *)requestWithUrl:(NSString *)url paramers:(NSDictionary *)parameters block:(EMPostBlock)block;

- (void)encodeWithCoder:(NSCoder *)aCoder;
- (id)initWithCoder:(NSCoder *)aDecoder;

@end
