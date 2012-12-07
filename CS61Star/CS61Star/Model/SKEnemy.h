//
//  SKEnemy.h
//  CS61Star
//
//  Created by Jason Cramer on 12/4/12.
//
//

#import <Foundation/Foundation.h>

@interface SKEnemy : NSObject
{
    NSInteger _maxEff; // maximum efficiency possible (health)
    NSInteger _currEff; // current efficieny (starts at 0)
    BOOL _alive; // is enemy alive?
}

@property NSInteger maxEff;
@property NSInteger currEff;
@property BOOL alive;

-(void)damage: (NSInteger) dmg;

@end
