//
//  SKModelObject.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//


#import "SKModelObject.h"

@implementation SKModelObject

-(id)initWithName: NSString* name
{
    self = [super init];
    if (self){
        self.name = name;
    }
    return self;
}

@end
