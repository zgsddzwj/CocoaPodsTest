//
//  EMHeadAdPost.m
//  peopleBookStore
//
//  Created by 星宇陈 on 14/7/30.
//  Copyright (c) 2014年 wordforture. All rights reserved.
//

#import "EMAdPost.h"
#import "EMAFHttpClient.h"
#import "EMBaseEntity+EMRXMLElement.h"
#import "RXMLElement.h"

@implementation EMAdPost

- (instancetype)initwithAttributes:(RXMLElement *)attributes {
    
    if (![super init]) {
        
        return nil;
    }
    
    self.entity = [[EMAdEntity alloc] initWithRXMLElement:attributes];
    
    return self;
}

+ (NSURLSessionDataTask *)requestWithUrl:(NSString *)url paramers:(NSDictionary *)parameters block:(EMPostBlock)block {
    
    return [[EMAFHttpClient shareClient] POST:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        RXMLElement *rootXml = [RXMLElement elementFromXMLData:responseObject];
        
        NSLog(@"Ad = %@", rootXml.tag);
        
        __block NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
        
        [rootXml iterate:@"IMAGE" usingBlock:^(RXMLElement *element) {
            
            EMAdPost *post = [[EMAdPost alloc] initwithAttributes:element];
            
            [array addObject:post];
        }];
        
        if (block) {
            
            block(array, nil);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        if (block) {
            
            block([NSArray array], error);
        }
        
    }];
}

@end

/*
 <IMAGES>
     <IMAGE>
         <id>51</id>
         <colId>8f0e8f9ae6bd447da234aff2058b4f68</colId>
         <URL>adicon/8f0e8f9ae6bd447da234aff2058b4f68095018572.jpg</URL>
         <BOOKID>006965c05f094756a7ce823afe778799</BOOKID>
         <TYPE>1</TYPE>
         <seq>2</seq>
         <colName>推荐广告</colName>
         <verId>15ed006f34ba418e9301278cc87e36c4</verId>
         <adCode>0101</adCode>
         <TITLE>民主四讲</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
     <IMAGE>
         <id>8</id>
         <colId>8f0e8f9ae6bd447da234aff2058b4f68</colId>
         <URL>adicon/8f0e8f9ae6bd447da234aff2058b4f68124749737.jpg</URL>
         <BOOKID>067251bc88bd4aa8b2ab88a0b495c853</BOOKID>
         <TYPE>1</TYPE>
         <seq>1</seq>
         <colName>推荐广告</colName>
         <verId>8cac67ff89734a37a83d8e0cc7b7bd3b</verId>
         <adCode>0101</adCode>
         <TITLE>大题小作</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
 </IMAGES>
 */