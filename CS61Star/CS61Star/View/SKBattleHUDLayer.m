//
//  SKBattleHUDLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "SKBattleHUDLayer.h"
#import "SKControllerEngine.h"

@implementation SKBattleHUDLayer

-(id) init
{
    self = [super init];
    
    if (self)
    {
        
        _statBackground = [CCSprite spriteWithFile:@"hudbackground.png"];
        
        // Stop antialiasing
        [[_statBackground texture] setAliasTexParameters];
        
        [_statBackground setAnchorPoint:ccp(0, 0)];
        [_statBackground setScale: 7];
        [_statBackground setScaleX: [_statBackground scale] * .86];
        [_statBackground setPosition:ccp(0, 0)];
        
        [self addChild:_statBackground];
        
        
        
        _atbBar = [CCSprite spriteWithFile: @"atbbar.png"];
        
        // Stop antialiasing
        [[_atbBar texture] setAliasTexParameters];
        
        [_atbBar setAnchorPoint:ccp(0, 0)];
        [_atbBar setScale: 7];
        [_atbBar setScaleX: 0];
        [_atbBar setPosition:ccp(215, 175)];
        
        [self addChild:_atbBar];

        
        
        
        _statBar = [CCSprite spriteWithFile:@"hudoverlay.png"];
        
        // Stop antialiasing
        [[_statBar texture] setAliasTexParameters];
        
        [_statBar setAnchorPoint:ccp(0, 0)];
        [_statBar setScale: 7];
        [_statBar setScaleX: [_statBar scale] * .86];
        [_statBar setPosition:ccp(0, 0)];
        
        [self addChild:_statBar];
        

        

    }
    
    return self;
}

-(void) update: (ccTime) dt
{
    [_atbBar setScaleX: 7 * [[[SKControllerEngine getSharedEngine] thePlayer] curr_atb]];
}
@end
