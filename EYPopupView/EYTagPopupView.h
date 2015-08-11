//
//  EYTagPopupView.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "EYPopupView.h"
#import "EYPopupViewHeader.h"
/**

 */

typedef void (^arrayClickBlock)(UIView* view, NSArray* tags);
@interface EYTagPopupView : EYPopupView


+ (void)popViewWithTitle:(NSString *)title
                    tags:(NSArray *)tags
                    type:(EYTagPopupView_Type)type
             cancelBlock:(dispatch_block_t)cancelBlock
            confirmBlock:(arrayClickBlock)confirmBlock
            dismissBlock:(dispatch_block_t)dismissBlock;
+ (void)popViewWithTitle:(NSString *)title
                    tags:(NSArray *)tags
              selectTags:(NSArray *)selectTags
                    type:(EYTagPopupView_Type)type
             cancelBlock:(dispatch_block_t)cancelBlock
            confirmBlock:(arrayClickBlock)confirmBlock
            dismissBlock:(dispatch_block_t)dismissBlock;
@end
