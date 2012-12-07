//
//  SKBattleBGLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "SKBattleBGLayer.h"

@implementation SKBattleBGLayer

@synthesize currentMap = _currentMap;

-(id) init
{
    self = [super init];
    
    if (self)
    {
        self.currentMap = [[CCTMXTiledMap alloc] initWithTMXFile:@"circuits.tmx"];
        [self.currentMap setScale:5];
        
        [self addChild:self.currentMap];
    }
    
    return self;
}

-(void) dealloc
{
    [self.currentMap autorelease];
    
    [super dealloc];
}

@end
