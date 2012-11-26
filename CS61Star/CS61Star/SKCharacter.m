//
//  SKCharacter.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//

#import "SKCharacter.h"

@implementation SKCharacter

// The exp required to reach a level (levels start at 0, duh)
NSInteger const expLevels[] = {0, 1000, 2000};

// The ultimate level in power. Also because we can only have a
// finite amount of exp requirements for levels
NSInteger const levelCap = 99;

-(id) initWithName: (NSString*) tehname
{
    self = [super initWithName: tehname];
    if(self)
    {
        // Initialize player attributes
        max_hdd = 100;
        curr_hdd = max_hdd;
        max_ram = 100;
        curr_ram = curr_ram;
        exp = 0;
        level = 0;
        
        proc_speed = 50;
        runtime_speed = 50;
    }
    
    return self;
}

-(id) initWithAttrs: (NSString*) tehname attrs: (NSDictionary*) attrs
{
    // Generally used for recreating a character from a game save
    self = [super initWithName: tehname];
    if(self)
    {
        // Initialize player attributes
        max_hdd = (NSInteger) [attrs valueForKey: @"max_hdd"];
        curr_hdd = (NSInteger) [attrs valueForKey: @"curr_hdd"];
        max_ram = (NSInteger) [attrs valueForKey: @"max_ram"];
        curr_ram = (NSInteger) [attrs valueForKey: @"curr_ram"];
        exp = (NSInteger) [attrs valueForKey: @"exp"];
        level = (NSInteger) [attrs valueForKey: @"level"];
        
        proc_speed = (NSInteger) [attrs valueForKey: @"proc_speed"];
        runtime_speed = (NSInteger) [attrs valueForKey: @"runtime_speed"];
    }
    return self;
}
-(BOOL) hasLeveledUp
{
    if(exp > expLevels[level + 1] && level < levelCap)
    {
        return YES;
    }

    return NO;

}

// Adds EXP, and returns true if player has leveled up!
-(BOOL) addEXP: (NSInteger) expBoost
{
    exp += expBoost;
    if([self hasLeveledUp])
    {
        level++;
        return YES;
    }
    
    return NO;
}

// equips the given item, and returns the currently equipped
//item to the inventory (if there is one)
-(void) equipItem: (SKEquipment*) toEquip
{
    // Check the type of the equipment and reequip the corresponding slot
    
}


@end
