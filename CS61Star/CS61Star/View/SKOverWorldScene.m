//
//  SKOverWorldScene.m
//  CS61Star
//
//  Created by Jason Cramer on 11/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKOverWorldScene.h"
#import "SKOverWorldLayer.h"


@implementation SKOverWorldScene

@synthesize mapLayer = _mapLayer;
@synthesize hudLayer = _hudLayer;



-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.mapLayer = [[SKOverWorldLayer alloc] init];
        [self addChild: self.mapLayer];
        
        self.hudLayer = [[SKOverworldHUDLayer alloc] init];
        [self addChild: self.hudLayer];
    }
    
    return self;
}

-(id)initWithMap: (CCTMXTiledMap*) map
{
    self = [super init];
    if(self)
    {
        self.mapLayer = [[SKOverWorldLayer alloc] initWithMap: map];
        [self addChild: self.mapLayer];
        self.hudLayer = [[SKOverworldHUDLayer alloc] init];
        [self addChild: self.hudLayer];
    }
    return self;
}

-(void)draw
{
    // Render this scene
}

-(void)changeMap:(CCTMXTiledMap *)newMap
{
    [self.mapLayer changeMap:newMap];
}

-(void)dealloc
{
    [self.mapLayer release];
    
    [super dealloc];
}

-(void) update: (ccTime) dt
{
}

@end
