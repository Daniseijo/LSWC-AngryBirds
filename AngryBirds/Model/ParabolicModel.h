//
//  ParabolicModel.h
//  AngryBirds
//
//  Created by g102 DIT UPM on 25/02/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ParabolicModel : NSObject
@property (nonatomic) CGFloat speed;
@property (nonatomic) CGFloat angle;
@property (nonatomic) CGFloat gravity;

- (CGFloat)altureAt:(CGFloat)time;
- (CGFloat)distanceAt:(CGFloat)time;
- (CGFloat)duration;
@end