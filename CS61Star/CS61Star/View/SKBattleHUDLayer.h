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
    BOOL _displayPlayerDamage;
    CCLabelTTF* _enemyDamage;
    BOOL _displayEnemyDamage;
    
    SKPlayer* player;
    
    NSInteger _playerDamageDisplayLeft;
}

@property (nonatomic, retain) CCLabelTTF* attackLabel;
@property (nonatomic, retain) CCLabelTTF* itemsLabel;
@property (nonatomic, retain) CCLabelTTF* runLabel;
@property (nonatomic, retain) CCLabelTTF* menuLabel;
@property (nonatomic, retain) CCLabelTTF* playerDamage;
@property (nonatomic, retain) CCLabelTTF* enemyDamage;
@property BOOL displayPlayerDamage;
@property BOOL displayEnemyDamage;
@property NSInteger playerDamageDisplayLeft;

-(void) update: (ccTime) dt;

@end
