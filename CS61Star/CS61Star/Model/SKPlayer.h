//
//  SKPlayer.h
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//

#import <Foundation/Foundation.h>
#import "SKCharacter.h"
#import "cocos2d.h"
#import "SKGlobalConstants.h"
#import "SKEnemy.h"

@interface SKPlayer :SKCharacter
{
    BOOL controllable;
    BOOL alive;
    CCSprite *_python;
    CCAction *_walkUpAction;
    CCAction *_walkDownAction;
    CCAction *_walkLeftAction;
    CCAction *_walkRightAction;
    CCAction *_battleAction;
    CCSpriteBatchNode *_spriteSheet;
}

@property BOOL controllable;
@property BOOL alive;

// Python sprite
@property (nonatomic, retain) CCSprite *python;
@property (nonatomic, retain) CCAction *walkUpAction;
@property (nonatomic, retain) CCAction *walkDownAction;
@property (nonatomic, retain) CCAction *walkLeftAction;
@property (nonatomic, retain) CCAction *walkRightAction;
@property (nonatomic, retain) CCAction *battleAction;
@property (nonatomic, retain) CCSpriteBatchNode *spriteSheet;

-(CCSpriteBatchNode*) getSpriteSheet;
-(void) changeDirection:(Direction)direction;
-(void) move:(CGPoint)directionOffset withDirection:(Direction)direction;
-(CGPoint) getMovePosition: (CGPoint)directionOffset;
-(NSInteger) attack: (SKEnemy*)enemy;
-(void) damage: (NSInteger) dmg;
-(void)battleUpdate: (ccTime) dt;

@end
