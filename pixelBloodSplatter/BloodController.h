//
//  BloodController.h
//  pixelBloodSplatter
//
//  Created by Macbook on 23.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

@import SpriteKit;

@interface BloodController : SKNode

-(void)addBlood:(CGPoint)point minBloodStamps:(int)min maxBloodStamps:(int)max removalAfterTime:(float)time;

@end
