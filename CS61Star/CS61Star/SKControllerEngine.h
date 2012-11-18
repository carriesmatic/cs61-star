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

@interface SKControllerEngine : NSObject
{
    CCScene* currScene;
    
}

-(BOOL) loadGameState
{
    // Loads the game state, and populates the relevant models
    
    // Load that shit from the file, aw yeah, just like that
    NSDictionary* gameSave = [NSDictionary dictionaryWithContentsOfFile: @"File path, like a boss"];
    
    // Populate the model with funness
    
    
}

-(BOOL) saveGameState
{
    // Saves game state in a serializable collection
    
    // Fill collection with fun things
    NSDictionary* gameSave = [[NSDictionary alloc] initWithObjects: nil];
    
    // Cerealize!~~ ^__^
    // Make sure you specify the file path, yo.
    [gameSave writeToFile: @"File path, like a boss", atomically: YES];
    
}

@end
