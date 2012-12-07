//
//  SKBattleActionLayer.h
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface SKBattleActionLayer : CCLayer
{
    CCSprite* _playerSprite;
    CCSprite* _enemySprite; 
}

-(BOOL) ccKeyDown:(NSEvent *)event;

@end
