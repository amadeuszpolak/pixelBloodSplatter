//
//  BloodController.m
//  pixelBloodSplatter
//
//  Created by Macbook on 23.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

#import "SharedTextureCache.h"
#import "Blood.h"
#import "GameScene.h"

#import "BloodController.h"

@interface BloodController ()

@property (nonatomic, strong) NSMutableArray *bloodStampsController;

@end

@implementation BloodController

- (id)init {
    if (self = [super init]) {
        _bloodStampsController = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addBlood:(CGPoint)point minBloodStamps:(int)min maxBloodStamps:(int)max removalAfterTime:(float)time{
    
    GameScene *levelScene = (GameScene *)self.scene;
    _bloodStampsController = levelScene.bloodStamps;
    
    int bloodStampsN=min+arc4random()%(max);
    
    for (int i=0; i<bloodStampsN+1; i++) {
        int color=1+arc4random()%(4);
        
        int bloodStampLocationX=arc4random()%(8);
        int bloodStampLocationY=arc4random()%(8);
        
        int bloodStampSignX=arc4random()%(2);
        if (bloodStampSignX==0) bloodStampSignX=-1;
        if (bloodStampSignX==1) bloodStampSignX=1;
        int bloodStampSignY=arc4random()%(2);
        if (bloodStampSignY==0) bloodStampSignY=-1;
        if (bloodStampSignY==1) bloodStampSignY=1;
        
        Blood *bloodStamp = [Blood spriteNodeWithTexture:[[SharedTextureCache sharedCache] textureNamed:[NSString stringWithFormat:@"Blood%d", color]]];
        bloodStamp.position = CGPointMake(point.x+bloodStampSignX*bloodStampLocationX, point.y+bloodStampSignY*bloodStampLocationY);
        [levelScene addChild:bloodStamp];
        [_bloodStampsController addObject:bloodStamp];
    }
    
    for (Blood *target in _bloodStampsController) {
        SKAction *action = [SKAction waitForDuration:time];
        [self runAction:action completion:^{
            [target removeFromParent];
            [_bloodStampsController removeObject:target];
        }];
    }
    
    
}

@end
