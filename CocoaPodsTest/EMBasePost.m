//
//  EMBasePost.m
//  EMURL
//
//  Created by 星宇陈 on 14-5-27.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import "EMBasePost.h"


NSString *log_request(NSString *tag, NSString *url, NSDictionary *paramters) {
    
   __block NSString *urlString = @"";
    
    urlString = [NSString stringWithFormat:@"\n\n<%@>\n%@", tag ? tag : @"TagNull", @"http://f.cpgdp.com/"];
    urlString = [urlString stringByAppendingString:url];
    
    [paramters enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        
        urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"%@=%@&", key, obj]];
    }];
    
    return [[urlString substringToIndex:[urlString length] - 1] stringByAppendingString:@"\n\n"];
}

@implementation EMBasePost

+ (void)requestWithUrl:(NSString *)url paramers:(NSDictionary *)parameters {
    
#ifdef REUEST_LOG_DEBUG
    
//     NSLog(@"%@", log_request(requestURLWithType(ParamURLTpye_one), url, parameters));
    
#endif
    
}

+ (NSURLSessionDataTask *)requestWithUrl:(NSString *)url paramers:(NSDictionary *)parameters block:(EMPostBlock)block {
    
    return nil;
};

#pragma mark -
#pragma mark - Encoding

- (void)encodeWithCoder:(NSCoder *)aCoder {};
- (id)initWithCoder:(NSCoder *)aDecoder {
    
   return [super init];
}

@end
