//
//  SKControllerEngine.h
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//  This acts as the Controller of the game,
//  acting as the main engine and mediating
//  requests between the game data and the
//  view.
//

#import <Cocoa/Cocoa.h>
#import "CCScene.h"
#import "CCNode.h"
#import "SKGameState.h"
#import "cocos2d.h"
#import "SKMapModel.h"
#import "SKPlayer.h"
#import "SKBattle.h"

@interface SKControllerEngine : CCNode
{

    CCDirectorMac* director;

    SKPlayer* _thePlayer; // The badass hacker hero of fate.
    SKMapModel* _currMap; // The current location where our hero resides.
    SKBattle* _currBattle; // The current battle, if applicable.
    CCScene* _currScene;
}
@property (nonatomic, retain) CCScene* currScene;
@property (nonatomic, retain) SKPlayer* thePlayer;
@property (nonatomic, retain) SKMapModel* currMap;
@property (nonatomic, retain) SKBattle * currBattle;

-(BOOL) loadGameState;
-(BOOL) saveGameState;
-(void) changeToOverWorld;
-(void) changeToBattle;
-(void) changeToTitle;
+(SKControllerEngine*) getSharedEngine;
@end
