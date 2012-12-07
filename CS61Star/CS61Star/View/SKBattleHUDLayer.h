//
//  SKBattleHUDLayer.h
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface SKBattleHUDLayer : CCLayer
{
    CCSprite* _statBar;
    CCSprite* _statBackground;
    CCSprite* _atbBar;
    
    CCLabelAtlas* _attackLabel;
}

-(void) update: (ccTime) dt;

@end
