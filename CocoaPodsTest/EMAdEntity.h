//
//  EMAdEntity.h
//  peopleBookStore
//
//  Created by 星宇陈 on 14/7/29.
//  Copyright (c) 2014年 wordforture. All rights reserved.
//

#import "EMBaseEntity.h"

typedef NS_ENUM(NSInteger, EMAdType) {
    
    EMAdTypeBook  = 1,  // 电子书
    EMAdTypeAdUrl = 2,  // 广告URL
    EMAdTypeColum = 3   // 栏目ID
};

@interface EMAdEntity : EMBaseEntity

@property (nonatomic,retain) NSString *colID;
@property (nonatomic,retain) NSString *coverUrl;
@property (nonatomic,retain) NSString *type;      /* 1:电子书ID 2:广告url 3:栏目ID */
@property (nonatomic,retain) NSString *bookid;
@property (nonatomic,retain) NSString *title;

@end
