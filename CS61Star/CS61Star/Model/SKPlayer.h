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
    
    CCSprite *_python;
    CCAction *_walkUpAction;
    CCAction *_walkDownAction;
    CCAction *_walkLeftAction;
    CCAction *_walkRightAction;
    CCAction *_battleAction;
    CCSpriteBatchNode *_spriteSheet;

}

@property BOOL controllable;

// Python sprite
@property (nonatomic, retain) CCSprite *python;
@property (nonatomic, retain) CCAction *walkUpAction;
@property (nonatomic, retain) CCAction *walkDownAction;
@property (nonatomic, retain) CCAction *walkLeftAction;
@property (nonatomic, retain) CCAction *walkRightAction;
@property (nonatomic, retain) CCAction *battleAction;
@property (nonatomic, retain) CCSpriteBatchNode *spriteSheet;

-(void) changeDirection:(Direction)direction;
-(CCSpriteBatchNode*) getSpriteSheet;
-(void) move:(CGPoint)directionOffset withDirection:(Direction)direction;
-(CGPoint) getMovePosition: (CGPoint)directionOffset;
-(NSInteger) attack: (SKEnemy*)enemy;

@end
