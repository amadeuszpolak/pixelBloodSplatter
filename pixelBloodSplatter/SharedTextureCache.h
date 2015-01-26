//
//  SharedTextureCache.h
//  pixelBloodSplatter
//
//  Created by Macbook on 22.01.2015.
//  Copyright (c) 2015 Amadeusz Polak. All rights reserved.
//

@import SpriteKit;

@interface SharedTextureCache : NSObject

+ (instancetype)sharedCache;

- (SKTexture *)textureNamed:(NSString *)name;
- (void)addTexture:(SKTexture *)texture name:(NSString *)textureName;

@end
