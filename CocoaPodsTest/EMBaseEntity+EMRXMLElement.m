//
//  EMBaseEntity+EMRXMLElement.m
//  ShangHai_iPhone
//
//  Created by 星宇陈 on 14-5-25.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import "EMBaseEntity+EMRXMLElement.h"
#import <RaptureXML/RXMLElement.h>

@implementation EMBaseEntity (EMRXMLElement)

- (instancetype)initWithRXMLElement:(RXMLElement *)element {
    
    if (self = [super init]) {
        
        [self setProperties:[self dictionaryForRXMLElement:element]];
    }
    return self;
}

- (NSDictionary *)dictionaryForRXMLElement:(RXMLElement *)element {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [element iterate:@"*" usingBlock:^(RXMLElement *propertyElment) {
        
        NSString *attributeKey = propertyElment.tag;
        id propertyValue       = propertyElment.text;
        [dic setObject:propertyValue forKey:attributeKey];
    }];
    
    return dic;
}

@end
