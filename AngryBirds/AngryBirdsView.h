//
//  AngryBirdsView.h
//  AngryBirds
//
//  Created by g102 DIT UPM on 25/02/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MovementModel

- (CGFloat)altureAt:(CGFloat)time;
- (CGFloat)distanceAt:(CGFloat)time;
- (CGFloat)duration;

@end

@interface AngryBirdsView : UIView
@property (nonatomic) CGFloat targetDistance;
@property (nonatomic) CGFloat zoomValue;
@property (nonatomic) NSString* background;
@property (nonatomic) NSString* bird;
@property (nonatomic) NSString* pig;
@property (nonatomic, weak) id<MovementModel> dataSource;

- (void)dibujaBackground;
@end
