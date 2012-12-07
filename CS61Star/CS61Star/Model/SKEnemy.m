//
//  SKEnemy.m
//  CS61Star
//
//  Created by Jason Cramer on 12/4/12.
//
//

#import "SKEnemy.h"

@implementation SKEnemy

@synthesize maxEff = _maxEff;
@synthesize currEff = _currEff;
@synthesize alive = _alive;

-(NSInteger) attack:(SKPlayer *)player
{
    // Calculate damage
    NSInteger damage = 10;
    
    // Damage player
    [player damage: 10];
    
    // Return damage to be displayed
    return damage;
}

-(void) damage:(NSInteger)dmg
{
    self.currEff += dmg;
    if(self.currEff > self.maxEff)
    {
        [self setAlive:NO];
    }
}

-(void)battleUpdate: (ccTime) dt
{
    
}


@end
