//
//  SKGameState.h
//  CS61Star
//
//  Created by Jason Cramer on 11/18/12.
//
//  Holds the current state of the game, and acts as the controller for
//  that particular state.

#import <Foundation/Foundation.h>
#import "CCNode.h"
#import "CCScene.h"

@interface SKGameState : CCNode
{
    CCScene* currScene;
}

@property (nonatomic, retain) CCScene* currScene;

-(void)update:(ccTime)dt;
-(CCScene*) getCurrentScene;

@end
