//
//  SKBattleScene.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKBattleScene.h"
#import "SKControllerEngine.h"

@implementation SKBattleScene

@synthesize bgLayer = _bgLayer;
@synthesize actionLayer = _actionLayer;
@synthesize hudLayer = _hudLayer;
@synthesize enemy = _enemy;

-(id) init
{
    self = [super init];
    
    if (self)
    {
        self.bgLayer = [[SKBattleBGLayer alloc] init];
        [self addChild: self.bgLayer];

        self.actionLayer = [[SKBattleActionLayer alloc] init];
        [self addChild: self.actionLayer];
        
        self.hudLayer = [[SKBattleHUDLayer alloc] init];
        [self addChild: self.hudLayer];
        
        self.player = [[SKControllerEngine getSharedEngine] thePlayer];
        self.enemy = [[SKEnemy alloc] init];
    }
    return self;
}

-(id) initWithEnemy: (SKEnemy*) daEnemy
{
    self = [super init];
    
    if(self)
    {
        self = [self init];
        self.enemy = daEnemy;
    }
    
    return self;
}

-(void)dealloc
{
    [self.bgLayer release];
    [self.actionLayer release];
    [self.hudLayer release];
    
    [super dealloc];
}

-(void) update: (ccTime) dt
{
    [self.player battleUpdate: dt];
    [self.enemy battleUpdate: dt];
    if(self.enemy.atbReady){
        [self.enemy attack:self.player];
    }
    [self.hudLayer update: dt];
}


@end
