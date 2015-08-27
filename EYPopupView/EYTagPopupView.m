//
//  EYTagPopupView.m
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "EYTagPopupView.h"
#import "EYPopupViewMacro.h"
#import "EYTagView.h"



@interface EYTagPopupView ()<EYTagViewDelegate,UITextFieldDelegate>


@property (nonatomic) BOOL leftLeave;
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) EYTagView* tagView;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *backImageView;


@property (nonatomic, copy) dispatch_block_t cancelBlock;
@property (nonatomic, copy) arrayClickBlock confirmBlock;
@property (nonatomic, copy) dispatch_block_t dismissBlock;

@end


@implementation EYTagPopupView



+ (void)popViewWithTitle:(NSString *)title
                    tags:(NSArray *)tags
                    type:(EYTagPopupView_Type)type
             cancelBlock:(dispatch_block_t)cancelBlock
            confirmBlock:(arrayClickBlock)confirmBlock
            dismissBlock:(dispatch_block_t)dismissBlock
{
    [self popViewWithTitle:title tags:tags selectTags:nil type:type cancelBlock:cancelBlock confirmBlock:confirmBlock dismissBlock:dismissBlock];
 
}
+ (void)popViewWithTitle:(NSString *)title
                    tags:(NSArray *)tags
                    selectTags:(NSArray *)selectTags
                    type:(EYTagPopupView_Type)type
             cancelBlock:(dispatch_block_t)cancelBlock
            confirmBlock:(arrayClickBlock)confirmBlock
            dismissBlock:(dispatch_block_t)dismissBlock
{

    EYTagPopupView* popView=[EYTagPopupView new];
    popView.cancelBlock=cancelBlock;
    popView.confirmBlock=confirmBlock;
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
   

    {
        EYTagView* tagView=[[EYTagView alloc]initWithFrame:CGRectMake((kAlertWidth - kContentWidth) * 0.5, CGRectGetMaxY(popView.lbTitle.frame)+kContentTopMargin, kContentWidth, kContentMinHeight)];
        tagView.delegate=popView;
        
        tagView.colorTag=COLORRGB(0xffffff);
        tagView.colorTagBg=COLORRGB(0xfcbf90);
        tagView.colorInput=COLORRGB(0xfcbf90);
        tagView.colorInputBg=COLORRGB(0xffffff);
        tagView.colorInputPlaceholder=COLORRGB(0xfcbf90);
        tagView.backgroundColor=COLORRGB(0xffffff);
        tagView.colorInputBoard=COLORRGB(0xfcbf90);
        tagView.viewMaxHeight=kContentMaxHeight;
        tagView.type=(EYTagView_Type)type;
        [tagView addTags:tags];
        if (selectTags) {
            [tagView setTagStringsSelected:[NSMutableArray arrayWithArray:selectTags]];
        }
        [popView addSubview:tagView];
        popView.tagView=tagView;
    }
    
    
    
    
    CGRect leftBtnFrame = CGRectMake((kAlertWidth - 2 * kCoupleButtonWidth - kButtonBottomMargin) * 0.5, CGRectGetMaxY(popView.tagView.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
    CGRect rightBtnFrame = CGRectMake(CGRectGetMaxX(leftBtnFrame) + kButtonBottomMargin, CGRectGetMaxY(popView.tagView.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
    popView.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popView.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popView.leftBtn.frame = leftBtnFrame;
    popView.rightBtn.frame = rightBtnFrame;
    
    
    [popView.rightBtn setBackgroundImage:[UIImage imageWithColor:COLORRGB(0xfca2a5)] forState:UIControlStateNormal];
    [popView.leftBtn setBackgroundImage:[UIImage imageWithColor:COLORRGB(0x90d3fe)] forState:UIControlStateNormal];
    [popView.rightBtn setTitle:EYLOCALSTRING(@"OK") forState:UIControlStateNormal];
    [popView.leftBtn setTitle:EYLOCALSTRING(@"Cancel") forState:UIControlStateNormal];
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
    if (self.cancelBlock) {
        self.cancelBlock();
    }
}

- (void)rightBtnClicked:(id)sender
{
    _leftLeave = NO;
    [self dismissAlert];
    if (self.confirmBlock) {
        self.confirmBlock(self,_tagView.tagStrings);
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
        self.frame  = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5,
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
    
    if (self.tagView.tfInput.isFirstResponder) {
        [self.tagView.tfInput resignFirstResponder];
    } else {
        _leftLeave = YES;
        [self dismissAlert];
    }
    
}
#pragma mark -
-(void)resetFrame{
    {
        CGRect leftBtnFrame = CGRectMake((kAlertWidth - 2 * kCoupleButtonWidth - kButtonBottomMargin) * 0.5, CGRectGetMaxY(self.tagView.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
        CGRect rightBtnFrame = CGRectMake(CGRectGetMaxX(leftBtnFrame) + kButtonBottomMargin, CGRectGetMaxY(self.tagView.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
        self.leftBtn.frame = leftBtnFrame;
        self.rightBtn.frame = rightBtnFrame;
    }
    {
        CGRect frame=self.frame;
        frame.size.height=kTitleTopMargin+kTitleHeight+kContentTopMargin+kContentBottomMargin+kButtonHeight+kButtonBottomMargin
        +self.tagView.frame.size.height;
        frame.size.width=kAlertWidth;
        self.frame=frame;
    }
}
#pragma mark UITextView &
-(void)heightDidChangedTagView:(EYTagView *)tagView{
    [self resetFrame];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self slipView:NO offset:60];
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self slipView:YES offset:60];
}

-(void)slipView:(BOOL)isUp offset:(float)offset{
    UIViewController *topVC = [self appRootViewController];
    if (isUp) {
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.transform = CGAffineTransformMakeRotation(0);
            self.frame  = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5,
                                     topVC.view.bounds.origin.y+offset,
                                     self.frame.size.width,
                                     self.frame.size.height);
        } completion:^(BOOL finished) {
        }];
    } else {
        [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.transform = CGAffineTransformMakeRotation(0);
            self.frame  = CGRectMake((CGRectGetWidth(topVC.view.bounds) - kAlertWidth) * 0.5,
                                     (CGRectGetHeight(topVC.view.bounds) - self.frame.size.height) * 0.5,
                                     self.frame.size.width,
                                     self.frame.size.height);
        } completion:^(BOOL finished) {
        }];
    }
   
}

@end
