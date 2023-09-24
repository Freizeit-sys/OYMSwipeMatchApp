//
//  CardView.h
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/17.
//

#import <UIKit/UIKit.h>

#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardView : UIView

- (instancetype)initWithUser:(User*)user;

@end

NS_ASSUME_NONNULL_END
