//
//  Blood.h
//  pixelBloodSplatter
//
//  Created by Macbook on 22.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

//
@import SpriteKit;

@interface Blood : SKSpriteNode {

}

@property (nonatomic, assign) CGPoint velocity;
@property (nonatomic, assign) CGPoint desiredPosition;
@property (nonatomic, assign) BOOL flipX;

- (void)update:(NSTimeInterval)dt;

@end
