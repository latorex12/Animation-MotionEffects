//
//  ViewController.m
//  Animation-MotionEffects
//
//  Created by 梁天 on 16/10/11.
//  Copyright © 2016年 梁天. All rights reserved.
//

#import "ViewController.h"




@interface ViewController ()

@property (nonatomic, strong) UIImageView *bg;
@property (nonatomic, strong) UIImageView *yurt1;
@property (nonatomic, strong) UIImageView *yurt2;
@property (nonatomic, strong) UIImageView *ship;
@property (nonatomic, strong) UIImageView *octocat;
@property (nonatomic, strong) UIImageView *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
    [self addMotionEffects];
}

- (void)setupViews {
    int viewW = self.view.bounds.size.width;
    int viewH = self.view.bounds.size.height;
    
    UIImageView *bg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    bg.frame = CGRectMake(-100, -100, viewW+200, viewH+200);
    self.bg = bg;
    
    UIImageView *yurt1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yurt1"]];
    yurt1.frame = CGRectMake(viewW-300, viewH/2-100, 200, 75);
    self.yurt1 = yurt1;
    
    UIImageView *yurt2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"yurt2"]];
    yurt2.frame = CGRectMake(viewW-150, viewH/2-180, 120, 50);
    self.yurt2 = yurt2;
    
    UIImageView *ship = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ship"]];
    ship.frame = CGRectMake(viewW/3, viewH/2, viewW*0.66, viewW/3);
    self.ship = ship;

    UIImageView *octocat = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"octocat"]];
    octocat.frame = CGRectMake(viewW/2-15, viewH*0.66, viewW/3, viewW*0.4);
    self.octocat = octocat;
    
    UIImageView *text = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"text"]];
    text.frame = CGRectMake(20, viewH*0.66, viewW/3, viewW/3);
    self.text = text;
    
    [self.view addSubview:bg];
    [self.view addSubview:yurt1];
    [self.view addSubview:yurt2];
    [self.view addSubview:ship];
    [self.view addSubview:octocat];
    [self.view addSubview:text];
}

- (void)addMotionEffects {
    [self addMotionEffectScopeValue:100 target:self.bg];
    [self addMotionEffectScopeValue:120 target:self.yurt2];
    [self addMotionEffectScopeValue:160 target:self.yurt1];
    [self addMotionEffectScopeValue:300 target:self.ship];
    [self addMotionEffectScopeValue:20 target:self.text];
    [self addMotionEffectScopeValue:50 target:self.octocat];
}

- (void)addMotionEffectScopeValue:(CGFloat)scope target:(UIView *)target {
    //初始化
    UIInterpolatingMotionEffect *effectX = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    UIInterpolatingMotionEffect *effectY = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    //范围设置
    effectX.minimumRelativeValue = @(-scope);
    effectX.maximumRelativeValue = @(scope);
    effectY.minimumRelativeValue = @(-scope/2);
    effectY.maximumRelativeValue = @(scope/2);
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc]init];
    group.motionEffects = @[effectX,effectY];
    
    [target addMotionEffect:group];
}


@end
