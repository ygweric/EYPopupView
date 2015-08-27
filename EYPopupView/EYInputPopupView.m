//
//  EYInputPopupView.m
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "EYInputPopupView.h"
#import "EYPopupViewMacro.h"
#import "EYTextField.h"

#define CONTENT_VIEW_POPVIEW ((popView.type==EYInputPopupView_Type_single_line_text)?popView.tfContent:popView.tvContent)
#define CONTENT_VIEW ((_type==EYInputPopupView_Type_single_line_text)?_tfContent:_tvContent)
#define CONTENT_TEXT ((_type==EYInputPopupView_Type_single_line_text)?_tfContent.text:_tvContent.text)


@interface EYInputPopupView ()<UITextViewDelegate,UITextFieldDelegate>


@property (nonatomic) BOOL leftLeave;
@property (nonatomic) EYInputPopupView_Type type;
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) UITextView *tvContent;
@property (nonatomic, strong) UITextField *tfContent;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *backImageView;


@property (nonatomic, copy) dispatch_block_t cancelBlock;
//@property (nonatomic, copy) void (^confirmBlock)(UIView*, NSString*);
@property (nonatomic, copy) clickBlock confirmBlock;
@property (nonatomic, copy) dispatch_block_t dismissBlock;

@end


@implementation EYInputPopupView


+ (void)popViewWithTitle:(NSString *)title
             contentText:(NSString *)content
                    type:(EYInputPopupView_Type)type
               cancelBlock:(dispatch_block_t)cancelBlock
              confirmBlock:(clickBlock)confirmBlock
            dismissBlock:(dispatch_block_t)dismissBlock
{
    EYInputPopupView* popView=[EYInputPopupView new];
    
    popView.type=type;
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
    switch (type) {
        case EYInputPopupView_Type_single_line_text:
        {
            popView.tfContent = [[EYTextField alloc] initWithFrame:CGRectMake((kAlertWidth - kContentWidth) * 0.5, CGRectGetMaxY(popView.lbTitle.frame)+kContentTopMargin, kContentWidth, kContentMinHeight)];
            popView.tfContent.delegate=popView;
            popView.tfContent.layer.cornerRadius=3;
            popView.tfContent.layer.borderColor=COLORRGB(0xaeeeeee).CGColor;
            popView.tfContent.layer.borderWidth=0.5;
            popView.tfContent.textAlignment = NSTextAlignmentLeft;
            popView.tfContent.textColor = [UIColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1];
            popView.tfContent.font = [UIFont systemFontOfSize:15.0f];
            popView.tfContent.backgroundColor=[UIColor clearColor];
            [popView addSubview:popView.tfContent];
            popView.tfContent.text = content;
        }
            break;
        case EYInputPopupView_Type_multi_line:
        {
            popView.tvContent = [[UITextView alloc] initWithFrame:CGRectMake((kAlertWidth - kContentWidth) * 0.5, CGRectGetMaxY(popView.lbTitle.frame)+kContentTopMargin, kContentWidth, kContentMinHeight)];
            popView.tvContent.editable=YES;
            popView.tvContent.layer.cornerRadius=3;
            popView.tvContent.layer.borderColor=COLORRGB(0xaeeeeee).CGColor;
            popView.tvContent.layer.borderWidth=0.5;
            popView.tvContent.delegate=popView;;
            popView.tvContent.selectable=YES;
            popView.tvContent.textAlignment = NSTextAlignmentLeft;
            popView.tvContent.textColor = [UIColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1];
            popView.tvContent.font = [UIFont systemFontOfSize:15.0f];
            popView.tvContent.backgroundColor=[UIColor clearColor];
            [popView addSubview:popView.tvContent];
            popView.tvContent.text = content;
        }
            break;
            
        default:
            break;
    }
    
    CGRect leftBtnFrame = CGRectMake((kAlertWidth - 2 * kCoupleButtonWidth - kButtonBottomMargin-5) * 0.5, CGRectGetMaxY(CONTENT_VIEW_POPVIEW.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
    CGRect rightBtnFrame = CGRectMake(CGRectGetMaxX(leftBtnFrame) + kButtonBottomMargin+5, CGRectGetMaxY(CONTENT_VIEW_POPVIEW.frame)+kContentBottomMargin, kCoupleButtonWidth, kButtonHeight);
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
        self.confirmBlock(self,CONTENT_TEXT);
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
    
    switch (_type) {
        case EYInputPopupView_Type_single_line_text:
        {
            if (_tfContent.isFirstResponder) {
                [_tfContent resignFirstResponder];
            } else {
                _leftLeave = YES;
                [self dismissAlert];
            }
        }
            break;
        case EYInputPopupView_Type_multi_line:
        {
            if (_tvContent.isFirstResponder) {
                [_tvContent resignFirstResponder];
            } else {
                _leftLeave = YES;
                [self dismissAlert];
            }
        }
            break;
            
        default:
            break;
    }
    
}
#pragma mark -
-(void)resetFrame{
    
    
    switch (_type) {
        case EYInputPopupView_Type_single_line_text:
        {
            CGRect frame=self.frame;
            frame.size.height=kTitleTopMargin+kTitleHeight+kContentTopMargin+kContentBottomMargin+kButtonHeight+kButtonBottomMargin
                    +self.tfContent.frame.size.height;
            frame.size.width=kAlertWidth;
            self.frame=frame;
        }
            break;
        case EYInputPopupView_Type_multi_line:
        {
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
            break;
            
        default:
            break;
    }
 
    
}
#pragma mark UITextView & 
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self slipView:YES offset:80];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self slipView:NO offset:0];
}
-(void)textViewDidChange:(UITextView *)textView{
    [self resetFrame];
}
-(void)textViewDidBeginEditing:(UITextView *)textView{
    [self slipView:YES offset:30];
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    [self slipView:NO offset:0];
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
