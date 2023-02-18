//
//  ViewController.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/15.
//

#import "ViewController.h"

#import "TopNavigationStackView.h"
#import "CardView.h"
#import "HomeBottomControlsStackView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStackView *overallStackView;
@property (weak, nonatomic) IBOutlet TopNavigationStackView *topNavigationStackView;
@property (weak, nonatomic) IBOutlet CardView *cardsDeckView;
@property (weak, nonatomic) IBOutlet HomeBottomControlsStackView *bottomControlsStackView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews
{
    // cardsDeckViewを最前面に設定
    [self.overallStackView bringSubviewToFront:self.cardsDeckView];
}

@end
