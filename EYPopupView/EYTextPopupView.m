//
//  EYTextPopupView.m
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "EYTextPopupView.h"
#import "EYPopupViewMacro.h"

@interface EYTextPopupView ()

@property (nonatomic) BOOL leftLeave;
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) UITextView *tvContent;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *backImageView;

@property (nonatomic, copy) dispatch_block_t leftBlock;
@property (nonatomic, copy) dispatch_block_t rightBlock;
@property (nonatomic, copy) dispatch_block_t dismissBlock;

@end


@implementation EYTextPopupView{
    
    
}


+ (void)popViewWithTitle:(NSString *)title
        contentText:(NSString *)content
    leftButtonTitle:(NSString *)leftTitle
   rightButtonTitle:(NSString *)rigthTitle
          leftBlock:(dispatch_block_t)leftBlock
         rightBlock:(dispatch_block_t)rightBlock
       dismissBlock:(dispatch_block_t)dismissBlock
{
    EYTextPopupView* popView=[EYTextPopupView new];
    
    popView.leftBlock=leftBlock;
    popView.rightBlock=rightBlock;
    popView.dismissBlock=dismissBlock;
    
    popView.layer.cornerRadius = 5.0;
    popView.backgroundColor = [UIColor whiteColor];
    popView.lbTitle = [[UILabel alloc] initWithFrame:CGRectMake((kAlertWidth - kTitleWidth) * 0.5, kTitleTopMargin, kTitleWidth, kTitleHeight)];
    popView.lbTitle.font = [UIFont boldSystemFontOfSize:20.0f];
    popView.lbTitle.textColor = [UIColor colorWithRed:56.0/255.0 green:64.0/255.0 blue:71.0/255.0 alpha:1];
    popView.lbTitle.textAlignment=NSTextAlignmentCenter;
    popView.lbTitle.backgroundColor=[UIColor clearColor];
    [popView addSubview:popView.lbTitle];
    popView.lbTitle.text = title;
    
    popView.tvContent = [[UITextView alloc] initWithFrame:CGRectMake((kAlertWidth - kContentWidth) * 0.5, CGRectGetMaxY(popView.lbTitle.frame)+kContentTopMargin, kContentWidth, kContentMinHeight)];
    popView.tvContent.editable=NO;
    popView.tvContent.selectable=NO;
    popView.tvContent.textAlignment = popView.lbTitle.textAlignment = NSTextAlignmentCenter;
    popView.tvContent.textColor = [UIColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1];
    popView.tvContent.font = [UIFont systemFontOfSize:15.0f];
    popView.tvContent.backgroundColor=[UIColor clearColor];
    [popView addSubview:popView.tvContent];
    popView.tvContent.text = content;
    
    
    CGRect leftBtnFrame;
    CGRect rightBtnFrame;
    
    if (!leftTitle) {
        rightBtnFrame = CGRectMake((kAlertWidth - kSingleButtonWidth) * 0.5, CGRectGetMaxY(popView.tvContent.frame)+kContentBottomMargin, kSingleButtonWidth, kButtonHeight);
        popView.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        popView.rightBtn.frame = rightBtnFrame;
        
    }else {
        leftBtnFrame = CGRectMake((kAlertWidth - 2 * kCoupleButtonWidth - kButtonBottomMargin) * 0.5, CGRectGetMaxY(popView.tvContent.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
        rightBtnFrame = CGRectMake(CGRectGetMaxX(leftBtnFrame) + kButtonBottomMargin, CGRectGetMaxY(popView.tvContent.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
        popView.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        popView.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        popView.leftBtn.frame = leftBtnFrame;
        popView.rightBtn.frame = rightBtnFrame;
    }
    
    [popView.rightBtn setBackgroundImage:[UIImage imageWithColor:COLORRGB(0xfca2a5)] forState:UIControlStateNormal];
    [popView.leftBtn setBackgroundImage:[UIImage imageWithColor:COLORRGB(0x90d3fe)] forState:UIControlStateNormal];
    [popView.rightBtn setTitle:rigthTitle forState:UIControlStateNormal];
    [popView.leftBtn setTitle:leftTitle forState:UIControlStateNormal];
    popView.leftBtn.titleLabel.font = popView.rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [popView.leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [popView.rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [popView.leftBtn addTarget:popView action:@selector(leftBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [popView.rightBtn addTarget:popView action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    popView.leftBtn.layer.masksToBounds = popView.rightBtn.layer.masksToBounds = YES;
    popView.leftBtn.layer.cornerRadius = popView.rightBtn.layer.cornerRadius = 3.0;
    [popView addSubview:popView.leftBtn];
    [popView addSubview:popView.rightBtn];
    
    UIButton *xButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [xButton setImage:[UIImage imageNamed:@"EYPopupView.bundle/btn_close_normal.png"] forState:UIControlStateNormal];
    [xButton setImage:[UIImage imageNamed:@"EYPopupView.bundle/btn_close_selected.png"] forState:UIControlStateHighlighted];
    xButton.frame = CGRectMake(kAlertWidth - 32, 0, 32, 32);
    [popView addSubview:xButton];
    [xButton addTarget:popView action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
    
    [popView resetFrame];
    [popView show];

}

- (void)leftBtnClicked:(id)sender
{
    _leftLeave = YES;
    [self dismissAlert];
    if (self.leftBlock) {
        self.leftBlock();
    }
}

- (void)rightBtnClicked:(id)sender
{
    _leftLeave = NO;
    [self dismissAlert];
    if (self.rightBlock) {
        self.rightBlock();
    }
}

- (void)show
{
    UIViewController *topVC = [self appRootViewController];
    self.frame=CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5,
                          -self.frame.origin.y-30,
                          self.frame.size.width,
                          self.frame.size.height);

    [topVC.view addSubview:self];
}

- (void)dismissAlert
{
    [self removeFromSuperview];
    if (self.dismissBlock) {
        self.dismissBlock();
    }
}

- (UIViewController *)appRootViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}


- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    UIViewController *topVC = [self appRootViewController];
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5,
                                CGRectGetHeight(topVC.view.bounds),
                                self.frame.size.width,
                                self.frame.size.height);
        if (_leftLeave) {
            self.transform = CGAffineTransformMakeRotation(-M_1_PI / 1.5);
        }else {
            self.transform = CGAffineTransformMakeRotation(M_1_PI / 1.5);
        }
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIViewController *topVC = [self appRootViewController];
    
    if (!self.backImageView) {
        self.backImageView = [[UIView alloc] initWithFrame:topVC.view.bounds];
        self.backImageView.backgroundColor = [UIColor blackColor];
        self.backImageView.alpha = 0.6f;
        self.backImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapPress:)];
        tapGesture.numberOfTapsRequired=1;
        [self.backImageView addGestureRecognizer:tapGesture];
        
    }
    [topVC.view addSubview:self.backImageView];
    self.transform = CGAffineTransformMakeRotation(-M_1_PI / 2);

    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.transform = CGAffineTransformMakeRotation(0);
        self.frame =  self.frame = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5,
                                              (CGRectGetHeight(topVC.view.bounds) - self.frame.size.height) * 0.5,
                                              self.frame.size.width,
                                              self.frame.size.height);
    } completion:^(BOOL finished) {
    }];
    [super willMoveToSuperview:newSuperview];
}

#pragma mark UITapGestureRecognizer
-(void)handleTapPress:(UITapGestureRecognizer *)gestureRecognizer
{
    _leftLeave = YES;
    [self dismissAlert];
}
#pragma mark -
-(void)resetFrame{
    CGSize labelSize = [self.tvContent sizeThatFits:CGSizeMake(kContentWidth, 1000)];
    {
        CGRect frame=self.tvContent.frame;
        frame.size.height=MAX(labelSize.height, kContentMinHeight);
        frame.size.height=MIN(labelSize.height, kContentMaxHeight);
        self.tvContent.frame=frame;
        self.tvContent.scrollEnabled=(self.tvContent.frame.size.height==kContentMaxHeight);
    }
    {
        CGRect leftBtnFrame = CGRectMake((kAlertWidth - 2 * kCoupleButtonWidth - kButtonBottomMargin) * 0.5, CGRectGetMaxY(self.tvContent.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
        CGRect rightBtnFrame = CGRectMake(CGRectGetMaxX(leftBtnFrame) + kButtonBottomMargin, CGRectGetMaxY(self.tvContent.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
        self.leftBtn.frame = leftBtnFrame;
        self.rightBtn.frame = rightBtnFrame;
    }
    {
        CGRect frame=self.frame;
        frame.size.height=kTitleTopMargin+kTitleHeight+kContentTopMargin+kContentBottomMargin+kButtonHeight+kButtonBottomMargin
                    +self.tvContent.frame.size.height;
        frame.size.width=kAlertWidth;
        self.frame=frame;
    }
    
}

@end
