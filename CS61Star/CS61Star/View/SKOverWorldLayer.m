//
//  SKOverWorldLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKOverWorldLayer.h"

@implementation SKOverWorldLayer

@synthesize python = _python;
@synthesize walkUpAction = _walkUpAction;
@synthesize walkDownAction = _walkDownAction;
@synthesize walkLeftAction = _walkLeftAction;
@synthesize walkRightAction = _walkRightAction;

@synthesize currentMap;
@synthesize npcList;
@synthesize hudElements;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        currentMap = [[CCTMXTiledMap alloc] initWithTMXFile:@"testmap.tmx"];
        [self initWithMap:currentMap];
    }
    
    return self;
}


-(id)initWithMap: (CCTMXTiledMap*) map
{
    self = [super init];
    if(self)
    {
        // Enable keyboard
        self.isKeyboardEnabled = YES;
        
        currentMap = [map retain];
        [self addChild:currentMap];
        
        // Cache the sprite frames and texture
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"zwoppythonsheet_default.plist" textureFilename:@"zwoppythonsheet_default.png"];
        
        // Create a sprite batch node
        CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode
                                          batchNodeWithFile:@"zwoppythonsheet_default.png"];
        [self addChild:spriteSheet];
        
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
        [spriteSheet addChild:_python];
    }
    return self;
}


-(void)movePlayer:(CGPoint)directionOffset withDirection:(Direction)direction
{
    CGSize size = [[CCDirector sharedDirector] winSize];
    CGPoint pythonPosition = [_python position];
    float newXPosition = pythonPosition.x + directionOffset.x;
    float newYPosition = pythonPosition.y + directionOffset.y;
    
    if ((newXPosition < 0.0f) || (newYPosition < 0.0f)) {
        return; // Do not move
    }
    if ((newXPosition > size.width) || (newYPosition > size.height)) {
        return; // Do not move
    }
    
    [_python setPosition:ccp(newXPosition,newYPosition)];
    [self changeDirection: direction];
}

-(BOOL) ccKeyDown:(NSEvent *)event
{
    //NSLog(@"key down: %@", [event characters] );
    if ([event modifierFlags] & NSNumericPadKeyMask) { // arrow keys have this mask
        NSString *theArrow = [event charactersIgnoringModifiers];
        unichar keyChar = 0;
        if ( [theArrow length] == 0 )
            return YES;            // reject dead keys
        if ( [theArrow length] == 1 ) {
            keyChar = [theArrow characterAtIndex:0];
            if ( keyChar == NSLeftArrowFunctionKey ) {
                CCLOG(@"Left Arrow pressed");
                CGPoint movePosition = ccp(-32,0);
                [self movePlayer:movePosition withDirection:LEFT];
                return YES;
            }
            if ( keyChar == NSRightArrowFunctionKey ) {
                CCLOG(@"Right Arrow pressed");
                CGPoint movePosition = ccp(32,0);
                [self movePlayer:movePosition withDirection:RIGHT];
                return YES;
            }
            if ( keyChar == NSUpArrowFunctionKey ) {
                CCLOG(@"Up Arrow Pressed");
                CGPoint movePosition = ccp(0,32);
                [self movePlayer:movePosition withDirection:UP];
                return YES;
            }
            if ( keyChar == NSDownArrowFunctionKey ) {
                CGPoint movePosition = ccp(0,-32);
                [self movePlayer:movePosition withDirection:DOWN];
                CCLOG(@"Down Arrow Pressed");
                return YES;
            }
        }
    }
    return NO;
}

-(void)changeDirection: (Direction)direction
{
    switch (direction) {
        case LEFT:
            [_python stopAllActions];
            [_python runAction:_walkLeftAction];
            break;
        case RIGHT:
            [_python stopAllActions];
            [_python runAction:_walkRightAction];
            break;
        case UP:
            [_python stopAllActions];
            [_python runAction:_walkUpAction];
            break;
        default:
            [_python stopAllActions];
            [_python runAction:_walkDownAction];
            break;
    }
}

-(id)changeMap:(CCTMXTiledMap *)newMap
{
    [self removeChild:currentMap cleanup:YES];
    CCTMXTiledMap* oldMap = [currentMap autorelease];
    currentMap = [newMap retain];
    [self addChild:currentMap];
    return oldMap;
}

-(void)dealloc
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
