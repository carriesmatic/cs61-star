//
//  SKDialogueBoxLayer.h
//  CS61Star
//
//  Created by Jason Cramer on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SKDialogueBoxLayer : CCLayer {
    NSMutableArray* speaker; // The current speaker of the dialogue, if applicable.
    NSString* dialogue;
    
    NSMutableArray* selectables; // An array of the enumerated selectable text options
    NSInteger currSelected; // The index of the currently selected option
}

@property (nonatomic, retain) NSMutableArray* selectables;
@property NSInteger currSelected;


-(void)selectNext;
-(void)selectPrev;

@end
