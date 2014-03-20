//
//  AngryBirdsView.m
//  AngryBirds
//
//  Created by g102 DIT UPM on 25/02/14.
//  Copyright (c) 2014 g102 DIT UPM. All rights reserved.
//

#import "AngryBirdsView.h"

@implementation AngryBirdsView

static const int ALTURE_VIEW = 350;
static const int DISTANCE_VIEW = 600;

static const int X_OFFSET = 20;
static const int Y_OFFSET = 45;

- (CGFloat) alture2Pixels:(CGFloat)alture{
    CGFloat h = self.bounds.size.height;
    return h - Y_OFFSET - alture/(ALTURE_VIEW) * (h+self.zoomValue);
}

- (CGFloat) distance2Pixels:(CGFloat)distance{
    CGFloat x = self.bounds.size.width;
    return X_OFFSET + distance/(DISTANCE_VIEW) * (x+self.zoomValue);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self trazaTrayectoria];
    UIImage *img_red_bird = [UIImage imageNamed:self.bird];
    [self dibujaImagen:img_red_bird conSize:24 EnX:[self distance2Pixels:[self.dataSource distanceAt:0]]
                    eY:[self alture2Pixels:[self.dataSource altureAt:0]]];
    UIImage *img_pig = [UIImage imageNamed:self.pig];
    [self dibujaImagen:img_pig conSize:30 EnX:[self distance2Pixels:self.targetDistance] eY:[self alture2Pixels:0]];
}

- (void)dibujaBackground{
    UIGraphicsBeginImageContext(self.frame.size);
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    [[UIImage imageNamed:self.background] drawInRect:CGRectMake(0, 0-self.zoomValue,
                                                                width+self.zoomValue, height+self.zoomValue)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (void)trazaTrayectoria{
    
    UIBezierPath* tray = [UIBezierPath bezierPath];
    
    CGFloat t;
    CGFloat duration = [self.dataSource duration];
    CGFloat posX = [self distance2Pixels:[self.dataSource distanceAt:0]];
    CGFloat posY = [self alture2Pixels:[self.dataSource altureAt:0]] - self.zoomValue/7;
    
    [tray moveToPoint:CGPointMake(posX,posY)];
    for (t=0; t < duration; t+=duration/100){
        posX = [self distance2Pixels:[self.dataSource distanceAt:t]];
        posY = [self alture2Pixels:[self.dataSource altureAt:t]] - self.zoomValue/7;
        [tray addLineToPoint:CGPointMake(posX, posY)];
    }
    posX = [self distance2Pixels:[self.dataSource distanceAt:duration]];
    posY = [self alture2Pixels:[self.dataSource altureAt:duration]] - self.zoomValue/7;
    [tray addLineToPoint:CGPointMake(posX, posY)];
    
    tray.lineWidth = 1.5*(1+self.zoomValue/272);
    [[UIColor darkGrayColor]set];
    [tray strokeWithBlendMode:kCGBlendModePlusDarker alpha:0.7];
}

- (void)dibujaImagen:(UIImage*)img conSize:(CGFloat)imgSize EnX:(CGFloat)posX eY:(CGFloat)posY{
    CGFloat imageSize = imgSize * (1+self.zoomValue/500);
    CGRect rect = CGRectMake(posX - imageSize/2, posY - imageSize/2 - self.zoomValue/7, imageSize, imageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    [img drawInRect: rect];
}

@end
