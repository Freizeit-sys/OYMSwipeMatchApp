//
//  ViewController.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/15.
//

#import "HomeViewController.h"

#import "TopNavigationStackView.h"
#import "CardView.h"
#import "HomeBottomControlsStackView.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *overallStackView;
@property (weak, nonatomic) IBOutlet TopNavigationStackView *topNavigationStackView;
@property (weak, nonatomic) IBOutlet UIView *cardsDeckView;
@property (weak, nonatomic) IBOutlet HomeBottomControlsStackView *bottomControlsStackView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDummyCards];
}

// MARK: - Dummy

- (void)setupDummyCards
{
    for (int i = 0; i < 5; i++) {
        CardView *cardView = [[CardView alloc] init];
        cardView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.cardsDeckView addSubview:cardView];
        
        [NSLayoutConstraint activateConstraints:@[
            [cardView.topAnchor constraintEqualToAnchor:self.cardsDeckView.topAnchor],
            [cardView.leadingAnchor constraintEqualToAnchor:self.cardsDeckView.leadingAnchor],
            [cardView.trailingAnchor constraintEqualToAnchor:self.cardsDeckView.trailingAnchor],
            [cardView.bottomAnchor constraintEqualToAnchor:self.cardsDeckView.bottomAnchor]
        ]];
    }
    // cardsDeckViewを最前面に設定
    [self.overallStackView bringSubviewToFront:self.cardsDeckView];
}

@end
