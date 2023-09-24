//
//  User.h
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
// 名前
@property (nonatomic) NSString *name;
// 年齢
@property (nonatomic) NSInteger age;
// 専門職
@property (nonatomic) NSString *profession;
// 画像名
@property (nonatomic) NSString *imageName;

// initialize
- (instancetype)initWithName:(NSString*)name
                         age:(NSInteger)age
                  profession:(NSString*)profession
                   imageName:(NSString*)imageName;
@end

NS_ASSUME_NONNULL_END
