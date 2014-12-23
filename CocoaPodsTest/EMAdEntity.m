//
//  EMAdEntity.m
//  peopleBookStore
//
//  Created by 星宇陈 on 14/7/29.
//  Copyright (c) 2014年 wordforture. All rights reserved.
//

#import "EMAdEntity.h"

@implementation EMAdEntity

- (NSDictionary *)propertyMapDictionary {
    
    return @{
             
             @"colId":@"colID",
             @"URL":@"coverUrl",
             @"TYPE":@"type",
             @"BOOKID":@"bookid",
             @"TITLE":@"title"
             
             };
}

@end

/*  首页头部广告
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

/*  首页中部广告
 <IMAGES>
     <IMAGE>
         <id>51</id>
         <colId>8f0e8f9ae6bd447da234aff2058b4f68</colId>
         <URL>adicon/8f0e8f9ae6bd447da234aff2058b4f68095018572.jpg</URL>
         <BOOKID>006965c05f094756a7ce823afe778799</BOOKID>
         <TYPE>1</TYPE>
         <seq>2</seq>
         <colName>首页中部</colName>
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
         <colName>首页中部</colName>
         <verId>8cac67ff89734a37a83d8e0cc7b7bd3b</verId>
         <adCode>0101</adCode>
         <TITLE>大题小作</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
 </IMAGES>
 */

/*  首页底部广告
 <IMAGES>
     <IMAGE>
         <id>51</id>
         <colId>8f0e8f9ae6bd447da234aff2058b4f68</colId>
         <URL>adicon/8f0e8f9ae6bd447da234aff2058b4f68095018572.jpg</URL>
         <BOOKID>006965c05f094756a7ce823afe778799</BOOKID>
         <TYPE>1</TYPE>
         <seq>2</seq>
         <colName>首页中部</colName>
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
         <colName>首页中部</colName>
         <verId>8cac67ff89734a37a83d8e0cc7b7bd3b</verId>
         <adCode>0101</adCode>
         <TITLE>大题小作</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
 </IMAGES>
 */

/* 分类广告
 <IMAGES>
     <IMAGE>
         <id>12</id>
         <colId>674325cbbf9c4377a15cc2e0b9bcde37</colId>
         <URL>adicon/674325cbbf9c4377a15cc2e0b9bcde37125441519.jpg</URL>
         <BOOKID>7a0d039398c04ee893d9f952773b470e</BOOKID>
         <TYPE>1</TYPE>
         <seq>4</seq>
         <colName>分类广告</colName>
         <verId>20160ac07590414f93c076790637ba6f</verId>
         <adCode>0013</adCode>
         <TITLE>一个孩子的战争</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
     <IMAGE>
         <id>11</id>
         <colId>674325cbbf9c4377a15cc2e0b9bcde37</colId>
         <URL>adicon/674325cbbf9c4377a15cc2e0b9bcde37125429813.jpg</URL>
         <BOOKID>51404f7ec9cb48c3a299df6d8ccdc5c0</BOOKID>
         <TYPE>1</TYPE>
         <seq>3</seq>
         <colName>分类广告</colName>
         <verId>140c5ca7e3f0474e82dcdb578ac1d7ce</verId>
         <adCode>0013</adCode>
         <TITLE>当时只道是寻常</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
     <IMAGE>
         <id>10</id>
         <colId>674325cbbf9c4377a15cc2e0b9bcde37</colId>
         <URL>adicon/674325cbbf9c4377a15cc2e0b9bcde37125418433.jpg</URL>
         <BOOKID>06fee03084944027b30fef64290056aa</BOOKID>
         <TYPE>1</TYPE>
         <seq>2</seq>
         <colName>分类广告</colName>
         <verId>5d37c865d9354e59a17a590fcd1aa628</verId>
         <adCode>0013</adCode>
         <TITLE>暂居者</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
     <IMAGE>
         <id>9</id>
         <colId>674325cbbf9c4377a15cc2e0b9bcde37</colId>
         <URL>adicon/674325cbbf9c4377a15cc2e0b9bcde3712540541.jpg</URL>
         <BOOKID>067251bc88bd4aa8b2ab88a0b495c853</BOOKID>
         <TYPE>1</TYPE>
         <seq>1</seq>
         <colName>分类广告</colName>
         <verId>8cac67ff89734a37a83d8e0cc7b7bd3b</verId>
         <adCode>0013</adCode>
         <TITLE>大题小作</TITLE>
         <OPENMODE>_self</OPENMODE>
     </IMAGE>
 </IMAGES>
 */