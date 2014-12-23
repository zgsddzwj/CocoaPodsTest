//
//  EMEntity.h
//  EMEntity
//
//  Created by 星宇陈 on 14-5-20.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *descriptionForDictionary(NSDictionary *dic);

@interface EMBaseEntity : NSObject <NSCoding>

/**
 *  Initlization by data dictionary.
 *
 *  @param dic {DataKey:data}.
 *
 *  @return the entity instance.
 */
- (instancetype)initWithDataDic:(NSDictionary *)DataDic;

/**
 *  set property value by data dictionary {attributeName:propertyValue}.
 *
 *  @param DataDic The data dictionary {attributeName:propertyValue}. the 'attributeName' map to 'property' name.
 */
- (void)setProperties:(NSDictionary *)DataDic;

/**
 *  Get the property map dictionary:{attributeName:propertyName}.
 *
 *  @return The dictionary {attributeName:propertyName}. the 'attributeName' map to 'property' name.
 */
- (NSDictionary *)propertyMapDictionary;

/**
 *  Description for property such as 'NSArray'、'NSDictionary' or custom data type etc.
 *
 *  @return The custom description appending behind the '- Description' method.
 */
- (NSString *)customDescription;

/**
 *  encoder Object not contain in "-propertyMapDictionary". just implement this method, it append behind "-encodeWithCoder:";
 *
 *  @param aCoder
 */
- (void)customEncodeWithCoder:(NSCoder *)aCoder;

/**
 *  decode Object not contain in "-propertyMapDictionary". just implement this method, it append behind "-initWithCoder:";
 *
 *  @param aDecoder
 */
- (void)cutomeDecoder:(NSCoder *)aDecoder;

@end
