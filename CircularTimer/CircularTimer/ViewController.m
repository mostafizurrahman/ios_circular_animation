//
//  ViewController.m
//  CircularTimer
//
//  Created by Mostafizur Rahman on 9/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

#import "ViewController.h"
#import "CircularTimer-Swift.h"

@interface ViewController (){
    KDCircularProgress *progress;
    int counter;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    progress = [[KDCircularProgress alloc] initWithFrame:CGRectMake(150, 300, 200, 200)];
    [self.view addSubview:progress];
    
//    progress.angle;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)animationStart:(id)sender {
    progress.startAngle = 0;
    [_lineAnimationView configureAnimation];
    [progress clearsContextBeforeDrawing];
    [progress animateFromAngle:0 toAngle:360 duration:13 relativeDuration:YES completion:^(BOOL fin) {
        [timer invalidate];
    }];
    counter = 0;
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(updateStatus:)
                                   userInfo:nil
                                    repeats:YES];
//    [progress animateToAngle:360 duration:3 relativeDuration:YES completion:^(BOOL fin) {
    
//    }];
}

-(void)updateStatus:(NSTimer *)timer{
    CGFloat percent = progress.progress;
    self.label.text = [NSString stringWithFormat:@"second %d completed %.2f", ++counter, percent];
}
@end
