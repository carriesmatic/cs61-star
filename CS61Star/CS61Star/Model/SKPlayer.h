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

@interface SKPlayer :SKCharacter
{
    BOOL controllable;
    
    CCSprite *_python;
    CCAction *_walkUpAction;
    CCAction *_walkDownAction;
    CCAction *_walkLeftAction;
    CCAction *_walkRightAction;
    CCSpriteBatchNode *_spriteSheet;

}

@property BOOL controllable;

// Python sprite
@property (nonatomic, retain) CCSprite *python;
@property (nonatomic, retain) CCAction *walkUpAction;
@property (nonatomic, retain) CCAction *walkDownAction;
@property (nonatomic, retain) CCAction *walkLeftAction;
@property (nonatomic, retain) CCAction *walkRightAction;
@property (nonatomic, retain) CCSpriteBatchNode *spriteSheet;

-(CCSpriteBatchNode*) getSpriteSheet;
-(void) changeDirection:(Direction)direction;
-(void) move:(CGPoint)directionOffset withDirection:(Direction)direction;



@end
