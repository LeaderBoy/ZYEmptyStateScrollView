//
//  UIViewController+ZYScrollViewState.m
//  ZYModel
//
//  Created by 杨志远 on 2017/10/19.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UIScrollView+ZYEmptyState.h"
#import <objc/runtime.h>

static char const *const kEmptyDataStateKey = "kEmptyDataStateKey";
static char const *const kEmptyDataSourceKey = "kEmptyDataSourceKey";

static char const *const kEmptyDataArrayKey = "kEmptyDataArrayKey";

@interface UIScrollView(ZYEmptyStatePrivate)
@property(nonatomic,strong)NSArray <NSDictionary *>*emptyDataArray;
@end

@implementation UIScrollView (ZYEmptyStatePrivate)
#pragma mark - Private Property
-(NSArray<NSDictionary *>*)emptyDataArray {
    return objc_getAssociatedObject(self, kEmptyDataArrayKey);
}

-(void)setEmptyDataArray:(NSArray<NSDictionary *>*)emptyDataArray {
    objc_setAssociatedObject(self, kEmptyDataArrayKey, emptyDataArray, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UIScrollView (ZYEmptyState)

-(void)loadEmptyDataFromArray:(NSArray *)emptyDataArray {
    NSAssert(emptyDataArray.count, @"EmptyDataArray为空");
    [self configueEmptyDataSetSource];
    self.emptyDataArray = emptyDataArray;
}
-(void)loadEmptyDataFromPlist:(NSString *)plistName {
    NSAssert(plistName, @"plistName不能为空");
    [self configueEmptyDataSetSource];
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    NSArray * dataSourceArray = [[NSArray alloc] initWithContentsOfFile:path];
    self.emptyDataArray = dataSourceArray;
}

-(void)configueEmptyDataSetSource {
    self.emptyDataSetSource = self.emptyDataSource = [ZYEmptyDataSource dataSourceInitial];
}

#pragma mark - Setter
-(void)setEmptyDataState:(ZYScrollViewState)emptyDataState {
    
    if (self.emptyDataState && self.emptyDataState == emptyDataState) return;
    [self.emptyDataSource resetDataSource];
    if (self.emptyDataArray.count > emptyDataState) {
        
        self.emptyDataSource.dataSource = self.emptyDataArray[emptyDataState];
    }
    objc_setAssociatedObject(self, kEmptyDataStateKey, @(emptyDataState), OBJC_ASSOCIATION_ASSIGN);
}
-(void)setEmptyDataSource:(ZYEmptyDataSource *)emptyDataSource {
    objc_setAssociatedObject(self, kEmptyDataSourceKey, emptyDataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark - Getter
-(ZYScrollViewState )emptyDataState {
    return [objc_getAssociatedObject(self, kEmptyDataStateKey) unsignedIntegerValue];
}
-(ZYEmptyDataSource *)emptyDataSource {
    return objc_getAssociatedObject(self, kEmptyDataSourceKey);
}
@end




