//
//  UIColor+ZYColorToString.m
//  ZYEmptyStateScrollView
//
//  Created by 杨志远 on 2017/12/12.
//  Copyright © 2017年 BaQiWL. All rights reserved.
//

#import "UIColor+ZYColorToString.h"

@implementation UIColor (ZYColorToString)
-(NSString *)zy_colorToString {    
    CGColorRef colorRef = self.CGColor;
    NSString *colorString =[CIColor colorWithCGColor:colorRef].stringRepresentation;
    return colorString;
}
@end
