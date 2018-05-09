//
//  FCAnimationView.h
//  CircularTimer
//
//  Created by Mostafizur Rahman on 9/5/18.
//  Copyright © 2018 Mostafizur Rahman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCDrawingView.h"

@interface FCAnimationView : UIView
@property (readwrite) CGFloat animationDuration;
@property (readwrite) NSInteger animationFps;
@property (readwrite) CGFloat lineWidth;
@end
