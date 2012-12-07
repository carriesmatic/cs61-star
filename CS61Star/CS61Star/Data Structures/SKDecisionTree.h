//
//  SKDecisionTree.h
//  CS61Star
//
//  Created by Jason Cramer on 12/5/12.
//
//

#import <Foundation/Foundation.h>
#import "SKDialogueTreeNode.h"

@interface SKDecisionTree : NSObject
{
    SKDialogueTreeNode* head;
    NSInteger size;
}

-(void)decide: (NSInteger) choice;

@end
