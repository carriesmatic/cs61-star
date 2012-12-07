//
//  SKBattleScene.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKBattleScene.h"


@implementation SKBattleScene

@synthesize bgLayer = _bgLayer;
@synthesize actionLayer = _actionLayer;
@synthesize hudLayer = _hudLayer;

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

@end
