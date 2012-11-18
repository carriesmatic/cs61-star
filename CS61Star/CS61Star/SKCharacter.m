//
//  SKCharacter.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//

#import "SKCharacter.h"

@implementation SKCharacter

-(id) initWithName: (NSString*) name
{
    self = [super initWithName: name];
    if(self)
    {
        // Initialize player attributes
        max_hdd = 100;
        curr_hdd = max_hdd;
        max_ram = 100;
        curr_ram = curr_ram;
        exp = 0;
        
        proc_speed = 50;
        runtime_speed = 50;
    }
    
    return self;
}

-(id) initWithAttrs: (NSString*) name attrs: (NSDictionary*) attrs
{
    // Generally used for recreating a character from a game save
    self = [super initWithName: name];
    if(self)
    {
        // Initialize player attributes
        max_hdd = [attrs valueForKey: @"max_hdd"];
        curr_hdd = [attrs valueForKey: @"curr_hdd"];
        max_ram = [attrs valueForKey: @"max_ram"];
        curr_ram = [attrs valueForKey: @"curr_ram"];
        exp = [attrs valueForKey: @"exp"];
        
        proc_speed = [attrs valueForKey: @"proc_speed"];
        runtime_speed = [attrs valueForKey: @"runtime_speed"];
    }
}

@end
