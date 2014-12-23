//
//  EMURLManager.m
//  EMURL
//
//  Created by 星宇陈 on 14-5-27.
//  Copyright (c) 2014年 星宇陈. All rights reserved.
//

#import "EMURLManager.h"

#define HOST_REQUEST_Official   @"http://f.cpgdp.com/"
#define HOST_DOWNLOAD_Official  @"http://wenjian.dajianet.com/"

#define HOST_REQUEST_test   @""
#define HOST_DOWNLOAD_test  @""

NSString* const HOST_REQUEST = HOST_REQUEST_Official;
NSString* const HOST_DOWNLOAD = HOST_DOWNLOAD_Official;
static NSString* const paramerKey_ShelfId      = @"shelfId";
static NSString* const paramerKey_bookShelfId  = @"bookShelfId";
static NSString* const paramerKey_pronullprice = @"pronullprice";
static NSString* const paramerKey_columnId     = @"columnId";
static NSString* const paramerKey_start        = @"start";
static NSString* const paramerKey_pageSize     = @"pageSize";
static NSString* const paramerKey_cataId       = @"cataId";
static NSString* const paramerKey_adCode       = @"adCode";
static NSString* const paramerKey_bookId       = @"bookId";
static NSString* const paramerKey_userId       = @"userId";
static NSString* const paramerKey_twoLevel     = @"twoLevel";
static NSString* const paramerKey_shelfId      = @"shelfId";
static NSString* const paramerKey_type         = @"type";
static NSString* const paramerKey_subjectId    = @"subjectId";
static NSString* const paramerKey_userName     = @"userName";
static NSString* const paramerKey_nickName     = @"nickName";
static NSString* const paramerKey_password     = @"password";
static NSString* const paramerKey_newPassword  = @"npassword";
static NSString* const paramerKey_comefrom     = @"comefrom";
static NSString* const paramerKey_id           = @"id";
static NSString* const paramerKey_bookIds      = @"bookIds";
static NSString* const paramerKey_orderType    = @"orderType";
static NSString* const paramerKey_phone        = @"phone";
static NSString* const paramerKey_content      = @"content";
static NSString* const paramerKey_key          = @"key";
static NSString* const paramerKey_comments     = @"comments";
static NSString* const paramerKey_starLevel    = @"starLevel";
static NSString* const paramerKey_rankType     = @"rankType";
static NSString* const paramerKey_email        = @"email";

static NSInteger const bookshelfID = 2;  /*iPad : 1, iPhone : 2, android : 3*/
static NSInteger const shelfId     = 2;
NSString *EMURLManagerParamURLString(EMURLManagerParamURLTpye type) {
    NSDictionary *dic = @{
                          
                          @(ParamURLTpye_bookList):              @"front/book/getBooksByColumId?",
                          @(ParamURLTpye_catbookList):           @"front/book/getBookListByCatagoryCodeForFlipPage?",
                          @(ParamURLTpye_adList):                @"front/ad/getADListByCode?",
                          @(ParamURLTpye_bookDetail):            @"front/book/getBookInforByBookIdAndUserId?",
                          @(ParamURLTpye_bookRanking):           @"front/book/getBooksByRanking?",
                          @(ParamURLTpye_categoryList_topLevel): @"front/book/getCatagoryList?",
                          @(ParamURLTpye_categoryList_subLevel): @"front/book/getBookListBySeCatagoryCode?",
                          @(ParamURLTpye_ad):                    @"front/ad/getADListByCode?",
                          @(ParamURLTpye_subjectList):           @"front/subjectbook/shelfSubject?",
                          @(ParamURLTpye_bookInSubject):         @"front/subjectbook/getBooksBySubject?",
                          @(ParamURLTpye_review):                @"front/comments/getCommentsBySIdAndBId?",
                          @(ParamURLTpye_login):                 @"front/login/login?",
                          @(ParamURLTpye_register):              @"front/reg/form?",
                          @(ParamURLTpye_changePassword):        @"front/login/updatePWD?",
                          @(ParamURLTpye_addFavorite):           @"front/userBook/addUserFavorite?",
                          @(ParamURLTpye_delFavorite):           @"front/userBook/deletFavorite?",
                          @(ParamURLTpye_deleteCar):             @"front/userBook/deletUserCart?",
                          @(ParamURLTpye_getFavoriteBooks):      @"front/userBook/getUserFavoriteBooks?",
                          @(ParamURLTpye_aboutBooks):            @"front/book/getRelBooks?",
                          @(ParamURLTpye_feedback):              @"front/feedback/addFeedBack?",
                          @(ParamURLTpye_search):                @"front/book/search?",
                          @(ParamURLTpye_hotwords):              @"front/hotword/getHotWordList?",
                          @(ParamURLTpye_addComment):            @"front/comments/addComments?",
                          @(ParamURLTpye_specialPrice):          @"front/book/getBooksByColumId?",
                          @(ParamURLTpye_freePrice):             @"front/book/getBooksByColumId?",
                          @(ParamURLTpye_addToShopcar):          @"front/userBook/addUserCart?",
                          @(ParamURLTpye_getShopCar):            @"front/userBook/getUserCartByUserId?",
                          @(ParamURLTpye_purchasedBooklist):     @"front/book/getBuyBooksByuserId?",
                          @(ParamURLTpye_orderPurchasedList):    @"front/book/getBuyBooksByuserId?",
                          @(ParamURLTpye_changeNickname):        @"front/updateNickName?",
                          @(ParamURLType_resetPassword):         @"front/login/sendEmailgetPWD?"
                          
                          //10.0.0.23:8050/two/front/feedback/addFeedBack?userId=&userName=&phone=&content=&comefrom=
                          };
    return dic[@(type)];
}

NSString *requestURLWithType (EMURLManagerParamURLTpye type) {
    
    return EMURLManagerParamURLString(type);
}

NSDictionary *Paramer_bookList (NSInteger columnId, NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_pronullprice:@"",
             paramerKey_columnId:@(columnId),
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             
             };
}

NSDictionary *Paramer_catbookList (NSInteger cataId, NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_cataId:@(cataId),
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}

NSDictionary *Paramer_adList (NSString *adCode) {
    
    return @{
             paramerKey_adCode:adCode
             };
}

NSDictionary *Paramer_bookDetail (NSString *bookId, NSString *userId) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_bookId:bookId,
             paramerKey_userId:userId
             };
}

NSDictionary *Paramer_bookRanking (NSInteger rankType, NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_rankType:@(rankType),
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
    /* 畅销榜:1 好评榜:2 新书榜:3 免费榜:4 */
//   http://10.0.0.2:8380/publishtwo/front/book/getBooksByRanking?bookShelfId=2&rankType=2&start=0&pageSize=2
}


NSDictionary *Paramer_categoryList_topLevel () {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_twoLevel:@"true"
             };
}

NSDictionary *Paramer_categoryList_subLevel (NSString *cataId, NSInteger start, NSInteger pageSize, NSInteger orderType) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_cataId:cataId,
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize),
             paramerKey_orderType:@(orderType)
             
             };
    
    /*  上架时间:11, 点击量:22, 评论数量:33, 上架价格:44  */
//    http://f.cpgdp.com/front/book/getBookListBySeCatagoryCode?bookShelfId=2&cataId=6&start=0&pageSize=10&orderType=11
}


NSDictionary *Paramer_ad (NSString *adCode) {
    
    return @{
             paramerKey_adCode:adCode
             };
    
    /*专题页:1002   书城_推荐_顶部推荐广告：0101，书城_推荐_中部广告：0010，书城_推荐_底部广告：0012,书城_分类_顶部广告：0013*/
//    http://f.cpgdp.com/front/ad/getADListByCode?adCode=0101
}


NSDictionary *Paramer_subjectList (NSInteger type) {
    
    return @{
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_type:@(type)
             };
    
}


NSDictionary *Paramer_bookInSubject (NSString *subjectId, NSInteger start,NSInteger pageSize) {
    
    return @{
             paramerKey_subjectId:subjectId,
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}


NSDictionary *Paramer_review (NSString *bookId,NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_bookId:bookId,
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}


NSDictionary *Paramer_login (NSString *userName, NSString *password) {
    
    return @{
             paramerKey_userName:userName,
             paramerKey_password:password,
             paramerKey_comefrom:@"iPad"   // ??? iPhone
             };
}


NSDictionary *Paramer_register (NSString *userName, NSString *password, NSString *nickName) {
    
    return @{
             paramerKey_userName:userName,
             paramerKey_password:password,
             paramerKey_nickName:nickName
             };
}


NSDictionary *Paramer_changePassword (NSString *userName, NSString *password, NSString *newPassword) {
    
    return @{
             paramerKey_userName:userName,
             paramerKey_password:password,
             paramerKey_newPassword:newPassword
             };
}


NSDictionary *Paramer_addFavorite (NSString *userId, NSString *bookId) {
    
    return @{
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_userId:userId,
             paramerKey_bookId:bookId
             };
}


NSDictionary *Paramer_delFavorite (NSString *userId, NSString *bookIds) {
    
    return @{
             paramerKey_userId:userId,
             paramerKey_bookIds:bookIds
             };
}


NSDictionary *Paramer_deleteCar (NSString *userId, NSString *bookIds) {
    
    return @{
             paramerKey_userId:userId,
             paramerKey_bookIds:bookIds
             };
}


NSDictionary *Paramer_getFavoriteBooks (NSString *userID) {
    
    return @{
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_userId:userID
             };
}


NSDictionary *Paramer_aboutBooks (NSString *bookID) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_bookId:bookID
             };
}


NSDictionary *Paramer_search (NSString *key, NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_key:key,
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}


NSDictionary *Paramer_hotwords (NSInteger start,NSInteger pageSize) {
    
    return @{
             paramerKey_ShelfId:@(shelfId),
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}


NSDictionary *Paramer_addComment (NSString *userID, NSString *bookID, NSString *comments, NSInteger starLevel) {
    
    return @{
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_userId:userID,
             paramerKey_bookId:bookID,
             paramerKey_comments:comments,
             paramerKey_starLevel:@(starLevel)
             };
}


NSDictionary *Paramer_specialPrice (NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_pronullprice:@"promotionPrice",
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}


NSDictionary *Paramer_freePrice (NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_bookShelfId:@(bookshelfID),
             paramerKey_pronullprice:@"nullPrice",
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}


NSDictionary *Paramer_addToShopcar (NSString *userID, NSString *bookID) {
    
    return @{
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_userId:userID,
             paramerKey_bookId:bookID
             };
}


NSDictionary *Paramer_getShopCar (NSString *userID) {
    
    return @{
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_userId:userID
             };
}


NSDictionary *Paramer_purchasedBooklist (NSString *userID, NSInteger start, NSInteger pageSize) {
    
    return @{
             paramerKey_userId:userID,
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize)
             };
}


NSDictionary *Paramer_orderPurchasedList (NSString *userID, NSInteger start, NSInteger pageSize, NSInteger orderType) {
    
    return @{
             paramerKey_userId:userID,
             paramerKey_shelfId:@(bookshelfID),
             paramerKey_start:@(start),
             paramerKey_pageSize:@(pageSize),
             paramerKey_orderType:@(orderType)   //1表示时间排序   2表示书名排序
             };
}

NSDictionary *Paramer_changeNickname (NSString *nickName, NSString* userID) {
    
    return @{
             paramerKey_nickName:nickName,
             paramerKey_userId:userID
             };
}

NSDictionary *Paramer_feedBack (NSString *userId, NSString* userName, NSString* phoneNubmer, NSString* content) {
    
    return @{
             paramerKey_userId:userId,
             paramerKey_userName:userName,
             paramerKey_phone:phoneNubmer,
             paramerKey_content:content,
             paramerKey_comefrom:@(1)
             };
    
    /*1成功，2失败，phone是手机或邮箱，content为反馈内容，comefrom来源(1-ipad,2-iphone,3-android),userName可填可不填*/
}

NSDictionary *Paramer_resetPassword (NSString *email){
   
    return @{
             paramerKey_email:email
             };
}
//feedBack
//front/feedback/addFeedBack?userId=&userName=&phone=&content=&comefrom=

NSDictionary *Paramer_purchaseBook (NSData *permFile, NSString *bundleId,NSString *bookId,NSString *shelfId,NSString *userId, NSString *price,NSString *platform)
{
    return nil;
}
