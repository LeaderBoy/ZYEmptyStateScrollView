//
//  ZYEmptyDataSource.m
//  ZYEmptyDataSourceScrollView
//
//  Created by 杨志远 on 2017/12/11.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "ZYEmptyDataSource.h"
#import "NSString+ZYStringToColor.h"

NSString *const ZYEmptyDataSourceTitleKey = @"ZYEmptyDataSourceTitleKey";
NSString *const ZYEmptyDataSourceTitleColorKey = @"ZYEmptyDataSourceTitleColorKey";
NSString *const ZYEmptyDataSourceTitleFontKey = @"ZYEmptyDataSourceTitleFontKey";

NSString *const ZYEmptyDataSourceDescriptionTitleKey = @"ZYEmptyDataSourceDescriptionTitleKey";
NSString *const ZYEmptyDataSourceDescriptionColorKey = @"ZYEmptyDataSourceDescriptionColorKey";
NSString *const ZYEmptyDataSourceDescriptionFontKey = @"ZYEmptyDataSourceDescriptionFontKey";

NSString *const ZYEmptyDataSourceButtonTitleKey = @"ZYEmptyDataSourceButtonTitleKey";
NSString *const ZYEmptyDataSourceButtonTitleColorKey = @"ZYEmptyDataSourceButtonTitleColorKey";
NSString *const ZYEmptyDataSourceButtonTitleFontKey = @"ZYEmptyDataSourceButtonTitleFontKey";
NSString *const ZYEmptyDataSourceButtonImageKey = @"ZYEmptyDataSourceButtonImageKey";
NSString *const ZYEmptyDataSourceButtonBackgroundImageKey = @"ZYEmptyDataSourceButtonBackgroundImageKey";

NSString *const ZYEmptyDataSourceImageKey = @"ZYEmptyDataSourceImageKey";

NSString *const ZYEmptyDataSourceBackgroundColorKey = @"ZYEmptyDataSourceBackgroundColorKey";


NSString *const ZYEmptyDataSourceVerticalOffsetKey = @"ZYEmptyDataSourceVerticalOffsetKey";
NSString *const ZYEmptyDataSourceVerticalSpaceKey = @"ZYEmptyDataSourceVerticalSpaceKey";

@interface ZYEmptyDataSource()
/**
 Title
 */
@property (nonatomic,copy)NSString  *emptyTitle;
@property (nonatomic,strong)UIColor *emptyTitleColor;
@property (nonatomic,strong)UIFont  *emptyTitleFont;
/**
 Description
 */
@property (nonatomic,copy)NSString  *emptyDescriptionTitle;
@property (nonatomic,strong)UIColor *emptyDescriptionColor;
@property (nonatomic,strong)UIFont  *emptyDescriptionFont;
/**
 Button
 */
@property (nonatomic,copy)NSString  *emptyButtonTitle;
@property (nonatomic,strong)UIColor *emptyButtonTitleColor;
@property (nonatomic,strong)UIFont  *emptyButtonTitleFont;
@property (nonatomic,strong)UIImage *emptyButtonImage;
@property (nonatomic,strong)UIImage *emptyButtonBackgroundImage;
/**
 Image
 */
@property (nonatomic,strong)UIImage *emptyImage;
/**
 BackgroundColor
 */
@property (nonatomic,strong)UIColor *emptyBackgroundColor;

/**
 VerticalOffset
 */
@property (nonatomic,assign)CGFloat emptyVerticalOffset;
/**
 VerticalSpace
 */
@property (nonatomic,assign)CGFloat emptyVerticalSpace;

@end

@implementation ZYEmptyDataSource

+(instancetype)dataSourceInitial {
    ZYEmptyDataSource *empty = [[ZYEmptyDataSource alloc] init];
    return empty;
}

-(void)resetDataSource {
    if (self.dataSource) {
        self.dataSource = @{};
    };
}

#pragma mark - Getter

#pragma mark - Title
-(NSString *)emptyTitle {
    return self.dataSource[ZYEmptyDataSourceTitleKey] ?: @"";
}

-(UIColor *)emptyTitleColor {
    UIColor *color = [self.dataSource[ZYEmptyDataSourceTitleColorKey] zy_stringToColor];
   return  color ?: [UIColor blackColor];
}

-(UIFont *)emptyTitleFont {
    CGFloat fontSize = [self.dataSource[ZYEmptyDataSourceTitleFontKey] floatValue] ?: 17.0f;
    return [UIFont systemFontOfSize:fontSize];
}
#pragma mark - Description
-(NSString *)emptyDescriptionTitle {
    return self.dataSource[ZYEmptyDataSourceDescriptionTitleKey] ?: @"";
}

-(UIColor *)emptyDescriptionColor {
    UIColor *color = [self.dataSource[ZYEmptyDataSourceDescriptionColorKey] zy_stringToColor];
    return  color ?: [UIColor lightGrayColor];
}

-(UIFont *)emptyDescriptionFont {
    CGFloat fontSize = [self.dataSource[ZYEmptyDataSourceTitleFontKey] floatValue] ?: 15.0f;
    return [UIFont systemFontOfSize:fontSize];
}

#pragma mark - Button
-(NSString *)emptyButtonTitle {
    return self.dataSource[ZYEmptyDataSourceButtonTitleKey] ?: @"";
}

-(UIColor *)emptyButtonTitleColor {
    UIColor *color = [self.dataSource[ZYEmptyDataSourceButtonTitleColorKey] zy_stringToColor];
    return  color ?: [UIColor blackColor];
}

-(UIFont *)emptyButtonTitleFont {
    CGFloat fontSize = [self.dataSource[ZYEmptyDataSourceButtonTitleFontKey] floatValue] ?: 17.0f;
    return [UIFont systemFontOfSize:fontSize];
}

-(UIImage *)emptyButtonImage {
    NSString *imageName = self.dataSource[ZYEmptyDataSourceButtonImageKey] ?: @"";
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

-(UIImage *)emptyButtonBackgroundImage {
    NSString *imageName = self.dataSource[ZYEmptyDataSourceButtonBackgroundImageKey] ?: @"";
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

#pragma mark - Image
-(UIImage *)emptyImage {
    NSString *imageName = self.dataSource[ZYEmptyDataSourceImageKey] ?: @"";
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}
#pragma mark - BackgroundColor
-(UIColor *)emptyBackgroundColor {
    UIColor *color = [self.dataSource[ZYEmptyDataSourceBackgroundColorKey] zy_stringToColor];
    return  color ?: [UIColor groupTableViewBackgroundColor];
}


#pragma mark - DZNEmptyDataSetSource
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSDictionary *attributesDic = @{NSForegroundColorAttributeName:self.emptyTitleColor,NSFontAttributeName:self.emptyTitleFont};
    NSAttributedString *attributesStr = [[NSAttributedString alloc]initWithString:self.emptyTitle attributes:attributesDic];
    return attributesStr;
}

-(NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    NSDictionary *attributesDic = @{NSForegroundColorAttributeName:self.emptyDescriptionColor,NSFontAttributeName:self.emptyDescriptionFont};
    NSAttributedString *attributesStr = [[NSAttributedString alloc]initWithString:self.emptyDescriptionTitle attributes:attributesDic];
    return attributesStr;
}

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return self.emptyImage;
}

-(NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSDictionary *attributesDic = @{NSForegroundColorAttributeName:self.emptyButtonTitleColor,NSFontAttributeName:self.emptyButtonTitleFont};
    NSAttributedString *attributesStr = [[NSAttributedString alloc]initWithString:self.emptyButtonTitle attributes:attributesDic];
    return attributesStr;
}

-(UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return self.emptyButtonImage;
}

-(UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return self.emptyButtonBackgroundImage;
}

-(UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return self.emptyBackgroundColor;
}

-(UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView {
    return self.emptyCustomView;
}

-(CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return [self.dataSource[ZYEmptyDataSourceVerticalOffsetKey] floatValue] ?: 0;
}

-(CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView {
    return [self.dataSource[ZYEmptyDataSourceVerticalSpaceKey] floatValue] ?: 11.0f;
}

-(CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView {
    return self.emptyImageAnimation;
}

@end
