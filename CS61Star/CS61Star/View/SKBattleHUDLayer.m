//
//  SKBattleHUDLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "SKBattleHUDLayer.h"

@implementation SKBattleHUDLayer

-(id) init
{
    self = [super init];
    
    if (self)
    {
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

@end
