//
//  SKObject.h
//  CS61Star
//
//  Created by Jason Cramer on 11/17/12.
//
//  Essentially a way of providing an interface for all
//  model objects. The key thing, as of this point, is
//  for all model objects to be referable to by name.
//

#import <Foundation/Foundation.h>

@interface SKModelObject : NSObject
{
    NSString* name; // The identifying name of this model
}
@end
