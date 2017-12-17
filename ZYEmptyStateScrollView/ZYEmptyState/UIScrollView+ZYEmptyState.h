//
//  UIScrollView+ZYEmptyState.h
//  ZYEmptyStateScrollView
//
//  Created by 杨志远 on 2017/12/11.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYEmptyDataSource.h"
#import "NSString+ZYStringToColor.h"
#import "UIColor+ZYColorToString.h"


/**
 UIScrollView 视图为空的各种状态

 - ZYScrollViewStateNetworkUnReachable: 无网络链接
 - ZYScrollViewStateLoading: 加载中
 - ZYScrollViewStateNoData: 加载无数据
 - ZYScrollViewStateLoadFailed: 加载失败
 - ZYScrollViewStateLoadSuccess: 加载成功
 */
typedef NS_ENUM(NSUInteger, ZYScrollViewState) {
    ZYScrollViewStateNetworkUnReachable = 0,
    ZYScrollViewStateLoading,
    ZYScrollViewStateNoData,
    ZYScrollViewStateLoadFailed,
    ZYScrollViewStateLoadSuccess
};

@interface UIScrollView (ZYEmptyState)

/**
 空视图的数据源代理对象
 */
@property(nonatomic,strong)ZYEmptyDataSource *emptyDataSource;
/**
 空UIScrollView视图状态
 */
@property(nonatomic,assign)ZYScrollViewState  emptyDataState;
/**
 从数据源数组中加载数据

 @param emptyDataArray 数据源数组
 */
-(void)loadEmptyDataFromArray:(NSArray *)emptyDataArray;

/**
 从plist文件加载数据源
 字典中的color 请以 1 0 0 1 格式设置代表RGBA
 @param plistName plist文件名字
 */
-(void)loadEmptyDataFromPlist:(NSString *)plistName;

@end
