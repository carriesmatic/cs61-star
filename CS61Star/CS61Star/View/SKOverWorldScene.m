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

@synthesize meta = _meta;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.layer = [[SKOverWorldLayer alloc] init];
        [self addChild: _layer];
    }
    
    return self;
}

-(id)initWithMap: (CCTMXTiledMap*) map
{
    self = [super init];
    if(self)
    {
        self.layer = [[SKOverWorldLayer alloc] initWithMap: map];
        [self addChild: _layer];
    }
    return self;
}

-(void)draw
{
    // Render this scene
}

-(void)changeMap:(CCTMXTiledMap *)newMap
{
    [self.layer changeMap:newMap];
}

-(void)dealloc
{
    [self.layer release];
    self.meta = nil;
    
    [super dealloc];
}

-(CGPoint)tileCoordForPosition:(CGPoint)position
{
    int x = position.x / _tileMap.tileSize.width;
    int y = ((_tileMap.mapSize.height * _tileMap.tileSize.height) - position.y) / _tileMap.tileSize.height;
    return ccp(x,y);
}

@end
