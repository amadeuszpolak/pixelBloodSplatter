//
//  Blood.m
//  pixelBloodSplatter
//
//  Created by Macbook on 22.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "GameScene.h"

#import "Blood.h"

#define kBloodWidth 4
#define kBloodHeight 4

@interface Blood ()

@property (nonatomic, assign) int kMovementSpeed;
@property (nonatomic, assign) int kJumpForce;
@property (nonatomic, assign) BOOL firstIterationPassed;
@property (nonatomic, assign) int kGravity;

@end

@implementation Blood

- (void)update:(NSTimeInterval)dt {

        if (!_firstIterationPassed) {
            _firstIterationPassed=YES;
            _kGravity=1000;
            int r=arc4random()%(2);
            if (r==0) {
                self.flipX=YES;
            }
            else {
                self.flipX=NO;
            }
            _kJumpForce = 200+arc4random()%(200);
            _kMovementSpeed = 100+arc4random()%(100);
            if (self.flipX==YES) {
                self.velocity = CGPointMake((-_kMovementSpeed), (_kJumpForce));
            }
            if (self.flipX==NO) {
                self.velocity = CGPointMake((_kMovementSpeed), (_kJumpForce));
            }
        }
    
        GameScene *levelScene = (GameScene *)self.scene;
    
        //conditions for stopping, customize it!
        if (self.position.y<=self.size.height/2) {
            self.position = CGPointMake(self.position.x, self.size.height/2);
            self.velocity = CGPointMake(0, 0);
            _kGravity=0;
        }
        if (self.position.x<=self.size.width/2) {
            self.velocity = CGPointMake(0, 0);
            _kGravity=0;
        }
        if (self.position.x>=levelScene.size.width-self.size.width/2) {
            self.velocity = CGPointMake(0, 0);
            _kGravity=0;
        }
        if (self.position.y>=levelScene.size.height-self.size.height/2) {
            self.velocity = CGPointMake(0, 0);
            _kGravity=0;
        }
        
        if (dt>0.02) dt=0.02;
        
        CGPoint gravity = CGPointMake(0.0, -_kGravity);
        CGPoint gravityStep = CGPointMake(gravity.x*dt, gravity.y*dt);
    
        self.velocity = CGPointMake(self.velocity.x+gravityStep.x, self.velocity.y+gravityStep.y);
        CGPoint tmp = CGPointMake(self.velocity.x*dt, self.velocity.y*dt);
        self.desiredPosition = CGPointMake(self.position.x+tmp.x, self.position.y+tmp.y);
        self.position=self.desiredPosition;
}

- (void)setFlipX:(BOOL)flipX {
    if (flipX) {
        self.xScale = -fabs(self.xScale);
    } else {
        self.xScale = fabs(self.xScale);
    }
    _flipX = flipX;
}

- (void)setSize:(CGSize)size {
    if (!self.flipX) {
        [super setSize:size];
    } else {
        [super setSize:CGSizeMake(-size.width, size.height)];
    }
}

- (CGRect)collisionBoundingBox {
    CGRect bounding = CGRectMake(
                              self.desiredPosition.x - (kBloodWidth / 2),
                              self.desiredPosition.y - (kBloodHeight / 2),
                              kBloodWidth, kBloodHeight);
    
    return CGRectOffset(bounding, 0, 0);
}

@end
