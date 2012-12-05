//
//  SKModelObject.m
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//


#import "SKModelObject.h"

@implementation SKModelObject


-(id) initWithName: (NSString*) thename
{
    self = [super init];
    if (self){
        name = thename;
    }
    return self;
}

@end
