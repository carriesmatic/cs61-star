//
//  SKBattleBGLayer.h
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "CCLayer.h"
#import "cocos2d.h"

@interface SKBattleBGLayer : CCLayer
{
    CCTMXTiledMap* _currentMap;
}
@property (retain, nonatomic) CCTMXTiledMap* currentMap;

@end
