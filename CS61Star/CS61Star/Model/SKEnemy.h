//
//  SKEnemy.h
//  CS61Star
//
//  Created by Jason Cramer on 12/4/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
@class SKPlayer;

@interface SKEnemy : NSObject
{
    NSInteger _maxEff; // maximum efficiency possible (health)
    NSInteger _currEff; // current efficieny (starts at 0)
    CGFloat _max_atb;
    CGFloat _curr_atb;
    CGFloat _atb_rate;
    BOOL _atbReady;
    BOOL _alive; // is enemy alive?
    
}

@property NSInteger maxEff;
@property NSInteger currEff;
@property CGFloat max_atb;
@property CGFloat curr_atb;
@property CGFloat atb_rate;
@property BOOL atbReady;
@property BOOL alive;

-(NSInteger)attack: (SKPlayer*) player;
-(void)damage: (NSInteger) dmg;
-(void)battleUpdate: (ccTime) dt;
@end
