//
//  EMEntity.m
//  EMEntity
//
//  Created by 星宇陈 on 14-5-20.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import "EMBaseEntity.h"

NSString *descriptionForDictionary(NSDictionary *dic) {
    
    NSMutableString *string = [@"{\n" mutableCopy];
    
    __block NSInteger longestKeyCount = 0;
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([key isKindOfClass:[NSString class]]) {
            
            longestKeyCount = [key length] > longestKeyCount ? [key length] : longestKeyCount;
        }
    }];
    
    __block NSInteger keyLength          = 0;
    __block NSInteger differenceValue    = 0;
    __block NSMutableString *appendBlank = nil;
    [dic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([key isKindOfClass:[NSString class]]) {
            
            appendBlank        = [@"" mutableCopy];
            keyLength = [key length];
            differenceValue    = longestKeyCount - keyLength;
            for (int i = 0 ; i < differenceValue; i++) {
                
                [appendBlank appendString:@" "];
            }
            
            if (obj) {
				[string appendFormat:@"  %@%@ = %@\n",key, appendBlank,obj];
			}else {
				[string appendFormat:@"  %@%@ = nil\n", key,appendBlank];
			}
        }
    }];
    
    [string appendString:@"}"];
    
    return string;
}

@implementation EMBaseEntity

- (instancetype)initWithDataDic:(NSDictionary *)DataDic {
    
    self = [super init];
    if (self) {
        
        [self setProperties:DataDic];
    }
    
    return self;
}

- (NSDictionary *)propertyMapDictionary {
    
    return nil;
}

- (void)setProperties:(NSDictionary *)DataDic {
    
    NSDictionary *propertyMapDic = [self propertyMapDictionary];
    
    if (!propertyMapDic) {
        
        __block NSMutableDictionary *mapDic = [NSMutableDictionary dictionaryWithCapacity:[DataDic count]];
        [mapDic enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            
            [mapDic setObject:key forKey:key];
        }];
        
        propertyMapDic = mapDic;
    }
    
    [propertyMapDic enumerateKeysAndObjectsUsingBlock:^(NSString *attributekey, id propertyName, BOOL *stop) {
        
        SEL sel = [self p_getSetterSelectorByPropertyName:propertyName];
        id propertyValue = DataDic[attributekey];
        
        if ([self respondsToSelector:sel]) {
            
            [self performSelectorOnMainThread:sel withObject:propertyValue waitUntilDone:[NSThread isMainThread]];
        }
    }];
}

- (SEL)p_getSetterSelectorByPropertyName:(NSString *)propertyName {
    
    NSString *captial      = [[propertyName substringToIndex:1] uppercaseString];
    NSString *setSelString = [NSString stringWithFormat:@"set%@%@:",captial,[propertyName substringFromIndex:1]];
    return NSSelectorFromString(setSelString);
}

#pragma mark -
#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    NSDictionary *propertyMapDic = [self propertyMapDictionary];
    
    if (!propertyMapDic) {
        
        return;
    }
    [propertyMapDic enumerateKeysAndObjectsUsingBlock:^(NSString *attributeName, NSString *propertyName, BOOL *stop) {
        
        SEL getSel = NSSelectorFromString(propertyName);
		if ([self respondsToSelector:getSel]) {
			NSMethodSignature *signature = nil;
			signature = [self methodSignatureForSelector:getSel];
			NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
			[invocation setTarget:self];
			[invocation setSelector:getSel];
			id valueObj = nil;
			[invocation invoke];
			[invocation getReturnValue:&valueObj];
			
			if (valueObj) {
                
				[aCoder encodeObject:valueObj forKey:propertyName];
			}
        }
    }];
    
    [self customEncodeWithCoder:aCoder];
}

- (void)customEncodeWithCoder:(NSCoder *)aCoder {

}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        
        NSDictionary *propertyMapDic = [self propertyMapDictionary];
        
        if (propertyMapDic) {
            
            [propertyMapDic enumerateKeysAndObjectsUsingBlock:^(NSString *attributekey, id propertyName, BOOL *stop) {
                
                SEL setSel = [self p_getSetterSelectorByPropertyName:propertyName];
                
                if ([self respondsToSelector:setSel]) {
                    
                    id obj = [aDecoder decodeObjectForKey:propertyName];
                    [self performSelectorOnMainThread:setSel
                                           withObject:obj
                                        waitUntilDone:[NSThread isMainThread]];
                }
                
            }];
        }
        
        [self cutomeDecoder:aDecoder];
    }
    
    return self;
}

- (void)cutomeDecoder:(NSCoder *)aDecoder {

}

#pragma mark -
#pragma mark - Description

- (NSString *)description {
    
    NSInteger classNameLength = [NSStringFromClass([self class]) length];
    NSMutableString *seper = [@"-" mutableCopy];
    for (int i = 0 ; i < classNameLength; i++) {
        [seper appendString:@"-"];
    }
    [seper appendString:@"-"];
    
    NSMutableString *attrsDesc   = [NSMutableString
                                    stringWithFormat:@"\n\n<%@>\n%@\n",
                                    NSStringFromClass([self class]),
                                    seper];
    
    NSDictionary *propertyMapDic = [self propertyMapDictionary];
    
    __block NSInteger longestPropertyNameCount = 0;
    [propertyMapDic enumerateKeysAndObjectsUsingBlock:^(NSString *attributekey, id propertyName, BOOL *stop) {
        
        NSInteger count = [propertyName length];
        longestPropertyNameCount = count > longestPropertyNameCount ? count : longestPropertyNameCount;
    }];
    
    __block NSInteger propertyNameLength = 0;
    __block NSInteger differenceValue    = 0;
    __block NSMutableString *appendBlank = nil;
    [propertyMapDic enumerateKeysAndObjectsUsingBlock:^(NSString *attributekey, id propertyName, BOOL *stop) {
        
        SEL getSel = NSSelectorFromString(propertyName);
		if ([self respondsToSelector:getSel]) {
            
            NSMethodSignature *signature = nil;
            signature                    = [self methodSignatureForSelector:getSel];
            NSInvocation *invocation     = [NSInvocation invocationWithMethodSignature:signature];
			[invocation setTarget:self];
			[invocation setSelector:getSel];
            
            id valueObj           = nil;
			[invocation invoke];
			[invocation getReturnValue:&valueObj];
            
            appendBlank        = [@"" mutableCopy];
            propertyNameLength = [propertyName length];
            differenceValue    = longestPropertyNameCount - propertyNameLength;
            for (int i = 0 ; i < differenceValue; i++) {
                
                [appendBlank appendString:@" "];
            }
            
			if (valueObj) {
				[attrsDesc appendFormat:@"%@%@ = %@\n",propertyName, appendBlank,valueObj];
			}else {
				[attrsDesc appendFormat:@"%@%@ = nil\n", propertyName,appendBlank];
			}
		}
    }];

	NSString *customDesc = [self customDescription];
	NSString *desc;
	
	if (customDesc && [customDesc length] > 0) {
        
		desc = [NSString stringWithFormat:@"%@\n--\n%@",[attrsDesc substringToIndex:[attrsDesc length] - 1],customDesc];
	}else {
        [attrsDesc appendString:@"\n"];
		desc = [NSString stringWithFormat:@"%@",attrsDesc];
	}
    
	return desc;
}

- (NSString *)customDescription {
    
    return nil;
}

@end
