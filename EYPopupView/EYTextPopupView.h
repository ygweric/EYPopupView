//
//  EYTextPopupView.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "EYPopupView.h"


@interface EYTextPopupView : EYPopupView

+ (void)popViewWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
          leftBlock:(dispatch_block_t)leftBlock
         rightBlock:(dispatch_block_t)rightBlock
       dismissBlock:(dispatch_block_t)dismissBlock;

@end

