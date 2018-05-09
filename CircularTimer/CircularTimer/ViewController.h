//
//  ViewController.h
//  CircularTimer
//
//  Created by Mostafizur Rahman on 9/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KDCircularProgress.h"
#import "LineViewAnimation.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet LineViewAnimation *lineAnimationView;

@end

