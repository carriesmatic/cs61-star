//
//  SKControllerEngine.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//

#import "SKControllerEngine.h"

@implementation SKControllerEngine

-(id)init
{
    self = [super init];
    if(self)
    {
        // Setup stuff here
    }
    
    return self;
}

-(BOOL) loadGameState
{
    // Loads the game state, and populates the relevant models
    
    // Load that shit from the file, aw yeah, just like that
    NSDictionary* gameSave = [NSDictionary dictionaryWithContentsOfFile: @"File path, like a boss"];
    
    // Populate the model with funness
    
    // Return yes if everything went swimmingly.
    return YES;
}

-(BOOL) saveGameState
{
    // Saves game state in a serializable collection
    
    // Fill collection with fun things
    NSDictionary* gameSave = [[NSDictionary alloc] initWithObjectsAndKeys: nil];
    
    // Cerealize!~~ ^__^
    // Make sure you specify the file path, yo.
    [gameSave writeToFile: @"File path, like a boss" atomically: YES];
    
    [gameSave release];
    
    
    // Return yes if everything went swimmingly.
    return YES;
    
}

@end
