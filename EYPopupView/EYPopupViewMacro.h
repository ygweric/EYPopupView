//
//  EYPopupViewMacro.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/6/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//
#ifndef EYLOCALSTRING
#define EYLOCALSTRING(STR) NSLocalizedString(STR, STR)
#endif


#ifndef EYPopupView_Example_EYPopupViewMacro_h
#define EYPopupView_Example_EYPopupViewMacro_h


#define COLORRGBA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0	\
green:((c>>8)&0xFF)/255.0	\
blue:(c&0xFF)/255.0         \
alpha:a]
#define COLORRGB(c)    [UIColor colorWithRed:((c>>16)&0xFF)/255.0	\
green:((c>>8)&0xFF)/255.0	\
blue:(c&0xFF)/255.0         \
alpha:1.0]



#define _K_SCREEN_WIDTH ([[UIScreen mainScreen ] bounds ].size.width)

#define kAlertWidth (245  * _K_SCREEN_WIDTH/320)
#define kTitleWidth (kAlertWidth-16-32)
#define kContentWidth (kAlertWidth-16)

#define kContentMaxHeight 150.0f
#define kContentMinHeight 34.0f

#define kTitleTopMargin 15.0f
#define kTitleHeight 25.0f

#define kSingleButtonWidth (160.0f * _K_SCREEN_WIDTH/320)
#define kCoupleButtonWidth (107.0f * _K_SCREEN_WIDTH/320)
#define kButtonHeight 40.0f
#define kButtonBottomMargin 10.0f

#define kContentBottomMargin 12.0f
#define kContentTopMargin 6.0f

#endif
