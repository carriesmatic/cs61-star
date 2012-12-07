//
//  SKBattleHUDLayer.m
//  CS61Star
//
//  Created by Carrie Chow on 12/7/12.
//
//

#import "SKBattleHUDLayer.h"
#import "SKControllerEngine.h"

@implementation SKBattleHUDLayer

@synthesize attackLabel = _attackLabel;
@synthesize itemsLabel = _itemsLabel;
@synthesize runLabel = _runLabel;
@synthesize menuLabel = _menuLabel;
@synthesize playerDamage = _playerDamage;
@synthesize enemyDamage = _enemyDamage;
@synthesize displayPlayerDamage = _displayPlayerDamage;
@synthesize displayEnemyDamage = _displayEnemyDamage;
@synthesize playerDamageDisplayLeft = _playerDamageDisplayLeft;
-(id) init
{
    self = [super init];
    
    if (self)
    {
        
        player = [[SKControllerEngine getSharedEngine] thePlayer];
        
        _statBackground = [CCSprite spriteWithFile:@"hudbackground.png"];
        
        // Stop antialiasing
        [[_statBackground texture] setAliasTexParameters];
        
        [_statBackground setAnchorPoint:ccp(0, 0)];
        [_statBackground setScale: 7];
        [_statBackground setScaleX: [_statBackground scale] * .86];
        [_statBackground setPosition:ccp(0, 0)];
        
        [self addChild:_statBackground];
        
        
        
        _atbBar = [CCSprite spriteWithFile: @"atbbar.png"];
        
        // Stop antialiasing
        [[_atbBar texture] setAliasTexParameters];
        
        [_atbBar setAnchorPoint:ccp(0, 0)];
        [_atbBar setScale: 7];
        [_atbBar setScaleX: 0];
        [_atbBar setPosition:ccp(215, 175)];
        
        [self addChild:_atbBar];
        
        _statBar = [CCSprite spriteWithFile:@"hudoverlay.png"];
        
        // Stop antialiasing
        [[_statBar texture] setAliasTexParameters];
        
        [_statBar setAnchorPoint:ccp(0, 0)];
        [_statBar setScale: 7];
        [_statBar setScaleX: [_statBar scale] * .86];
        [_statBar setPosition:ccp(0, 0)];
        
        [self addChild:_statBar];
        
        self.attackLabel = [CCLabelTTF labelWithString:@"ATTACK" fontName:@"8BITWONDERNominal" fontSize:24];
        [self.attackLabel setPosition:ccp(110,165)];
        [self.attackLabel setColor:ccBLACK];
        [self addChild:self.attackLabel];
        
        self.itemsLabel = [CCLabelTTF labelWithString:@"ITEMS" fontName:@"8BITWONDERNominal" fontSize:24];
        [self.itemsLabel setPosition:ccp(110,120)];
        [self.itemsLabel setColor:ccBLACK];
        [self addChild:self.itemsLabel];
        
        self.runLabel = [CCLabelTTF labelWithString:@"RUN" fontName:@"8BITWONDERNominal" fontSize:24];
        [self.runLabel setPosition:ccp(110,80)];
        [self.runLabel setColor:ccBLACK];
        [self addChild:self.runLabel];
        
        self.menuLabel = [CCLabelTTF labelWithString:@"MENU" fontName:@"8BITWONDERNominal" fontSize:24];
        [self.menuLabel setPosition:ccp(110,35)];
        [self.menuLabel setColor:ccBLACK];
        [self addChild:self.menuLabel];
        
        self.playerDamage = [CCLabelTTF labelWithString:@"" fontName:@"8BITWONDERNominal" fontSize:24];
        [self.playerDamage setVisible:NO];
        [self.playerDamage setPosition:ccp(775, 600)];
        
        [self addChild:self.playerDamage];
    }
    
    return self;
}

-(void) update: (ccTime) dt
{
    [_atbBar setScaleX: 7 * [player curr_atb]];
    
    // Player damage
    [self.playerDamage setVisible: self.displayPlayerDamage];
    if (self.displayPlayerDamage && self.playerDamageDisplayLeft < 0) {
        self.displayPlayerDamage = NO;
    }
    else if(self.displayPlayerDamage){
        self.playerDamageDisplayLeft--;
    }
}
@end
