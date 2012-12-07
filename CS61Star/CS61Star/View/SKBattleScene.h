//
//  SKBattleScene.h
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SKBattleBGLayer.h"
#import "SKBattleActionLayer.h"
#import "SKBattleHUDLayer.h"
#import "SKEnemy.h"

@interface SKBattleScene : CCScene {
    SKBattleBGLayer* _bgLayer;
    SKBattleActionLayer* _actionLayer;
    SKBattleHUDLayer* _hudLayer;
    SKPlayer* _player;
    SKEnemy* _enemy;
}

@property (retain, nonatomic) SKBattleBGLayer* bgLayer;
@property (retain, nonatomic) SKBattleActionLayer* actionLayer;
@property (retain, nonatomic) SKBattleHUDLayer* hudLayer;
@property (retain, nonatomic) SKPlayer* player;
@property (retain, nonatomic) SKEnemy* enemy;

-(void) update: (ccTime) dt;

@end
