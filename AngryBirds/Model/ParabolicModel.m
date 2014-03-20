//
//  ParabolicModel.m
//  AngryBirds
//
//  Created by g102 DIT UPM on 25/02/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "ParabolicModel.h"
#include <math.h>

@implementation ParabolicModel

- (CGFloat)speedX{
    return self.speed*cos((M_PI/2)*self.angle);
}

- (CGFloat)speedY{
    return self.speed*sin((M_PI/2)*self.angle);
}

- (CGFloat)altureAt:(CGFloat)time{
    return [self speedY]*time - 0.5*self.gravity*time*time;
}

- (CGFloat)distanceAt:(CGFloat)time{
    return [self speedX] * time;
}

- (CGFloat)duration {
    return 2 * [self speedY]/self.gravity;
}

@end
