//
//  SKControllerEngine.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//

#import "SKControllerEngine.h"
#import "SKOverWorldScene.h"
#import "SKBattleScene.h"
#import "SKTitleScreenScene.h"
#import "SimpleAudioEngine.h"
@implementation SKControllerEngine

@synthesize thePlayer = _thePlayer;
@synthesize currMap = _currMap;
@synthesize currBattle = _currBattle;


SKControllerEngine* shared;

-(id)init
{
    if(shared)
    {
        return shared;
    }
    
    self = [super init];
    if(self)
    {
        // Make the engine globally accessible (if there's already one, don't make another
        
        [self scheduleUpdate];  // available since v0.99.3
        [self onEnter];
        // Get the director
        director = (CCDirectorMac*) [CCDirector sharedDirector];
        

        
        // Since the map is probably the most intensive 'scene', probably would be a good idea
        // to keep the overworld loaded until the game is quit
        
        // When the engine is first inititalized, there is no need to create the data management
        // since we have not necessarily started the game yet. We will leave this to when a new game
        // or a loaded game is started
        
        // Initializes some game data
        _thePlayer = [[SKPlayer alloc] init];
        _currMap = NULL;
        _currBattle = NULL;
        
        // Set this as the shared object
        shared = self;
        
        // For now, run startNewGame automatically in the beginning
        [self startNewGame];
    }
    
    return self;
}

-(void) onEnter
{
    [super onEnter];
}

-(void) update: (ccTime) dt
{
    [self.currScene update: dt];

}


-(void) changeToOverWorld
{
    [self.currScene autorelease];
    self.currScene = [[SKOverWorldScene alloc] init];
    [director runWithScene: self.currScene];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"dungeon.caf"];
}

-(void) changeToBattle
{
    self.currScene = [[SKBattleScene alloc] init];
    [director pushScene: [CCTransitionPageTurn transitionWithDuration:0.5f scene:self.currScene backwards:NO]];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"battle.caf"];
    
}

-(void) changeToTitle
{
    if(self.currScene)
    {
        [self.currScene autorelease];
    }
    
    self.currScene = [[SKTitleScreenScene alloc] init];
    [director runWithScene: self.currScene];
}

-(void) startNewGame
{
    // Starts a new game!
    //self.currScene = [[SKOverWorldScene alloc] init];
    //[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"dungeon.caf"];
    [self changeToTitle];
}

-(BOOL) loadGameState
{
    // Loads the game state, and populates the relevant models
    
    // Load that shit from the file, aw yeah, just like that
    // Make sure your remember to specify the file path, yo
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
    
    // Get current map state from OverWorldState
    
    // Cerealize!~~ ^__^
    // Make sure you specify the file path, yo.
    [gameSave writeToFile: @"File path, like a boss" atomically: YES];
    
    [gameSave release];
    
    
    // Return yes if everything went swimmingly.
    return YES;
}


+(SKControllerEngine*) getSharedEngine
{
    return shared;
}

@end
