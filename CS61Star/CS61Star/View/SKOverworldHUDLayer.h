//
//  SKOverworldHUDLayer.h
//  CS61Star
//
//  Created by Jason Cramer on 11/26/12.
//
//

#import "CCLayer.h"
#import "CCMenuItem.h"
#import "CCSpriteBatchNode.h"
@interface SKOverworldHUDLayer : CCLayer
{
    // Status HUD items
    CCSprite* _statHUD;
    CCSprite* _statHUDshadow;
    CCSprite* _hddbar;
    CCSprite* _rambar;
    CCSprite* _expbar;
    
    // Shebang action notification
    CCSprite* _shebang;
    CCSpriteBatchNode* _shebangSheet;
}


@end
