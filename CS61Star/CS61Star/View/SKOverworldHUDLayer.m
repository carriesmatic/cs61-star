//
//  SKOverworldHUDLayer.m
//  CS61Star
//
//  Created by Jason Cramer on 11/26/12.
//
//

#import "SKOverworldHUDLayer.h"
#import "cocos2d.h"

@implementation SKOverworldHUDLayer

-(id)init
{
    self = [super init];
    
    if(self)
    {
        // Get window size
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        // Create the HUD item
        _statHUD = [CCSprite spriteWithFile:@"statHUD.png"];
        [_statHUD setPosition:ccp(55, winSize.height - 55)];
        [_statHUD setScale: 3];
        
        _statHUDshadow = [CCSprite spriteWithFile:@"statHUDfiller.png"];
        [_statHUDshadow setPosition:ccp(55, winSize.height - 55)];
        [_statHUDshadow setScale: 3];
        
        // Initialize the status bars
        
        _hddbar = [CCSprite spriteWithFile:@"hddbar.png"];
        [_hddbar setAnchorPoint:ccp(0, 0)];
        [_hddbar setScale: 3];
        [_hddbar setScaleX: [_hddbar scale] * .90];
        [_hddbar setPosition:ccp(14, winSize.height - 35 - 9)];
        
        
        _rambar = [CCSprite spriteWithFile:@"rambar.png"];
        [_rambar setAnchorPoint:ccp(0, 0)];
        [_rambar setScale: 3];
        [_rambar setScaleX: [_rambar scale] * .20];
        [_rambar setPosition:ccp(14, winSize.height - 62 - 8)];
        
        
        _expbar = [CCSprite spriteWithFile:@"expbar.png"];
        [_expbar setAnchorPoint:ccp(0, 0)];
        [_expbar setScale: 3];
        [_expbar setScaleX: [_expbar scale] * .80];
        [_expbar setPosition:ccp(14, winSize.height - 89 - 7)];
        
        // Add our status items to the layer
        [self addChild: _statHUDshadow];
        [self addChild: _hddbar];
        [self addChild: _rambar];
        [self addChild: _expbar];
        [self addChild: _statHUD];
        
        
        // Create the SHEBANG action notification
        // Cache the sprite frames and texture
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"shebang_default.plist" textureFilename:@"shebang_default.png"];
        
        // Create a sprite batch node
        _shebangSheet = [CCSpriteBatchNode batchNodeWithFile:@"shebang_default.png"];
        _shebang = [CCSprite spriteWithSpriteFrameName:@"shebang 1.png"];
        [_shebang setScale: 2];
        [_shebang setPosition:ccp(75, 75)];
        
        // Gather the list of frames for each animation
        NSMutableArray *shebangFrames = [NSMutableArray array];
        for(int i = 1; i <= 4; ++i) {
            [shebangFrames addObject:
             [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
              [NSString stringWithFormat:@"shebang %d.png", i]]];
        }
        CCAnimation *shebangAnim = [CCAnimation animationWithSpriteFrames:shebangFrames delay:0.3f];
        CCAction *shebangAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:shebangAnim]];
        [_shebang runAction:shebangAction];
        
        // Set shebang to invisible by default
        [self setShebangVisible:NO];
        [self addChild:_shebang];

        

    }
    
    return self;
}

-(void)setHDDPercentage: (CGFloat)perc
{
    [_hddbar setScale: 3 * perc];
}

-(void)setRAMPercentage: (CGFloat)perc
{
    [_rambar setScale: 3 * perc];
}

-(void)setEXPPercentage: (CGFloat)perc
{
    [_expbar setScale: 3 * perc];
}

-(void)setShebangVisible: (BOOL) val
{
    [_shebang setVisible:val];
}

@end
