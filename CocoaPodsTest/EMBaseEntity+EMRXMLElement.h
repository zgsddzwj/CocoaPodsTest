//
//  EMBaseEntity+EMRXMLElement.h
//  ShangHai_iPhone
//
//  Created by 星宇陈 on 14-5-25.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import "EMBaseEntity.h"

@class RXMLElement;

@interface EMBaseEntity (EMRXMLElement)

- (instancetype)initWithRXMLElement:(RXMLElement *)RXMLElement;

@end
