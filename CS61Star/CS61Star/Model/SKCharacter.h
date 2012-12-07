//
//  SKCharacter.h
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//  Any player or other human character in the
//  game.

#import <Foundation/Foundation.h>
#import "SKModelObject.h"
#import "SKEquipment.h"

@interface SKCharacter : SKModelObject
{
    // Primary attributes
    NSInteger max_hdd; // hdd, aka health (In MB)
    NSInteger max_ram; // ram, aka mana (In MB)
    NSInteger curr_hdd; // current hdd
    NSInteger curr_ram; // current ram
    NSInteger exp; // Player experience
    NSInteger level; // Player level
    CGFloat max_atb; // atb max
    CGFloat curr_atb; // current atb
    CGFloat atb_rate; // rate at which atb fills up
    
    // Secondary attributes
    NSInteger proc_speed; // Processor speed
    NSInteger runtime_speed; // Runtime speed
    
    // Inventory
    NSMutableArray* inv;
    
    // Equipped stuff
    NSMutableDictionary* equipped;
}

@property NSInteger max_hdd;
@property NSInteger max_ram;
@property NSInteger curr_hdd;
@property NSInteger curr_ram;
@property NSInteger exp;
@property NSInteger level;
@property CGFloat max_atb;
@property CGFloat curr_atb;
@property CGFloat atb_rate;


//@property NSInteger 

// Adds EXP, and returns true if player has leveled up!
-(BOOL) addEXP: (NSInteger) expBoost;

// equips the given item, and returns the currently equipped
//item to the inventory (if there is one)
-(void) equipItem: (SKEquipment*) toEquip;


@end
