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

@interface SKCharacter : SKModelObject
{
    // Primary attributes
    NSInteger max_hdd; // hdd, aka health (In MB)
    NSInteger max_ram; // ram, aka mana (In MB)
    NSInteger curr_hdd; // current hdd
    NSInteger curr_ram; // current ram
    NSInteger exp; // Player experience
    
    // Secondary attributes
    NSInteger proc_speed; // Processor speed
    NSInteger runtime_speed; // Runtime speed
    
}




@end
