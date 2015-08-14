# EYPopupView

------

EYPopupView is a perfect pop view which you can show/input many kinds of things, like : single-line text, multiple lines text, tags, radio or checkboxs.

---
### Why will you use EYPopupView

In most iOS App, users always need to show or input lots of things, such as commends, notes, messages, tags, we need to handler the frame of the UITextfield/UITextView, and we have to move the view up and donw depending the keyboard. it always take we( and me :-D ) lots of time and energy.

Those are the reason I wrote EYPopupView, which you can do those things with only one line code .

I will improve this project always, so you can push your request or the issuse helping me improve EYPopupView.


###What can EYPopupView do and How to use it.

1\ show single line alert

![single-line-display.gif](https://raw.githubusercontent.com/ygweric/EYPopupView/master/screenshots/single-line-display.gif)

```
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
```

2\ show multiple lines alert

![multi-line-display.gif](https://raw.githubusercontent.com/ygweric/EYPopupView/master/screenshots/multi-line-display.gif)

```
 [EYTextPopupView popViewWithTitle:@"我是标题" contentText:@"我是正文\n之前本人是一个十足的大胖子 身高 174 体重 接近200斤 而且从生下来就很胖 虽然说平时嘻嘻哈哈的 但在与人相处以及平时做事时 还是会略微显得自卑 自卑于自己的身材 自卑于自己的能力 对于别人的评价很是敏感 经过一年的锻炼 减肥50斤 现在怎么说也算是穿衣显瘦 也有点肌肉了 但是感觉自己还是一直走不出内心的一种束缚 还是不敢于在许多人面前讲话 不敢在公众场合勇敢展示自己 不敢大声表达自己的意见与看法 自信心还是严重不足 现在很是苦恼 ！ 健身是个好习惯 现在我基本每周去三四次 已经健身一年多 而且我会一直将这个好习惯保持下去 但感觉健身对于个人来说作用还是有限. 好的身材固然能带来一定的自信提升 但根本的还是自己需要打破这么多年来内心思维的墙这才是顽疾！健身对于提升自信心有多大帮助，不好说，但是，你能下决心减肥，坚持不懈，很强的执行力，如果对待任何事情都很如此，那么早晚有一天你会变得强大，不止是外表，更是内心。"
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
```
3\ show single line input pop view


![single-line-edit.gif](https://raw.githubusercontent.com/ygweric/EYPopupView/master/screenshots/single-line-edit.gif)

```
[EYInputPopupView popViewWithTitle:@"我是标题我是标题我是标题我是标题" contentText:@"Do somethi"
                                        type:EYInputPopupView_Type_single_line_text
                                                           cancelBlock:^{
                                                               
                                                           } confirmBlock:^(UIView *view, NSString *text) {
                                                               
                                                           } dismissBlock:^{
                                                               
                                                           }];
```

4\ show multiple lines input pop view


![multi-lines-input.gif](https://raw.githubusercontent.com/ygweric/EYPopupView/master/screenshots/multi-lines-input.gif)

```
EYInputPopupView popViewWithTitle:@"我是标题我是标题我是标题我是标题" contentText:@"的 但在与人相处以及平时做事时 还是会需"
                                  type:EYInputPopupView_Type_multi_line
                           cancelBlock:^{
                               
                           } confirmBlock:^(UIView *view, NSString *text) {
                               
                           } dismissBlock:^{
                               
                           }];
```
*now we need to define some variable for the follwing code snippets*
```
NSArray* _tags=@[
                    @"111",
                    @"222",
                    @"犬瘟热",
                    @"惹我欠人情无人区污染污染",
                    @"3而是",
                    @"是",
                    @"是放大法撒旦",
                    @"撒的发",
                    @"阿斯顿发发生法士大夫",
                    @"撒的发",
                    @"阿是发放的",
                    @"asdfasdf啊大法师",
                    @"阿发",
                    @"撒的发是否是地方萨菲阿Sa",
                    @"发色发",
                    @"额发我份",
                    @"会计法",
                    @"客人房交付给",
                    @"ut6utfj大一点",
                    @"考估计附加费",
                    @"开房间风好大",
                    @"人提交方法",
                    @"i7uhft 代发货",
                    @"放开眼界",
                    @"7就仿佛",
                    ];
    NSArray* _selectedTags=@[
            @"111",
            @"222",
            @"犬瘟热",
            @"惹我欠人情无人区污染污染",
            @"是",
            @"是放大法撒旦",
            @"阿斯顿发发生法士大夫",
            @"阿是发放的",
            @"asdfasdf啊大法师",
            @"撒的发是否是地方萨菲阿Sa",
            @"发色发",
            @"客人房交付给",
            @"ut6utfj大一点",
            @"开房间风好大",
            @"人提交方法",
            @"放开眼界",
            @"7就仿佛",
            ];
```


5\ show tag edit view


![tag_edit.gif](https://raw.githubusercontent.com/ygweric/EYPopupView/master/screenshots/tag_edit.gif)

```
[EYTagPopupView popViewWithTitle:@"我是标题我是标题我是标题我是标题"
                                tags:_tags
                                type:EYTagPopupView_Type_Edit
                         cancelBlock:^{
                            
                        } confirmBlock:^(UIView *view, NSArray *tags) {
                            NSLog(@"tags:   %@",tags);
                        } dismissBlock:^{
                            
                        }];
```

6\ show raido choosing view


![radio.gif](https://raw.githubusercontent.com/ygweric/EYPopupView/master/screenshots/radio.gif)

```
[EYTagPopupView popViewWithTitle:@"我是标题我是标题我是标题我是标题"
                                tags:_tags
                                type:EYTagPopupView_Type_Single_Selected
                         cancelBlock:^{
                             
                         } confirmBlock:^(UIView *view, NSArray *tags) {
                             NSLog(@"tags:   %@",tags);
                         } dismissBlock:^{
                             
                         }];
```
7\ show checkbox choosing view


![checkbox.gif](https://raw.githubusercontent.com/ygweric/EYPopupView/master/screenshots/checkbox.gif)

```
[EYTagPopupView popViewWithTitle:@"我是标题我是标题我是标题我是标题"
                                tags:_tags
                                selectTags:_selectedTags
                                type:EYTagPopupView_Type_Multi_Selected
                         cancelBlock:^{
                             
                         } confirmBlock:^(UIView *view, NSArray *tags) {
                             NSLog(@"tags:   %@",tags);
                         } dismissBlock:^{
                             
                         }];
```




##If you don't know how to use EYPopupView well, you can check the example project or create an issue
