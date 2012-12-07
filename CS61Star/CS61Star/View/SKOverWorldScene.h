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
#import "SKDialogueBoxLayer.h"

@interface SKOverWorldScene : CCScene {
    SKOverworldHUDLayer* _hudLayer;
    SKOverWorldLayer* _mapLayer;
    SKDialogueBoxLayer* _dialogueLayer;

}

@property (retain, nonatomic) SKOverworldHUDLayer* hudLayer;
@property (retain, nonatomic) SKOverWorldLayer* mapLayer;
@property (retain, nonatomic) SKDialogueBoxLayer* dialogueLayer;



// Changes the current map, and returns the old map
-(id)initWithMap:(CCTMXTiledMap*)map;
-(void)changeMap:(CCTMXTiledMap*)newMap;
-(void) update: (ccTime) dt;
@end
