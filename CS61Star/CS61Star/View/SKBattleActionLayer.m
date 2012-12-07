//
//  SKBattleActionLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "SKBattleActionLayer.h"
#import "SKControllerEngine.h"

@implementation SKBattleActionLayer


-(id) init
{
    self = [super init];
    
    if (self)
    {
        // Cache the sprite frames and texture
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"zwoppythonsheet_default.plist" textureFilename:@"zwoppythonsheet_default.png"];
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"bug_default.plist" textureFilename:@"bug_default.png"];
        
        // Create a sprite batch node
        CCSpriteBatchNode* spriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"zwoppythonsheet_default.png"];
        CCSpriteBatchNode* enemySpriteSheet = [CCSpriteBatchNode batchNodeWithFile:@"bug_default.png"];
        
        // Create animation frames
        NSMutableArray *battleAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 2; ++i) {
            [battleAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"battlepython %d.png", i]]];
        }
        
        NSMutableArray *enemyAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 3; ++i) {
            [enemyAnimFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"bug %d.png", i]]];
        }
        
        // Create animation
        CCAnimation *battleAnim = [CCAnimation animationWithSpriteFrames:battleAnimFrames delay:.3f];
        CCAnimation *enemyAnim = [CCAnimation animationWithSpriteFrames:enemyAnimFrames delay:.3f];
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        // Player's sprite
        _playerSprite = [CCSprite spriteWithSpriteFrameName:@"battlepython 1.png"];
        [_playerSprite setScale: 4];
        [_playerSprite setPosition:ccp(winSize.width*3/4 + 50, winSize.height/2 + 50)];
        
        // Enemy sprite
        _enemySprite = [CCSprite spriteWithSpriteFrameName:@"bug 1.png"];
        [_enemySprite setScale: 4];
        [_enemySprite setPosition: ccp(winSize.width/4 - 50, winSize.height/2 + 50)];
        
        // Add the sprite sheet to the window
        [self addChild:spriteSheet];
        [self addChild:enemySpriteSheet];
        
        CCAction* battleAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:battleAnim]];
        
        CCAction* enemyAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:enemyAnim]];
        
        // Stop antialiasing
        [[spriteSheet texture] setAliasTexParameters];
        [[_playerSprite texture] setAliasTexParameters];
        [[enemySpriteSheet texture] setAliasTexParameters];
        [[_enemySprite texture] setAliasTexParameters];
        
        
        [_playerSprite runAction:battleAction];
        [_enemySprite runAction:enemyAction];
        
        [spriteSheet addChild:_playerSprite];
        [enemySpriteSheet addChild: _enemySprite];
        
    }
    
    return self;
}

-(BOOL) ccKeyDown:(NSEvent *)event
{
    NSLog(@"key down: %@", [event characters] );
    if (![event modifierFlags])
    {
        NSString *someKey = [event charactersIgnoringModifiers];

        char keyChar = 0;
        if ( [someKey length] == 0 )
            return YES;            // reject dead keys
        if ( [someKey length] == 1 ) {
            keyChar = [someKey characterAtIndex:0];
            
            NSLog(@"%@", keyChar);
            if ( keyChar == (char)@"z" ) {
                NSLog(@"Hello");
                return YES;
            }
        }
        
        
    }
    return NO;
}


@end
