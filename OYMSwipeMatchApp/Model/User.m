//
//  User.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/19.
//

#import "User.h"

@interface User ()
// 名前
@property (nonatomic) NSString *name;
// 年齢
@property (nonatomic) NSInteger age;
// 専門職
@property (nonatomic) NSString *profession;
// 画像名
@property (nonatomic) NSString *imageName;
@end

@implementation User

- (instancetype)initWithName:(NSString*)name
                         age:(NSInteger)age
                  profession:(NSString*)profession
                   imageName:(NSString*)imageName
{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
        _profession = profession;
        _imageName = imageName;
    }
    return self;
}

@end
