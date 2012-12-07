//
//  SKDialogueBoxLayer.h
//  CS61Star
//
//  Created by Jason Cramer on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TextBox.h"
#import "TextBoxLayer.h"
#import "TextBoxView.h"

@interface SKDialogueBoxLayer : CCLayer {
    NSMutableArray* speaker; // The current speaker of the dialogue, if applicable.
    NSString* dialogue;
    
    NSMutableArray* selectables; // An array of the enumerated selectable text options
    NSInteger currSelected; // The index of the currently selected option
    
    BOOL isLayer;
    BOOL isView;
    
    TextBoxLayer *textBox;
    TextBoxView *textBoxView;
}

@property (nonatomic, retain) NSMutableArray* selectables;
@property NSInteger currSelected;


-(void)selectNext;
-(void)selectPrev;
-(void)selectOption: (NSInteger) num;
- (void)gameLoop: (ccTime) dT;
- (void)onLayer:(id)sender;
- (void)onView:(id)sender;
-(void) textBox:(id<TextBox>)tbox didFinishAllTextWithPageCount:(int)pc;

@end
