//
//  EYInputPopupView.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "EYPopupView.h"
@interface EYInputPopupView : EYPopupView

+ (void)popViewWithTitle:(NSString *)title
        contentText:(NSString *)content
        type:(EYInputPopupView_Type)type
          leftBlock:(dispatch_block_t)leftBlock
         rightBlock:(dispatch_block_t)rightBlock
       dismissBlock:(dispatch_block_t)dismissBlock;
@end
