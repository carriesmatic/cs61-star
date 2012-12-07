//
//  SKTitleScreenScene.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKTitleScreenScene.h"
#import "SKControllerEngine.h"


@implementation SKTitleScreenScene

-(id) init
{
    self = [super init];
    
    if (self)
    {
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
    
        CCSprite *background = [CCSprite spriteWithFile:@"mainmenu.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [background setScale: 3];
        
        CCLabelTTF *newGameLabel = [CCLabelTTF labelWithString:@"New Game" fontName:@"8BITWONDERNominal" fontSize:24];
        CCLabelTTF *loadGameLabel = [CCLabelTTF labelWithString:@"Load Game" fontName:@"8BITWONDERNominal" fontSize:24];
        CCLabelTTF *settingsLabel = [CCLabelTTF labelWithString:@"Settings" fontName:@"8BITWONDERNominal" fontSize:24];
        

        CCMenuItemLabel *newGame = [CCMenuItemLabel itemWithLabel: newGameLabel target:self selector:@selector(onNewGame:)];
        CCMenuItemLabel *loadGame = [CCMenuItemLabel itemWithLabel: loadGameLabel target:self selector:@selector(onLoadGame:)];
        CCMenuItemLabel *settings = [CCMenuItemFont itemWithLabel: settingsLabel target:self selector:@selector(onSettings:)];
        
        CCMenu *menu = [CCMenu menuWithItems: newGame, loadGame, settings, nil];
        [menu setPosition:ccp(winSize.width/2, winSize.height/4)];
        [menu alignItemsVertically];
        
        CCSprite *logo = [CCSprite spriteWithFile:@"cs61starbanner.png"];
        logo.position = ccp(winSize.width/2, winSize.height*3/5);
        [logo setScale: 5];
        [[logo texture] setAliasTexParameters];
        
        // Add to view
        [self addChild: background];
        [self addChild: menu];
        [self addChild: logo];
    }
    
    return self;
}

- (void)onNewGame:(id)sender
{
    [[SKControllerEngine getSharedEngine] changeToOverWorld];
}

- (void)onLoadGame:(id)sender
{
    NSLog(@"on load game");
}

- (void)onSettings:(id)sender
{
    NSLog(@"on settings");
}

@end
