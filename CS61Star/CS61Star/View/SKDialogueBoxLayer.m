//
//  SKDialogueBoxLayer.m
//  CS61Star
//
//  Created by Jason Cramer on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKDialogueBoxLayer.h"


@implementation SKDialogueBoxLayer

@synthesize selectables;
@synthesize currSelected;


-(id)init
{
    self = [super init];
    
    if(self)
    {
        // Initialize the array with an empty array
        selectables = [[NSMutableArray alloc] init];
        currSelected = 0;
        
    }
}

-(id)initWithOptions: (NSMutableArray*) options
{
    self = [super init];
    
    if(self)
    {
        // Retain the given list of strings
        selectables = [options retain];
        currSelected = 0;
    }
    
    return self;
}

-()

-(void)selectNext
{
    // Selects the next option in the order of the selectables
}

-(void)selectPrev
{
    // Selects the previous option in the order of the selectables
}

-(void)selectOption: (NSInteger) num
{
    // Changes the presentation of the string to look highlighted
}

-(NSInteger) size
{
    // Returns the number of countables
    return [selectables count];
}

@end
