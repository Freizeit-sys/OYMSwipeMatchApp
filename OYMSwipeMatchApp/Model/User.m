//
//  User.m
//  OYMSwipeMatchApp
//
//  Created by Yuki Morishita on 2023/02/19.
//

#import "User.h"

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
