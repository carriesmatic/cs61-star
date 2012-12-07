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
    // Map things
    CCTMXTiledMap* currentMap;
    CCTMXLayer* _background;
    CCTMXLayer* _curtain;
    CCTMXLayer* _over;
    CCTMXLayer* _active;
    CCTMXLayer* _under2;
    CCTMXLayer* _under;
    CCTMXLayer* _meta;
    
    NSMutableArray* npcList;
    NSMutableArray* hudElements;
    SKPlayer* thePlayer;
}

@property (retain, nonatomic) CCTMXTiledMap* currentMap;
@property (retain, nonatomic) NSMutableArray* npcList;
@property (retain, nonatomic) NSMutableArray* hudElements;
@property (retain, nonatomic) SKPlayer* thePlayer;
//@property (retain, nonatomic) 

@property (retain, nonatomic) CCTMXLayer* meta;
@property (retain, nonatomic) CCTMXLayer* curtain;
@property (retain, nonatomic) CCTMXLayer* over;
@property (retain, nonatomic) CCTMXLayer* active;
@property (retain, nonatomic) CCTMXLayer* under2;
@property (retain, nonatomic) CCTMXLayer* under;
@property (retain, nonatomic) CCTMXLayer* background;

// Changes the current map, and returns the old map
-(id)initWithMap:(CCTMXTiledMap*)map;
-(id)changeMap:(CCTMXTiledMap*)newMap;

-(BOOL) ccKeyDown:(NSEvent *)event;



@end
