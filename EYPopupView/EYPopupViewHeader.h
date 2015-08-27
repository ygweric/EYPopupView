//
//  EYPopupViewHeader.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#ifndef EYLOCALSTRING
#define EYLOCALSTRING(STR) NSLocalizedString(STR, STR)
#endif

#ifndef EYPopupView_Example_EYPopupViewHeader_h
#define EYPopupView_Example_EYPopupViewHeader_h


typedef enum{
    EYTagPopupView_Type_Edit,
    EYTagPopupView_Type_Display,
    EYTagPopupView_Type_Single_Selected,
    EYTagPopupView_Type_Multi_Selected,
}EYTagPopupView_Type;



#import "EYPopupView.h"
#import "EYInputPopupView.h"
#import "EYTextPopupView.h"
#import "EYTagPopupView.h"


#endif
