//
//  SKOverWorldLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKOverWorldLayer.h"

@implementation SKOverWorldLayer

@synthesize currentMap;
@synthesize npcList;
@synthesize hudElements;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        currentMap = [[CCTMXTiledMap alloc] initWithTMXFile:@"testmap.tmx"];
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
        [self addChild:currentMap];
        
        // Get the data from the game engine
        SKControllerEngine* gameEngine = [SKControllerEngine getSharedEngine];
        
        // Get the player so I can request the sprite sheet and add it to the view
        thePlayer = [gameEngine thePlayer];
        CCSpriteBatchNode* spriteSheet = [thePlayer getSpriteSheet];

        [self addChild: spriteSheet];
        
        
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
                CCLOG(@"Left Arrow pressed");
                CGPoint movePosition = ccp(-32,0);
                [thePlayer move:movePosition withDirection:LEFT];

                return YES;
            }
            if ( keyChar == NSRightArrowFunctionKey ) {
                CCLOG(@"Right Arrow pressed");
                CGPoint movePosition = ccp(32,0);
                [thePlayer move:movePosition withDirection:RIGHT];

                return YES;
            }
            if ( keyChar == NSUpArrowFunctionKey ) {
                CCLOG(@"Up Arrow Pressed");
                CGPoint movePosition = ccp(0,32);
                [thePlayer move:movePosition withDirection:UP];
                return YES;
            }
            if ( keyChar == NSDownArrowFunctionKey ) {
                CCLOG(@"Down Arrow Pressed");

                CGPoint movePosition = ccp(0,-32);
                [thePlayer move:movePosition withDirection:DOWN];
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


@end
