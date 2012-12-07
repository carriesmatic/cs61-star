//
//  SKPlayer.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//

#import "SKPlayer.h"

@implementation SKPlayer

@synthesize controllable;
@synthesize python = _python;
@synthesize walkUpAction = _walkUpAction;
@synthesize walkDownAction = _walkDownAction;
@synthesize walkLeftAction = _walkLeftAction;
@synthesize walkRightAction = _walkRightAction;
@synthesize spriteSheet = _spriteSheet;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        // Cache the sprite frames and texture
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"zwoppythonsheet_default.plist" textureFilename:@"zwoppythonsheet_default.png"];
        
        // Create a sprite batch node
        _spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"zwoppythonsheet_default.png"];
        
        // Gather the list of frames for each animation
        NSMutableArray *walkDownAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 2; ++i) {
            [walkDownAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"pythonwalkforward %d.png", i]]];
        }
        
        NSMutableArray *walkUpAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 2; ++i) {
            [walkUpAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"pythonwalkback %d.png", i]]];
        }
        
        NSMutableArray *walkLeftAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 4; ++i) {
            [walkLeftAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"pythonwalkleft %d.png", i]]];
        }
        
        NSMutableArray *walkRightAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 4; ++i) {
            [walkRightAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"pythonwalkright %d.png", i]]];
        }
        
        // Create the animation object
        CCAnimation *walkDownAnim = [CCAnimation animationWithSpriteFrames:walkDownAnimFrames delay:0.3f];
        CCAnimation *walkUpAnim = [CCAnimation animationWithSpriteFrames:walkUpAnimFrames delay:0.3f];
        CCAnimation *walkLeftAnim = [CCAnimation animationWithSpriteFrames:walkLeftAnimFrames delay:0.3f];
        CCAnimation *walkRightAnim = [CCAnimation animationWithSpriteFrames:walkRightAnimFrames delay:0.3f];
        
        // Create the sprite and set up the animation objects
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        self.python = [CCSprite spriteWithSpriteFrameName:@"pythonwalkforward 1.png"];
        _python.position = ccp(winSize.width/2, winSize.height/2);
        
        self.walkDownAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkDownAnim]];
        self.walkUpAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkUpAnim]];
        self.walkLeftAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkLeftAnim]];
        self.walkRightAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:walkRightAnim]];
        
        [_python runAction:_walkDownAction];
        [_spriteSheet addChild:_python];

    }
    
    return self;
}

-(CCSpriteBatchNode*)getSpriteSheet
{
    return _spriteSheet;
}

-(void)changeDirection: (Direction)direction
{
    [_python stopAllActions];
    switch (direction) {
        case LEFT:
            [_python runAction:_walkLeftAction];
            break;
        case RIGHT:
            [_python runAction:_walkRightAction];
            break;
        case UP:
            [_python runAction:_walkUpAction];
            break;
        default:
            [_python runAction:_walkDownAction];
            break;
    }
}

-(void)move:(CGPoint)directionOffset withDirection:(Direction)direction
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    CGPoint pythonPosition = [_python position];
    float newXPosition = pythonPosition.x + directionOffset.x;
    float newYPosition = pythonPosition.y + directionOffset.y;
    
//    if ((newXPosition < 0.0f) || (newYPosition < 0.0f)) {
//        return; // Do not move
//    }
//    if ((newXPosition > size.width) || (newYPosition > size.height)) {
//        return; // Do not move
//    }
    
    [_python setPosition:ccp(newXPosition,newYPosition)];
    [self changeDirection: direction];
}

-(void) dealloc
{
    [self.python release];
    [self.walkUpAction release];
    [self.walkDownAction release];
    [self.walkRightAction release];
    [self.walkLeftAction release];
    
    self.python = nil;
    self.walkUpAction = nil;
    self.walkDownAction = nil;
    self.walkLeftAction = nil;
    self.walkRightAction = nil;
    
    [[CCTextureCache sharedTextureCache] removeUnusedTextures];
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeSpriteFrames];
    [[CCSpriteFrameCache sharedSpriteFrameCache] removeUnusedSpriteFrames];
    [[CCTextureCache sharedTextureCache] removeAllTextures];
    
    [super dealloc];
}

@end
