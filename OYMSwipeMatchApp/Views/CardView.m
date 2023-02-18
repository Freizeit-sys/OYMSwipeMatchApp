//
//  CardView.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/17.
//

#import "CardView.h"

@interface CardView ()
@property (nonatomic) UIImageView *imageView;
@end

IB_DESIGNABLE
@implementation CardView


CGFloat threshold = 80;

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
    
    // setup image view
    UIImage *image = [UIImage imageNamed:@"lady5c"];;
    self.imageView = [[UIImageView alloc] initWithImage:image];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self addSubview:self.imageView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
    
    // setup pan gesture
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
            [self handleEnded:gesture];
            break;
        default:
            break;
    }
}

- (void)handleChanged:(UIPanGestureRecognizer*)gesture
{
    CGPoint translation = [gesture translationInView:nil];
    
    // rotation
    CGFloat degrees = translation.x / 20;
    CGFloat angle = degrees * M_PI / 180;
    
    CGAffineTransform rotationTransformation =
    CGAffineTransformRotate(CGAffineTransformMakeTranslation(translation.x, translation.y), angle);
    
    self.transform = rotationTransformation;
}

- (void)handleEnded:(UIPanGestureRecognizer*)gesture
{
    CGFloat translationDirection = [gesture translationInView:nil].x > 0 ? 1 : -1;
    BOOL shouldDismissCard = fabs([gesture translationInView:nil].x) > threshold;
    
    [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        if (shouldDismissCard) {
            self.transform = CGAffineTransformMakeTranslation(1000 * translationDirection, 0);
        } else {
            self.transform = CGAffineTransformIdentity;
        }
    } completion:^(BOOL finished){
        self.transform = CGAffineTransformIdentity;
        [self removeFromSuperview];
    }];
}

@end
