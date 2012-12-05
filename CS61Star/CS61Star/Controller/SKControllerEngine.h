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
#import "SKModelLogic.h"

@interface SKControllerEngine : CCNode
{
    SKGameState* currState;
    CCDirectorMac* director;
    SKModelLogic* data; // Manages the model data
    
}


-(BOOL) loadGameState;
-(BOOL) saveGameState;
-(CCScene*) getCurrentScene;
+(SKControllerEngine*) getSharedEngine;
@end
