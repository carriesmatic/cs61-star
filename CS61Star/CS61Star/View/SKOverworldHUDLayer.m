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
        
        // Health bground: (187, 123, 121)
        // Mana bground: (111, 144, 172)
        // EXP bground: (124, 174, 111)
        
        
        // Add our HUD item to the layer
        [self addChild: _statHUD];
    }
    
    return self;
}


@end
