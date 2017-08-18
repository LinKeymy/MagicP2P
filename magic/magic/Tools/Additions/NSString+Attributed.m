//
//  NSString+Attributed.m
//  magic
//
//  Created by SteveLin on 2017/7/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//


#import "NSString+Attributed.h"


@implementation NSString (Attributed)
    
    
    
- (NSMutableAttributedString *)transformLastPercentSignWithFontSize:(CGFloat)fontSize {
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(self.length-1, 1)];
    return attributeStr;
}

- (NSMutableAttributedString *)attributedStringWithSubString:(NSString *)subString color:(UIColor *)color {
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:subString];
    if (range.location != NSNotFound) {
        [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attributeStr;
}
- (NSMutableAttributedString *)attributedStringWithSubString:(NSString *)subString color:(UIColor *)color
                                                        font:(NSUInteger)font  font:(NSInteger)subfont
    {
        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName:[UIFont systemFontOfSize:font]}];
        
        NSRange range = [self rangeOfString:subString];
        if (range.location != NSNotFound) {
            [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
            [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:subfont] range:range];
        }
        return attributeStr;
    }
    
    
- (NSMutableAttributedString *)attributedStringWithFirstSubString:(NSString *)firstSubtring andSecondSubString:secondSubString color:(UIColor *)color {
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:firstSubtring];
    if (range.location != NSNotFound) {
        [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    
    range = [self rangeOfString:secondSubString];
    if (range.location != NSNotFound) {
        [attributeStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return attributeStr;
}
    
- (NSMutableAttributedString *)attributedStringWithFirstSubString:(NSString *)firstSubtring andSecondSubString:secondSubString fontSize:(CGFloat)fontSize {
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    NSRange range = [self rangeOfString:firstSubtring];
    if (range.location != NSNotFound) {
        [attributeStr addAttribute:NSFontAttributeName value:font range:range];
    }
    
    range = [self rangeOfString:secondSubString options:NSCaseInsensitiveSearch range:NSMakeRange(range.length, self.length)];
    if (range.location != NSNotFound) {
        [attributeStr addAttribute:NSFontAttributeName value:font range:range];
    }
    return attributeStr;
}

    
- (NSMutableAttributedString *)attributedStringWithSubString:(NSString *)subString fontSize:(CGFloat)fontSize {
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange range = [self rangeOfString:subString];
    if (range.location != NSNotFound) {
        
        UIFont *font = [UIFont systemFontOfSize:fontSize];
        [attributeStr addAttribute:NSFontAttributeName value:font range:range];
        
    }
    return attributeStr;
}


@end
