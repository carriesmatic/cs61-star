//
//  SKOverWorldScene.h
//  CS61Star
//
//  Created by Jason Cramer on 11/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SKOverworldHUDLayer.h"
#import "SKOverWorldLayer.h"

@interface SKOverWorldScene : CCScene {
    NSMutableArray* npcList;
    NSMutableArray* hudElements;
    SKOverworldHUDLayer* hud;
    
    // Map things
    CCTMXTiledMap* _tileMap;
    CCTMXLayer* _background;
    CCTMXLayer* _meta;
}

@property (retain, nonatomic) SKOverWorldLayer* layer;
@property (retain, nonatomic) CCTMXLayer* meta;


// Changes the current map, and returns the old map
-(id)initWithMap:(CCTMXTiledMap*)map;
-(void)changeMap:(CCTMXTiledMap*)newMap;

@end
