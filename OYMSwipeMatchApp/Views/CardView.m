//
//  CardView.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/17.
//

#import "CardView.h"

IB_DESIGNABLE
@implementation CardView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

// StoryBoard
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:panGesture];
}

// MARK: - UIPangesture

- (void)handlePan:(UIPanGestureRecognizer*)gesture
{
    switch (gesture.state) {
        case UIGestureRecognizerStateChanged:
            [self handleChanged:gesture];
            break;
        case UIGestureRecognizerStateEnded:
            [self handleEnded];
            break;
        default:
            break;
    }
}

- (void)handleChanged:(UIPanGestureRecognizer*)gesture
{
    CGPoint translation = [gesture translationInView:nil];
    self.transform = CGAffineTransformMakeTranslation(translation.x, translation.y);
}

- (void)handleEnded
{
    [UIView animateWithDuration:0.75
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

@end
