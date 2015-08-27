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
@property (nonatomic, strong) NSArray* tags;
@property (nonatomic, strong) NSArray* selectedTags;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tags=@[
            @"dog",
            @"cat",
            @"pig",
            @"duck",
            @"horse",
            @"elephant",
            @"ant",
            @"fish",
            @"bird",
            @"engle",
            @"snake",
            @"mouse",
            @"squirrel",
            @"beaver",
            @"kangaroo",
            @"monkey",
            @"panda",
            @"bear",
            @"lion",
            ];
    _selectedTags=@[
                    @"dog",
                    @"pig",
                    @"elephant",
                    @"ant",
                    @"fish",
                    @"engle",
                    @"snake",
                    @"beaver",
                    @"kangaroo",
                    @"panda",
                    @"lion",
                    ];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - show text
- (IBAction)showSingleTextPopView:(id)sender {
    [EYTextPopupView popViewWithTitle:@"I am title.  " contentText:@"I am context.  "
                                                    leftButtonTitle:EYLOCALSTRING(@"Cancel")
                                                    rightButtonTitle:EYLOCALSTRING(@"OK")
                                                          leftBlock:^() {
                                                              NSLog(@"left button clicked");
                                                          }
                                                         rightBlock:^() {
                                                             NSLog(@"left button clicked");
                                                         }
                                                       dismissBlock:^() {
                                                           NSLog(@"Do something interesting after dismiss block");
                                                       }];
 
}
- (IBAction)showMutliTextPopView:(id)sender {
    [EYTextPopupView popViewWithTitle:@"I am title.  " contentText:@"I am context.  \nThe easiest place to start is translating your app description for each of the countries in which you offer apps. Customers are more likely to read about your app if it’s in their native language. It just makes it easier for more people to learn about your app. For details on localizing metadata, keywords, and screenshots, read the iTunes Connect Developer Guide."
                      leftButtonTitle:EYLOCALSTRING(@"Cancel")
                     rightButtonTitle:EYLOCALSTRING(@"OK")
                            leftBlock:^() {
                                NSLog(@"left button clicked");
                            }
                           rightBlock:^() {
                               NSLog(@"left button clicked");
                           }
                         dismissBlock:^() {
                             NSLog(@"Do something interesting after dismiss block");
                         }];
}
- (IBAction)showScrollTextPopView:(id)sender {
    [EYTextPopupView popViewWithTitle:@"I am title.  " contentText:@"I am context.  \nThe easiest place to start is translating your app description for each of the countries in which you offer apps. Customers are more likely to read about your app if it’s in their native language. It just makes it easier for more people to learn about your app. For details on localizing metadata, keywords, and screenshots, read the iTunes Connect Developer Guide.The easiest place to start is translating your app description for each of the countries in which you offer apps. Customers are more likely to read about your app if it’s in their native language. It just makes it easier for more people to learn about your app. For details on localizing metadata, keywords, and screenshots, read the iTunes Connect Developer Guide."
                      leftButtonTitle:EYLOCALSTRING(@"Cancel")
                     rightButtonTitle:EYLOCALSTRING(@"OK")
                            leftBlock:^() {
                                NSLog(@"left button clicked");
                            }
                           rightBlock:^() {
                               NSLog(@"left button clicked");
                           }
                         dismissBlock:^() {
                             NSLog(@"Do something interesting after dismiss block");
                         }];
}
#pragma mark - input


- (IBAction)showSingleLineInputView:(id)sender {
    [EYInputPopupView popViewWithTitle:@"I am title.  I am title.  I am title.  I am title.  " contentText:@"Do somethi"
                                        type:EYInputPopupView_Type_single_line_text
                                                           cancelBlock:^{
                                                               
                                                           } confirmBlock:^(UIView *view, NSString *text) {
                                                               
                                                           } dismissBlock:^{
                                                               
                                                           }];
 
}
- (IBAction)showMultiLineInputView:(id)sender {
    [EYInputPopupView popViewWithTitle:@"I am title.  I am title.  I am title.  I am title.  " contentText:@"The easiest place to st Connect Developer Guide."
                                  type:EYInputPopupView_Type_multi_line
                           cancelBlock:^{
                               
                           } confirmBlock:^(UIView *view, NSString *text) {
                               
                           } dismissBlock:^{
                               
                           }];
}


- (IBAction)showTagEditView:(id)sender {

    [EYTagPopupView popViewWithTitle:@"I am title.  I am title.  I am title.  I am title.  "
                                tags:_tags
                                type:EYTagPopupView_Type_Edit
                         cancelBlock:^{
                            
                        } confirmBlock:^(UIView *view, NSArray *tags) {
                            NSLog(@"tags:   %@",tags);
                        } dismissBlock:^{
                            
                        }];
}
- (IBAction)showRadioTag:(id)sender {
    [EYTagPopupView popViewWithTitle:@"I am title.  I am title.  I am title.  I am title.  "
                                tags:_tags
                                type:EYTagPopupView_Type_Single_Selected
                         cancelBlock:^{
                             
                         } confirmBlock:^(UIView *view, NSArray *tags) {
                             NSLog(@"tags:   %@",tags);
                         } dismissBlock:^{
                             
                         }];
}

- (IBAction)showCheckboxTag:(id)sender {
    [EYTagPopupView popViewWithTitle:@"I am title.  I am title.  I am title.  I am title.  "
                                tags:_tags
                                selectTags:_selectedTags
                                type:EYTagPopupView_Type_Multi_Selected
                         cancelBlock:^{
                             
                         } confirmBlock:^(UIView *view, NSArray *tags) {
                             NSLog(@"tags:   %@",tags);
                         } dismissBlock:^{
                             
                         }];
    
}





@end
