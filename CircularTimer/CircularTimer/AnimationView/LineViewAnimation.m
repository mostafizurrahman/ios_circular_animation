//
//  LineViewAnimation.m
//  CircularTimer
//
//  Created by Mostafizur Rahman on 9/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

#import "LineViewAnimation.h"
#define SIZE self.bounds.size
@interface LineViewAnimation()<CAAnimationDelegate>{
    
    
    CAAnimationGroup *groupAnimation;
    CGFloat completedParcentage;
    
    
    
    CAGradientLayer *gradientLayer;
}

@end
@implementation LineViewAnimation
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    gradientLayer = [CAGradientLayer layer];
    self.animationDuration = 10;
    self.animationFps = 20;
    
    self.lineWidth = 8;
    gradientLayer.frame = CGRectMake(0, 0, self.lineWidth, self.lineWidth);
    gradientLayer.cornerRadius = self.lineWidth / 2;
    gradientLayer.masksToBounds = YES;
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    gradientLayer.colors = @[(__bridge id)[UIColor magentaColor].CGColor,
                             (__bridge id)[UIColor cyanColor].CGColor];
    [self.layer insertSublayer:gradientLayer atIndex:0];
    
    
    
    
    [self configureAnimation];
    
    
    
    return self;
}

-(void)animationDidStart:(CAAnimation *)anim{
    
    NSLog(@"start");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [gradientLayer removeAllAnimations];
    NSLog(@"stopped");
}

-(void)configureAnimation{
    
    CABasicAnimation *animationBounds = [CABasicAnimation animationWithKeyPath:@"bounds"];
    CABasicAnimation *animationPosition = [CABasicAnimation animationWithKeyPath:@"position"];
    animationPosition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationBounds.fromValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.lineWidth, self.lineWidth)];
    animationBounds.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.lineWidth)];
    animationPosition.fromValue = [NSValue valueWithCGPoint:CGPointMake(4, 4)];
    animationPosition.toValue = [NSValue valueWithCGPoint:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 4)];
    groupAnimation = [CAAnimationGroup  animation];
    groupAnimation.removedOnCompletion = NO;
    animationPosition.removedOnCompletion = NO;
    animationBounds.removedOnCompletion = NO;
    [groupAnimation setAnimations:@[animationBounds, animationPosition]];
    groupAnimation.duration = self.animationDuration;
    groupAnimation.delegate = self;
    groupAnimation.fillMode=kCAFillModeForwards;
    [gradientLayer addAnimation:groupAnimation forKey:@"animation"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
