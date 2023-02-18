//
//  User.h
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

- (instancetype)initWithName:(NSString*)name
                         age:(NSInteger)age
                  profession:(NSString*)profession
                   imageName:(NSString*)imageName;

@end

NS_ASSUME_NONNULL_END
