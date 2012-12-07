//
//  SKDialogueBoxLayer.m
//  CS61Star
//
//  Created by Jason Cramer on 12/4/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "SKDialogueBoxLayer.h"


@implementation SKDialogueBoxLayer

@synthesize selectables;
@synthesize currSelected;


-(id)init
{
    self = [super init];
    
    if(self)
    {
        // Initialize the array with an empty array
        selectables = [[NSMutableArray alloc] init];
        currSelected = 0;
        
        isLayer = NO;
        isView = NO;
        
        // Get window size
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        NSString *txt = @"This is a purposefully long text so as to test the wrapping functionality of the TextBoxLayer, as well as the multiple pages. That's it! This is the end, my only friend, the end.";
        
        textBox = [[TextBoxLayer alloc] initWithColor: [UIColor blueColor] width: 200 height:80 padding: 10 text: txt];
        textBox.position = ccp(size.width/2, size.height/2);
        textBox.delegate = self;
        
        textBoxView = [[TextBoxView alloc] initWithColor:[UIColor blueColor] width:200 height:80 padding:10 text:txt];
        textBoxView.center = ccp( size.width /2 , size.height/2 );
        textBoxView.delegate = self;
        
        CCMenuItemFont *itemLayer = [CCMenuItemFont itemFromString:@"Layer" target:self selector:@selector(onLayer:)];
        CCMenuItemFont *itemView = [CCMenuItemFont itemFromString:@"View" target:self selector:@selector(onView:)];
        
        CCMenu *menu = [CCMenu menuWithItems:itemLayer, itemView, nil];
        [menu alignItemsHorizontallyWithPadding:20];
        menu.position = ccp( size.width /2 , size.height/2 );
        [self addChild:menu];
        
        [self schedule: @selector(gameLoop::) interval: 1/60.0f];
    }
    
    return self;
}

-(id)initWithOptions: (NSMutableArray*) options
{
    self = [super init];
    
    if(self)
    {
        // Unimplemented
        
        // Retain the given list of strings
        selectables = [options retain];
        currSelected = 0;
    }
    
    return self;
}

- (void)gameLoop: (ccTime) dT {
    if (isLayer) {
        [textBox update:dT];
    }
    
    if (isView) {
        [textBoxView update:dT];
    }
}

- (void)onLayer:(id)sender {
    [self addChild:textBox];
    isLayer = YES;
    [menu removeFromParentAndCleanup:YES];
}

- (void)onView:(id)sender {
    [[CCDirector sharedDirector].openGLView addSubview:textBoxView];
    isView = YES;
    [menu removeFromParentAndCleanup:YES];
}

-(void) textBox:(id<TextBox>)tbox didFinishAllTextWithPageCount:(int)pc {
	if (isLayer) {
        [self removeChild:textBox cleanup:YES];
        isLayer = NO;
    }
    
    if (isView) {
        [textBoxView removeFromSuperview];
        isView = NO;
    }
}



-(void)selectNext
{
    // Selects the next option in the order of the selectables
}

-(void)selectPrev
{
    // Selects the previous option in the order of the selectables
}

-(void)selectOption: (NSInteger) num
{
    // Changes the presentation of the string to look highlighted
}

-(NSInteger) size
{
    // Returns the number of countables
    return [selectables count];
}

- (void) dealloc
{
    [textBox release];
    [textBoxView release];
    
    [super dealloc];
}

@end
