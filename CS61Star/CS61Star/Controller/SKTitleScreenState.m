//
//  SKTitleScreenState.m
//  CS61Star
//
//  Created by Jason Cramer on 11/18/12.
//
//

#import "SKTitleScreenState.h"
#import "SKTitleScreenScene.h"

@implementation SKTitleScreenState
-(id)init
{
    
    self = [super init];
    if(self)
    {
        currScene = [[SKTitleScreenScene alloc] init];
    }
    
    return self;
}

-(void)update
{
    
}
@end
