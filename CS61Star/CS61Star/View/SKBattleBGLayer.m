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
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        CCLayerColor* fadeLayer = [CCLayerColor layerWithColor: ccc4(183, 195, 182, 255) width: winSize.width height: winSize.height/2];
        CCLayerColor* borderLayer = [CCLayerColor layerWithColor: ccc4(0, 0, 0, 255) width: winSize.width height: winSize.height/2 + 10];
        
        [self addChild: borderLayer];
        [self addChild: fadeLayer];
    }
    
    return self;
}

-(void) dealloc
{
    [self.currentMap autorelease];
    
    [super dealloc];
}

@end
