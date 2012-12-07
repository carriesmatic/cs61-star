//
//  SKModelLogic.h
//  CS61Star
//
//  Created by Jason Cramer on 11/26/12.
//
//
//  Manages the data and the operations performed on it within the Model.
//

#import <Foundation/Foundation.h>
#import "SKPlayer.h"
#import "SKMapModel.h"
#import "SKCharacter.h"
#import "SKBattle.h"

@interface SKModelLogic : NSObject
{
    SKPlayer* thePlayer; // The badass hacker hero of fate.
    SKMapModel* currMap; // The current location where our hero resides.
    SKBattle* currBattle; // The current battle, if applicable.
    
}

// Initializes the data manager with data from the saved state
-(id)initWithState: (NSDictionary*) gameState;

// Generates a battle
-(SKBattle*)generateBattle;

@end
