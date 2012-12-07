//
//  SKBattleHUDLayer.h
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "SKPlayer.h"
@interface SKBattleHUDLayer : CCLayer
{
    CCSprite* _statBar;
    CCSprite* _statBackground;
    CCSprite* _atbBar;
    
    CCLabelTTF* _attackLabel;
    CCLabelTTF* _playerDamage;
    CCLabelTTF* _enemyDamage;
    
    SKPlayer* player;
}

@property (nonatomic, retain) CCLabelTTF* attackLabel;
@property (nonatomic, retain) CCLabelTTF* playerDamage;
@property (nonatomic, retain) CCLabelTTF* enemyDamage;

-(void) update: (ccTime) dt;

@end
