//
//  SKOverworldHUDLayer.m
//  CS61Star
//
//  Created by Jason Cramer on 11/26/12.
//
//

#import "SKOverworldHUDLayer.h"
#import "cocos2d.h"

@implementation SKOverworldHUDLayer

-(id)init
{
    self = [super init];
    
    if(self)
    {
        CCMenu * myMenu = [CCMenu menuWithItems:nil];
        CCMenuItemImage *menuItem1 = [CCMenuItemImage itemFromNormalImage:@"testbutton.png"
                                                            selectedImage: @"testbutton.png"
                                                                   target:self
                                                                 selector:@selector(doSomething:)];
        [myMenu addChild: menuItem1];
        [myMenu alignItemsVertically];
        [myMenu alignItemsHorizontally];
        [self addChild:myMenu];
    }
    
    return self;
}

-(id)doSomething: (CCMenuItem*) menuitem
{
    return nil;
}

@end
