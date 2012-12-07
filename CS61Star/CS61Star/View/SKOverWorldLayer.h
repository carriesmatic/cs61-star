//
//  SKOverWorldLayer.h
//  CS61Star
//
//  Created by Carrie Chow on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SKGlobalConstants.h"
#import "SKControllerEngine.h"


@interface SKOverWorldLayer : CCLayer {
    CCTMXTiledMap* currentMap;
    NSMutableArray* npcList;
    NSMutableArray* hudElements;
    SKPlayer* thePlayer;
}

@property (retain, nonatomic) CCTMXTiledMap* currentMap;
@property (retain, nonatomic) NSMutableArray* npcList;
@property (retain, nonatomic) NSMutableArray* hudElements;

// Changes the current map, and returns the old map
-(id)initWithMap:(CCTMXTiledMap*)map;
-(id)changeMap:(CCTMXTiledMap*)newMap;

-(BOOL) ccKeyDown:(NSEvent *)event;



@end
