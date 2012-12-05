//
//  SKOverWorldScene.m
//  CS61Star
//
//  Created by Jason Cramer on 11/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKOverWorldScene.h"


@implementation SKOverWorldScene

@synthesize currentMap;
@synthesize npcList;
@synthesize hudElements;

-(id)init
{
    self = [super init];
    if(self)
    {
        currentMap = [[CCTMXTiledMap alloc] initWithTMXFile:@"testmap.tmx"];
        [self addChild:currentMap];
        hud = [[SKOverworldHUDLayer alloc] init];
        
    }
    
    return self;
}

-(id)initWithMap: (CCTMXTiledMap*) map
{
    self = [super init];
    if(self)
    {
        currentMap = [map retain];
        [self addChild:currentMap];
    }
    return self;
}

-(void)draw
{
    // Render this scene
}

-(id)changeMap:(CCTMXTiledMap *)newMap
{
    [self removeChild:currentMap cleanup:YES];
    CCTMXTiledMap* oldMap = [currentMap autorelease];
    currentMap = [newMap retain];
    [self addChild:currentMap];
    return oldMap;
}

@end
