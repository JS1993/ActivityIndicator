//
//  ViewController.m
//  Activity indicator
//
//  Created by  江苏 on 16/4/25.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *indicatorView;

@property(strong,nonatomic)CAReplicatorLayer* repL;

@end

@implementation ViewController

-(CAReplicatorLayer *)repL{
    
    if (_repL==nil) {
        _repL=[CAReplicatorLayer layer];
        _repL.frame=self.indicatorView.bounds;
        [self.indicatorView.layer addSublayer:_repL];
    }
    return _repL;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建图层
    CALayer* layer=[CALayer layer];
    
    //设置属性
    layer.position=CGPointMake(_indicatorView.bounds.size.width/2, 20);
    layer.backgroundColor=[UIColor greenColor].CGColor;
    layer.bounds=CGRectMake(0, 0, 10, 10);
    layer.transform=CATransform3DMakeScale(0, 0, 0);
    
    //添加到复制图层
    [self.repL addSublayer:layer];
    
    //给layer添加动画
    CABasicAnimation* basicAnim=[CABasicAnimation animation];
    
    //设置动画属性
    basicAnim.keyPath=@"transform.scale";
    basicAnim.fromValue=@1;
    basicAnim.toValue=@0;
    basicAnim.repeatCount=MAXFLOAT;
    basicAnim.duration=1.0;
    
    //添加到Layer上
    [layer addAnimation:basicAnim forKey:nil];
    
    //设置repL
    self.repL.instanceCount=20;
    
    CGFloat angle=M_PI*2/20;
    self.repL.instanceTransform=CATransform3DMakeRotation(angle, 0, 0, 1);
    
     self.repL.instanceDelay=1.0/20.0;
    
    
}



@end
