//
//  SKGameState.m
//  CS61Star
//
//  Created by Jason Cramer on 11/18/12.
//
//  

#import "SKGameState.h"


@implementation SKGameState

@synthesize currScene;

-(void)update:(ccTime)dt
{
    
}

-(CCScene*)getCurrentScene
{
    return [self currScene];
}
@end
