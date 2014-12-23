//
//  EMAFHttpClient.m
//  UniversalReading
//
//  Created by 星宇陈 on 14-4-22.
//  Copyright (c) 2014年 √ä√≤√º√Ç√Ü√°√à√¥√†. All rights reserved.
//

#import "EMAFHttpClient.h"

@implementation EMAFHttpClient

+ (EMAFHttpClient *)shareClient {
    static EMAFHttpClient* shareClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareClient = [[EMAFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://f.cpgdp.com/"]];
        shareClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        shareClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];

    });

    return shareClient;
}

@end
