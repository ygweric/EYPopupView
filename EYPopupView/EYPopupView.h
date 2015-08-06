//
//  EYPopupView.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


typedef enum{
    EYInputPopupView_Type_single_line_text,
    EYInputPopupView_Type_multi_line,
}EYInputPopupView_Type;

@interface EYPopupView : UIView

@end
@interface UIImage (colorful)

+ (UIImage *)imageWithColor:(UIColor *)color;
@end

