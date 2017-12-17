//
//  NSString+ZYStringToColor.m
//  ZYEmptyStateScrollView
//
//  Created by 杨志远 on 2017/12/12.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "NSString+ZYStringToColor.h"

@implementation NSString (ZYStringToColor)
-(UIColor *)zy_stringToColor {
    if (!self || [self isEqualToString:@""]) {
        return nil;
    }
    CIColor *coreColor = [CIColor colorWithString:self];
    UIColor *color = [UIColor colorWithRed:coreColor.red green:coreColor.green blue:coreColor.blue alpha:coreColor.alpha];
    return color;
}
@end
