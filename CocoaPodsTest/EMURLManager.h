//
//  EMURLManager.h
//  EMURL
//
//  Created by 星宇陈 on 14-5-27.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const HOST_REQUEST;
extern NSString *const HOST_DOWNLOAD;

#define kAppKey @"1327865256"      // 微博appkey
#define kRedirectURI    @"http://api.weibo.com/oauth2/default.html"   //微博绑定账户
#define SHOWWEIBOACCOUNT "https://api.weibo.com/2/users/show.json?uid=%@&access_token=%@"//?? 获取微博联系人信息


#define PURCHASEURL     @"http://f.cpgdp.com/front/iospay/payRequest"            //???? 添加至已购买列表

typedef NS_ENUM(NSInteger, EMURLManagerParamURLTpye) {
    
    ParamURLTpye_bookList,              //书城_推荐_重磅推荐               /* 重磅推荐:58 特价专区:72 最新上架:60 今日限免:59 */
    ParamURLTpye_catbookList,           //书城_推荐_分类
    ParamURLTpye_adList,                //书城_推荐_顶部广告               /* 和 ParamURLTpye_ad 是同一个接口 */
    ParamURLTpye_bookDetail,            //～～书籍详情
    ParamURLTpye_bookRanking,           //书城_排行                       /* 畅销榜:1 好评榜:2 新书榜:3 免费榜:4 */
    ParamURLTpye_categoryList_topLevel, //书城_分类_一级列表
    ParamURLTpye_categoryList_subLevel, //书城_分类_一级列表->二级列表展开   /* 上架时间:11, 点击量:22, 评论数量:33, 上架价格:44 */
    ParamURLTpye_ad,                    //广告                           /* 专题页:1002, 书城_推荐_顶部推荐广告:0101, 书城_推荐_中部广告:0010，书城_推荐_底部广告:0012,书城_分类_顶部广告:0013 */  /* 1:电子书ID 2:广告url 3:栏目ID */
    ParamURLTpye_subjectList,           //书城_专题
    ParamURLTpye_bookInSubject,         //书城_专题_专题下的书
    ParamURLTpye_review,                //～～书籍评论
    ParamURLTpye_login,                 //登录
    ParamURLTpye_register,              //注销
    ParamURLTpye_changePassword,        //修改密码
    ParamURLTpye_addFavorite,           //收藏
    ParamURLTpye_delFavorite,           //删除选中的收藏
    ParamURLTpye_deleteCar,             //删除购物车中选中的书籍
    ParamURLTpye_getFavoriteBooks,      //获取收藏列表
    ParamURLTpye_aboutBooks,            //～～书籍详情_相关书籍
    ParamURLTpye_feedback,              //建议反馈
    ParamURLTpye_search,                //搜索
    ParamURLTpye_hotwords,              //热词搜索
    ParamURLTpye_addComment,            //添加评论
    ParamURLTpye_specialPrice,          //书城_特价专区
    ParamURLTpye_freePrice,             //书城_免费专区:“今日限免”
    ParamURLTpye_addToShopcar,          //添加到购物车
    ParamURLTpye_getShopCar,            //获取购物车
    ParamURLTpye_purchasedBooklist,     //获取已购买图书列表
    ParamURLTpye_orderPurchasedList,    //对已购买图书列表排序
    ParamURLTpye_changeNickname,        //修改昵称
    ParamURLType_resetPassword,         //重置密码
};

extern NSString *requestURLWithType (EMURLManagerParamURLTpye type);  // 获取请求URL

// 请求URL对应的参数
extern NSDictionary *Paramer_bookList (NSInteger columnId, NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_catbookList (NSInteger cataId, NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_adList (NSString *adCode);
extern NSDictionary *Paramer_bookDetail (NSString *bookId, NSString *userId);
extern NSDictionary *Paramer_bookRanking (NSInteger rankType, NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_categoryList_topLevel ();
extern NSDictionary *Paramer_categoryList_subLevel (NSString *cataId, NSInteger start, NSInteger pageSize, NSInteger orderType);
extern NSDictionary *Paramer_ad (NSString *adCode);
extern NSDictionary *Paramer_subjectList (NSInteger type);
extern NSDictionary *Paramer_bookInSubject (NSString *subjectId, NSInteger start,NSInteger pageSize);
extern NSDictionary *Paramer_review (NSString *bookId,NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_login (NSString *userName, NSString *password);
extern NSDictionary *Paramer_register (NSString *userName, NSString *password, NSString *nickName);
extern NSDictionary *Paramer_changePassword (NSString *userID, NSString *password, NSString *newPassword);
extern NSDictionary *Paramer_addFavorite (NSString *userId, NSString *bookId);
extern NSDictionary *Paramer_delFavorite (NSString *userId, NSString *bookIds);
extern NSDictionary *Paramer_deleteCar (NSString *userId, NSString *bookIds);
extern NSDictionary *Paramer_getFavoriteBooks (NSString *userID);
extern NSDictionary *Paramer_aboutBooks (NSString *bookID);
extern NSDictionary *Paramer_search (NSString *key, NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_hotwords (NSInteger start,NSInteger pageSize) ;
extern NSDictionary *Paramer_addComment (NSString *userID, NSString *bookID, NSString *comments, NSInteger starLevel);
extern NSDictionary *Paramer_specialPrice (NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_freePrice (NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_addToShopcar (NSString *userID, NSString *bookID);
extern NSDictionary *Paramer_getShopCar (NSString *userID);
extern NSDictionary *Paramer_purchasedBooklist (NSString *userID, NSInteger start, NSInteger pageSize);
extern NSDictionary *Paramer_orderPurchasedList (NSString *userID, NSInteger start, NSInteger pageSize, NSInteger orderType);
extern NSDictionary *Paramer_changeNickname (NSString *nickName, NSString *userName);
extern NSDictionary *Paramer_feedBack (NSString *userId, NSString* userName, NSString* phoneNubmer, NSString* content);
extern NSDictionary *Paramer_resetPassword (NSString *email);
