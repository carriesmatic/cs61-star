//
//  SKOverWorldLayer.h
//  CS61Star
//
//  Created by Carrie Chow on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
    LEFT,
    RIGHT,
    UP,
    DOWN
} Direction;


@interface SKOverWorldLayer : CCLayer {
    CCTMXTiledMap* currentMap;
    NSMutableArray* npcList;
    NSMutableArray* hudElements;
    
    CCSprite *_python;
    CCAction *_walkUpAction;
    CCAction *_walkDownAction;
    CCAction *_walkLeftAction;
    CCAction *_walkRightAction;
    
}


@property (retain, nonatomic) CCTMXTiledMap* currentMap;
@property (retain, nonatomic) NSMutableArray* npcList;
@property (retain, nonatomic) NSMutableArray* hudElements;

// Python sprite
@property (nonatomic, retain) CCSprite *python;
@property (nonatomic, retain) CCAction *walkUpAction;
@property (nonatomic, retain) CCAction *walkDownAction;
@property (nonatomic, retain) CCAction *walkLeftAction;
@property (nonatomic, retain) CCAction *walkRightAction;

// Changes the current map, and returns the old map
-(id)initWithMap:(CCTMXTiledMap*)map;
-(id)changeMap:(CCTMXTiledMap*)newMap;

-(void)changeDirection:(Direction)direction;
-(void) movePlayer:(CGPoint)directionOffset withDirection:(Direction)direction;
-(BOOL) ccKeyDown:(NSEvent *)event;



@end
