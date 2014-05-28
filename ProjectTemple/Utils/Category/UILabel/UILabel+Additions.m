//
//  UILabel+Additions.m
//
//
//  Created by lixiang on 13-11-5.
//  Copyright (c) 2013年 . All rights reserved.
//

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (void)adjustFontWithMaxSize:(CGSize)maxSize {
    CGRect stringRect;
    if (CGSizeEqualToSize(maxSize, CGSizeZero)) {
        
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        stringRect = [self.text boundingRectWithSize:self.frame.size options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.font} context:NULL];
#else
        stringRect = [self.text sizeWithFont:self.font
                           constrainedToSize:self.frame.size
                               lineBreakMode:NSLineBreakByWordWrapping];
#endif
    } else {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        stringRect = [self.text boundingRectWithSize:maxSize options:(NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.font} context:NULL];
#else
        stringRect = [self.text sizeWithFont:self.font
                           constrainedToSize:maxSize
                               lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    
    CGRect frame = self.frame;
    frame.size.width = stringRect.size.width;
    if (stringRect.size.height > frame.size.height) {
        frame.size.height = stringRect.size.height;
    }
    self.frame = frame;
    
    NSInteger lines = (int)stringRect.size.height / self.font.xHeight;
    self.numberOfLines = lines;
}

@end
