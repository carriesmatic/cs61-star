//
//  SKOverWorldState.m
//  CS61Star
//
//  Created by Jason Cramer on 11/18/12.
//
//

#import "SKOverWorldState.h"
#import "SKOverWorldScene.h"
@implementation SKOverWorldState

-(id)init
{
    
    self = [super init];
    if(self)
    {
        CCTMXTiledMap* map = [[CCTMXTiledMap alloc] initWithTMXFile:@"testmap.tmx"];
        currScene = [[SKOverWorldScene alloc] initWithMap: map];
    }
    
    return self;
}

-(void)update
{
    
}

@end
