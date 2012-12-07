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
        currScene = [[SKOverWorldScene alloc] init];
    }
    
    return self;
}

-(void)update
{
    
}

@end
