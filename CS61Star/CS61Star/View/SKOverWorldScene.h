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
    SKOverworldHUDLayer* _hudLayer;
    SKOverWorldLayer* _mapLayer;

}

@property (retain, nonatomic) SKOverworldHUDLayer* hudLayer;
@property (retain, nonatomic) SKOverWorldLayer* mapLayer;



// Changes the current map, and returns the old map
-(id)initWithMap:(CCTMXTiledMap*)map;
-(void)changeMap:(CCTMXTiledMap*)newMap;
-(void) update: (ccTime) dt;
@end
