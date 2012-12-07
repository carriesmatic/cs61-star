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

-(void) damage:(NSInteger)dmg
{
    self.currEff += dmg;
    if(self.currEff > self.maxEff)
    {
        [self setAlive:NO];
    }
}

@end
