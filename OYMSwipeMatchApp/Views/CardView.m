//
//  CardView.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/17.
//

#import "CardView.h"

IB_DESIGNABLE
@interface CardView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

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

- (void)commonInit
{
    // setup view
    UINib *nib = [UINib nibWithNibName:@"CardView" bundle:[NSBundle bundleForClass:self.class]];
    UIView *view = [[nib instantiateWithOwner:self options:nil] firstObject];
    [self addSubview:view];
    
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    
    // setup image view
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        
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
