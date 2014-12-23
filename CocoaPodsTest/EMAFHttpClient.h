//
//  EMAFHttpClient.h
//  UniversalReading
//
//  Created by 星宇陈 on 14-4-22.
//  Copyright (c) 2014年 √ä√≤√º√Ç√Ü√°√à√¥√†. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface EMAFHttpClient : AFHTTPSessionManager

+ (EMAFHttpClient *)shareClient;

@end
