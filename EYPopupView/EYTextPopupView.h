//
//  EYTextPopupView.h
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "EYPopupView.h"

/**
 [EYTextPopupView popViewWithTitle:@"我是标题" contentText:@"我是正文"
 leftButtonTitle:@"左键"
 rightButtonTitle:@"右键"
 leftBlock:^() {
 NSLog(@"left button clicked");
 }
 rightBlock:^() {
 NSLog(@"left button clicked");
 }
 dismissBlock:^() {
 NSLog(@"Do something interesting after dismiss block");
 }];
 */
@interface EYTextPopupView : EYPopupView

+ (void)popViewWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
          leftBlock:(dispatch_block_t)leftBlock
         rightBlock:(dispatch_block_t)rightBlock
       dismissBlock:(dispatch_block_t)dismissBlock;

@end

