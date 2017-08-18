//
//  NSString+Attributed.h
//  magic
//
//  Created by SteveLin on 2017/7/17.
//  Copyright © 2017年 SteveLin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Attributed)
    
- (NSMutableAttributedString *)attributedStringWithSubString:(NSString *)subString fontSize:(CGFloat)fontSize;
- (NSMutableAttributedString *)attributedStringWithSubString:(NSString *)subString color:(UIColor *)color;
- (NSMutableAttributedString *)transformLastPercentSignWithFontSize:(CGFloat)fontSize;
    - (NSMutableAttributedString *)attributedStringWithSubString:(NSString *)subString color:(UIColor *)color
                                                            font:(NSUInteger)font  font:(NSInteger)subfont;
- (NSMutableAttributedString *)attributedStringWithFirstSubString:(NSString *)firstSubtring andSecondSubString:secondSubString color:(UIColor *)color;
- (NSMutableAttributedString *)attributedStringWithFirstSubString:(NSString *)firstSubtring andSecondSubString:secondSubString fontSize:(CGFloat)fontSize;
@end
