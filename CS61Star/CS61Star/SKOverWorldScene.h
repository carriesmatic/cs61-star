//
//  SKOverWorldScene.h
//  CS61Star
//
//  Created by Jason Cramer on 11/12/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SKOverWorldScene : CCScene {
    CCTMXTiledMap* currentMap;
    NSMutableArray* npcList;
    NSMutableArray* hudElements;
}

@property (retain, nonatomic) CCTMXTiledMap* currentMap;
@property (retain, nonatomic) NSMutableArray* npcList;
@property (retain, nonatomic) NSMutableArray* hudElements;
// Changes the current map, and returns the old map
-(id)initWithMap:(CCTMXTiledMap*)map;
-(id)changeMap:(CCTMXTiledMap*)newMap;

@end
