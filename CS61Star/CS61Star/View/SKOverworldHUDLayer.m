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
        
        // Add our HUD items to the layer
        [self addChild: _statHUDshadow];
        [self addChild: _hddbar];
        [self addChild: _rambar];
        [self addChild: _expbar];
        [self addChild: _statHUD];

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


@end
