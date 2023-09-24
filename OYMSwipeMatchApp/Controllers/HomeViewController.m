//
//  ViewController.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/15.
//

#import "HomeViewController.h"

#import "User.h"

#import "TopNavigationStackView.h"
#import "CardView.h"
#import "HomeBottomControlsStackView.h"

@interface HomeViewController ()
@property (nonatomic) NSArray *users;
@property (weak, nonatomic) IBOutlet UIStackView *overallStackView;
@property (weak, nonatomic) IBOutlet TopNavigationStackView *topNavigationStackView;
@property (weak, nonatomic) IBOutlet UIView *cardsDeckView;
@property (weak, nonatomic) IBOutlet HomeBottomControlsStackView *bottomControlsStackView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup users
    self.users = @[
        [[User alloc] initWithName:@"Jane" age:18 profession:@"Teacher" imageName:@"lady4c"],
        [[User alloc] initWithName:@"Kelly" age:23 profession:@"Music DJ" imageName:@"lady5c"]
    ];
    
    // setup views
    [self setupViews];
    [self setupDummyCards];
}

- (void)setupViews
{
    // setup topNavigationStackView
    self.topNavigationStackView.axis = UILayoutConstraintAxisHorizontal;
    
    // setup overallStackView
    self.overallStackView.axis = UILayoutConstraintAxisVertical;
    self.overallStackView.layoutMargins = UIEdgeInsetsMake(0, 12, 0, 12);
    [self.overallStackView setLayoutMarginsRelativeArrangement:YES];
    
    // setup bottomControlsStackView
    self.bottomControlsStackView.axis = UILayoutConstraintAxisHorizontal;
}

// MARK: - Dummy

- (void)setupDummyCards
{
    for (User *user in self.users) {
        CardView *cardView = [[CardView alloc] initWithUser:user];
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
