//
//  EYPopupView.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define COLORRGBA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0	\
green:((c>>8)&0xFF)/255.0	\
blue:(c&0xFF)/255.0         \
alpha:a]
#define COLORRGB(c)    [UIColor colorWithRed:((c>>16)&0xFF)/255.0	\
green:((c>>8)&0xFF)/255.0	\
blue:(c&0xFF)/255.0         \
alpha:1.0]


typedef enum{
    EYInputPopupView_Type_single_line_text,
    EYInputPopupView_Type_multi_line,
    //EYInputPopupView_Type_single_line_number,
}EYInputPopupView_Type;

@interface EYPopupView : UIView

@end
@interface UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color;
@end

