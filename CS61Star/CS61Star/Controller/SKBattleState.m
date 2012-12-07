//
//  SKBattleState.m
//  CS61Star
//
//  Created by Jason Cramer on 11/18/12.
//
//

#import "SKBattleState.h"
#import "SKBattleScene.h"

@implementation SKBattleState
-(id)init
{
    
    self = [super init];
    if(self)
    {
        currScene = [[SKBattleScene alloc] init];
    }
    
    return self;
}

-(void)update
{
    
}
@end
