//
//  FCAnimationView.m
//  CircularTimer
//
//  Created by Mostafizur Rahman on 9/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

#import "FCAnimationView.h"
#define SIZE self.bounds.size
@interface FCAnimationView(){
    FCDrawingView *maskingView;
    CGFloat unitAngle;
    NSInteger *pecentage;
    CGFloat completedAngle;
    UIBezierPath *progressPathT;
    UIBezierPath *progressPathB;
    CAShapeLayer *maskLayer;
    CGPoint _center;
    CGFloat radius;
    CAGradientLayer *gradientLayer;
}

@end

@implementation FCAnimationView


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    gradientLayer = [CAGradientLayer layer];
    self.animationDuration = 10;
    self.animationFps = 20;
    unitAngle = 360 / _animationFps / _animationDuration;
    completedAngle = 0;
    self.lineWidth = 8;
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor magentaColor].CGColor,
                             (__bridge id)[UIColor cyanColor].CGColor];
    [self.layer insertSublayer:gradientLayer atIndex:0];
//    maskingView = [[FCDrawingView alloc] initWithFrame:self.bounds];
//    maskingView.backgroundColor = [UIColor whiteColor];
//    [self addSubview:maskingView];
    
    
    radius = SIZE.width / 2;
    _center = CGPointMake(radius, radius);
    [maskLayer removeFromSuperlayer];
    maskLayer = [CAShapeLayer layer];
    
    maskLayer.strokeColor = [UIColor clearColor].CGColor;
    gradientLayer.mask = maskLayer;
    progressPathT = [UIBezierPath new];
    progressPathB = [UIBezierPath new];
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(calculatePath)
                                   userInfo:nil
                                    repeats:YES];
    return self;
}

-(void)resetAnimation{
    [maskLayer removeFromSuperlayer];
    maskLayer = [CAShapeLayer layer];
    
    maskLayer.strokeColor = [UIColor clearColor].CGColor;
    gradientLayer.mask = maskLayer;
    progressPathT = [UIBezierPath new];
    progressPathB = [UIBezierPath new];
    
    
}

-(void)calculatePath{
    completedAngle += unitAngle;
    progressPathT = [UIBezierPath new];
    progressPathB = [UIBezierPath new];
    [progressPathT moveToPoint:CGPointMake(SIZE.width / 2, 0)];
    [progressPathB moveToPoint:CGPointMake(SIZE.width / 2, 0)];
    [progressPathT addArcWithCenter:_center radius:radius startAngle:0 endAngle:completedAngle / 180 clockwise:NO];
    CGPoint lastPoint = [progressPathT currentPoint];
    
    [progressPathB addLineToPoint:CGPointMake(SIZE.width / 2, self.lineWidth)];
    [progressPathB addArcWithCenter:_center radius:radius-8 startAngle:0 endAngle:completedAngle/180 clockwise:NO];
    [progressPathB addLineToPoint:lastPoint];
    [progressPathB appendPath:progressPathT];
//    [progressPathB closePath];
    
    maskLayer.path = progressPathB.CGPath;
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
