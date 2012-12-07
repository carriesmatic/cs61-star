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
@synthesize max_atb = _max_atb;
@synthesize curr_atb = _curr_atb;
@synthesize atb_rate = _atb_rate;
@synthesize alive = _alive;
@synthesize atbReady = _atbReady;


-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.maxEff = 100;
        self.currEff = 0;
        self.max_atb = 1;
        self.curr_atb = 0;
        self.atb_rate = 0.5;
        self.alive = YES;
        self.atbReady = NO;
    }
    
    return self;
}

-(NSInteger) attack:(SKPlayer *)player
{
    // Calculate damage
    NSInteger damage = 10;
    
    // Damage player
    [player damage: 10];
    
    // Reset ATB
    self.atbReady = NO;
    self.curr_atb = 0;
    
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
    if(self.curr_atb >= self.max_atb)
    {
        self.atbReady = YES;
        self.curr_atb = self.max_atb;
    }
    else
    {
        self.curr_atb += self.atb_rate*dt;
    }
    
}


@end
