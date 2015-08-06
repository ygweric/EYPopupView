//
//  ViewController.m
//  EYPopupView_Example
//
//  Created by ericyang on 8/5/15.
//  Copyright (c) 2015 Eric Yang. All rights reserved.
//

#import "ViewController.h"
#import "EYPopupViewHeader.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - show text
- (IBAction)showSingleTextPopView:(id)sender {
    EYTextPopupView *alert = [[EYTextPopupView alloc] initWithTitle:@"我是标题" contentText:@"我是正文"
                                                    leftButtonTitle:@"左键"
                                                    rightButtonTitle:@"右键"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
       NSLog(@"left button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}
- (IBAction)showMutliTextPopView:(id)sender {
    EYTextPopupView *alert = [[EYTextPopupView alloc] initWithTitle:@"我是标题我是标题我是标题我是标题" contentText:@"我是正文\n之前本人是一个十足的大胖子 身高 174 体重 接近200斤 而且从生下来就很胖 虽然说平时嘻嘻哈哈的 但在与人相处以及平时做事时 还是会略微显得自卑 自卑于自己的身材 自卑于自己的能力 对于别人的评价很是"
                                                    leftButtonTitle:@"左键"
                                                   rightButtonTitle:@"右键"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}
- (IBAction)showScrollTextPopView:(id)sender {
    EYTextPopupView *alert = [[EYTextPopupView alloc] initWithTitle:@"我是标题我是标题我是标题" contentText:@"我是正文\n之前本人是一个十足的大胖子 身高 174 体重 接近200斤 而且从生下来就很胖 虽然说平时嘻嘻哈哈的 但在与人相处以及平时做事时 还是会略微显得自卑 自卑于自己的身材 自卑于自己的能力 对于别人的评价很是敏感 经过一年的锻炼 减肥50斤 现在怎么说也算是穿衣显瘦 也有点肌肉了 但是感觉自己还是一直走不出内心的一种束缚 还是不敢于在许多人面前讲话 不敢在公众场合勇敢展示自己 不敢大声表达自己的意见与看法 自信心还是严重不足 现在很是苦恼 ！ 健身是个好习惯 现在我基本每周去三四次 已经健身一年多 而且我会一直将这个好习惯保持下去 但感觉健身对于个人来说作用还是有限. 好的身材固然能带来一定的自信提升 但根本的还是自己需要打破这么多年来内心思维的墙这才是顽疾！健身对于提升自信心有多大帮助，不好说，但是，你能下决心减肥，坚持不懈，很强的执行力，如果对待任何事情都很如此，那么早晚有一天你会变得强大，不止是外表，更是内心。"
                                                    leftButtonTitle:@"左键"
                                                   rightButtonTitle:@"右键"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}
#pragma mark - input


- (IBAction)showSingleLineInputView:(id)sender {
    EYInputPopupView *alert = [[EYInputPopupView alloc] initWithTitle:@"我是标题我是标题我是标题我是标题" contentText:@"Do somethi"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}
- (IBAction)showMultiLineInputView:(id)sender {
    EYInputPopupView *alert = [[EYInputPopupView alloc] initWithTitle:@"我是标题我是标题我是标题我是标题" contentText:@"的 但在与人相处以及平时做事时 还是会略微显得自卑 自卑于自己的身材 自卑于自己的能力 对于别人的评价很是敏感 经过一年的锻炼 减肥50斤 现在怎么说也算是穿衣显瘦 也有点肌肉了 但是感觉自己还是一直走不出内心的一种束缚 还是不敢于在许多人面前讲话 不敢在公众场合勇敢展示自己 不敢大声表达自己的意见与看法 自信心还是严重不足 现在很是苦恼 ！ 健身是个好习惯 现在我基本每周去三四次 已经健身一年多 而且我会一直将这个好习惯保持下去 但感觉健身对于个人来说作用还是有限. 好的身材固然能带来一定的自信提升 但根本的还是自己需"];
    [alert show];
    alert.leftBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.rightBlock = ^() {
        NSLog(@"left button clicked");
    };
    alert.dismissBlock = ^() {
        NSLog(@"Do something interesting after dismiss block");
    };
}






@end
