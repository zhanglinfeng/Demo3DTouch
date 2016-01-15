//
//  SearchViewController.m
//  Demo3DTuch
//
//  Created by 张林峰 on 16/1/12.
//  Copyright © 2016年 张林峰. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lb.text = _str;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    // setup a list of preview actions
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"Aciton1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"Aciton2" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton2");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"Aciton3" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Aciton3");
    }];
    
    NSArray *actions = @[action1,action2,action3];
    
    // and return them (return the array of actions instead to see all items ungrouped)
    return actions;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"Began压力 ＝ %f",touch.force);
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
    }
    
}

//按住移动or压力值改变时的回调
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    //通过tag确定按压的是哪个view，注意：如果按压的是label，将label的userInteractionEnabled属性设置为YES
    if (touch.view.tag == 105) {
        NSLog(@"move压力 ＝ %f",touch.force);
        //红色背景的label显示压力值
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
        //红色背景的label上移的高度＝压力值*100
        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"End压力 ＝ %f",touch.force);
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
    }
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *arrayTouch = [touches allObjects];
    UITouch *touch = (UITouch *)[arrayTouch lastObject];
    if (touch.view.tag == 105) {
        NSLog(@"Cancel压力 ＝ %f",touch.force);
        NSLog(@"压力所在view的tag ＝ %li",touch.view.tag);
        _lbForce.text = [NSString stringWithFormat:@"压力%f",touch.force];
        _bottom.constant = ((UITouch *)[arrayTouch lastObject]).force * 100;
    }
    
}

@end
