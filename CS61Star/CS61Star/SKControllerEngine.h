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

@interface SKControllerEngine : NSObject
{
    CCScene* currScene;
    
}

-(BOOL) loadGameState;
-(BOOL) saveGameState;

@end
