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
        CCMenuItemImage *menuItem1 = [CCMenuItemImage itemFromNormalImage:@"myFirstButton.png"
                                                            selectedImage: @"myFirstButton_selected.png"
                                                                   target:self
                                                                 selector:@selector(doSomething:)];
        [self addChild: menuItem1];
    }
    
    return self;
}

@end
