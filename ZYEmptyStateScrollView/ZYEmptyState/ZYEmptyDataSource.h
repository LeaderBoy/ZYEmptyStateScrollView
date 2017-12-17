//
//  ZYEmptyDataSource.h
//  ZYEmptyDataSourceScrollView
//
//  Created by 杨志远 on 2017/12/11.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

extern NSString *const ZYEmptyDataSourceTitleKey;
extern NSString *const ZYEmptyDataSourceTitleColorKey;
extern NSString *const ZYEmptyDataSourceTitleFontKey;

extern NSString *const ZYEmptyDataSourceDescriptionTitleKey;
extern NSString *const ZYEmptyDataSourceDescriptionColorKey;
extern NSString *const ZYEmptyDataSourceDescriptionFontKey;

extern NSString *const ZYEmptyDataSourceButtonTitleKey;
extern NSString *const ZYEmptyDataSourceButtonTitleColorKey;
extern NSString *const ZYEmptyDataSourceButtonTitleFontKey;
extern NSString *const ZYEmptyDataSourceButtonImageKey;
extern NSString *const ZYEmptyDataSourceButtonBackgroundImageKey;

extern NSString *const ZYEmptyDataSourceImageKey;

extern NSString *const ZYEmptyDataSourceBackgroundColorKey;

extern NSString *const ZYEmptyDataSourceVerticalOffsetKey;
extern NSString *const ZYEmptyDataSourceVerticalSpaceKey;

@interface ZYEmptyDataSource : NSObject<DZNEmptyDataSetSource>


/**
 CustomView
 */
@property (nonatomic, strong)UIView *emptyCustomView;

/**
 Animation
 */
@property (nonatomic, strong)CAAnimation *emptyImageAnimation;

/**
 数据源 字典
 */
@property(nonatomic,strong)NSDictionary *dataSource;
/**
 初始化ZYEmptyDataSource

 @return self
 */
+(instancetype)dataSourceInitial;
-(void)resetDataSource;
@end
