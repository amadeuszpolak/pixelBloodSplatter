//
//  GameScene.m
//  pixelBloodSplatter
//
//  Created by Macbook on 22.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "BloodController.h"
#import "Blood.h"

#import "GameScene.h"

@interface GameScene ()

@property (nonatomic, strong) BloodController *controller;

@end

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    _bloodStamps = [[NSMutableArray alloc] init];
    _controller = [[BloodController alloc] init];
    [self addChild:_controller];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_controller addBlood:location minBloodStamps:10 maxBloodStamps:20 removalAfterTime:2.0];
    }
}

-(void)update:(NSTimeInterval)currentTime {
    for (Blood *target in _bloodStamps) {
        [target update:currentTime];
    }
}

@end
