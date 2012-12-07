//
//  SKOverWorldLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKOverWorldLayer.h"
#include <stdlib.h>


@implementation SKOverWorldLayer

@synthesize currentMap;
@synthesize npcList;
@synthesize hudElements;
@synthesize background = _background;
@synthesize curtain = _curtain;
@synthesize over = _over;
@synthesize active = _active;
@synthesize under2 = _under2;
@synthesize under = _under;
@synthesize meta = _meta;
@synthesize thePlayer;


-(id)init
{
    self = [super init];
    
    if(self)
    {
        currentMap = [[CCTMXTiledMap alloc] initWithTMXFile:@"functtestmap.tmx"];
        [self initWithMap:currentMap];
    }
    
    return self;
}


-(id)initWithMap: (CCTMXTiledMap*) map
{
    self = [super init];
    if(self)
    {
        
        
        // Enable keyboard
        self.isKeyboardEnabled = YES;

        // The current map
        currentMap = [map retain];
        
        // Set up the layers so we can easily access them
        self.background = [currentMap layerNamed:@"Ground"];
        self.active = [currentMap layerNamed:@"Active"];
        self.under = [currentMap layerNamed:@"Under"];
        self.under2 = [currentMap layerNamed:@"Under2"];
        self.curtain = [currentMap layerNamed:@"Curtain"];
        self.over = [currentMap layerNamed:@"Over"];
        self.meta = [currentMap layerNamed:@"Meta"];
        
        
        CCTMXObjectGroup* objects = [currentMap objectGroupNamed:@"Objects"];
        NSMutableDictionary* spawnPoint = [objects objectNamed:@"SpawnPoint"];
        int x = [[spawnPoint valueForKey:@"x"] intValue];
        int y = [[spawnPoint valueForKey:@"y"] intValue];
        
        // Add the map layers as children
        [self addChild:currentMap];
        [currentMap reorderChild:self.background z:0];
        [currentMap reorderChild:self.under z:1];
        [currentMap reorderChild:self.under2 z:2];
        [currentMap reorderChild:self.active z:3];
        [currentMap reorderChild:self.over z:4];
        [currentMap reorderChild:self.curtain z:5];
        [currentMap reorderChild:self.meta z:6];
        
        // Get the data from the game engine
        SKControllerEngine* gameEngine = [SKControllerEngine getSharedEngine];
        
        // Get the player so I can request the sprite sheet and add it to the view
        thePlayer = [gameEngine thePlayer];
        CCSpriteBatchNode* spriteSheet = [thePlayer getSpriteSheet];
        
        // Set the player coordinates to the spawn point
        
        [thePlayer.python setPosition: ccp(x + 16, y + 22)];
        

        [currentMap addChild: spriteSheet z:3];
        [self setViewpointCenter:thePlayer.python.position];
        
        
    }
    return self;
}


-(BOOL) ccKeyDown:(NSEvent *)event
{
    //NSLog(@"key down: %@", [event characters] );
    if ([event modifierFlags] & NSNumericPadKeyMask) { // arrow keys have this mask
        NSString *theArrow = [event charactersIgnoringModifiers];
        unichar keyChar = 0;
        if ( [theArrow length] == 0 )
            return YES;            // reject dead keys
        if ( [theArrow length] == 1 ) {
            keyChar = [theArrow characterAtIndex:0];
            
            if ( keyChar == NSLeftArrowFunctionKey ) {
                CGPoint movePosition = ccp(-32,0);
                [thePlayer move:movePosition withDirection:LEFT];
                [self setViewpointCenter:thePlayer.python.position];
                
                // Start the battle scene if we hit a monster
                if (arc4random() % 251 < 5)
                {
                    [[SKControllerEngine getSharedEngine] changeToBattle];
                }
                
                return YES;
            }
            if ( keyChar == NSRightArrowFunctionKey ) {
                CGPoint movePosition = ccp(32,0);
                [thePlayer move:movePosition withDirection:RIGHT];
                [self setViewpointCenter:thePlayer.python.position];
                
                // Start the battle scene if we hit a monster
                if (arc4random() % 251 < 5)
                {
                    [[SKControllerEngine getSharedEngine] changeToBattle];
                }
                
                return YES;
            }
            if ( keyChar == NSUpArrowFunctionKey ) {
                CGPoint movePosition = ccp(0,32);
                [thePlayer move:movePosition withDirection:UP];
                [self setViewpointCenter:thePlayer.python.position];
                
                // Start the battle scene if we hit a monster
                if (arc4random() % 251 < 5)
                {
                    [[SKControllerEngine getSharedEngine] changeToBattle];
                }
                
                return YES;
            }
            if ( keyChar == NSDownArrowFunctionKey ) {
                CGPoint movePosition = ccp(0,-32);
                [thePlayer move:movePosition withDirection:DOWN];
                [self setViewpointCenter:thePlayer.python.position];
                
                // Start the battle scene if we hit a monster
                if (arc4random() % 215 < 2)
                {
                    [[SKControllerEngine getSharedEngine] changeToBattle];
                }
                
                return YES;
            }
        }

        
    }
    return NO;
}


-(id)changeMap:(CCTMXTiledMap *)newMap
{
    [self removeChild:currentMap cleanup:YES];
    CCTMXTiledMap* oldMap = [currentMap autorelease];
    currentMap = [newMap retain];
    [self addChild:currentMap];
    return oldMap;
}

-(void)dealloc
{
    [super dealloc];
}

-(CGPoint)tileCoordForPosition:(CGPoint)position
{
    int x = position.x / currentMap.tileSize.width;
    int y = ((currentMap.mapSize.height * currentMap.tileSize.height) - position.y) / currentMap.tileSize.height;
    return ccp(x,y);
}

-(void)setViewpointCenter:(CGPoint) position
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    int x = MAX(position.x, winSize.width / 2);
    int y = MAX(position.y, winSize.height / 2);
    x = MIN(x, (currentMap.mapSize.width * currentMap.tileSize.width) - winSize.width / 2);
    y = MIN(y, (currentMap.mapSize.height * currentMap.tileSize.height) - winSize.height / 2);
    CGPoint actualPosition = ccp(x, y);
    
    CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    self.position = viewPoint;
    
}


@end
