//
//  AppDelegate.m
//  CS61Star
//
//  Created by Carrie Chow on 11/5/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "AppDelegate.h"
#import "SKOverWorldScene.h"
#import "SKControllerEngine.h"

@implementation CS61StarAppDelegate
@synthesize window=window_, glView=glView_;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    // If you are using "NSTimer" Director you could set a very low interval
    [[CCDirector sharedDirector] setAnimationInterval:1/240.0];
    
	CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
	
	// connect the OpenGL view with the director
	[director setView:glView_];

	// EXPERIMENTAL stuff.
	// 'Effects' don't work correctly when autoscale is turned on.
	// Use kCCDirectorResize_NoScale if you don't want auto-scaling.
    [director setResizeMode:kCCDirectorResize_NoScale];
	
	// Enable "moving" mouse event. Default no.
	[window_ setAcceptsMouseMovedEvents:NO];
	// Center main window
	[window_ center];

    SKControllerEngine* controller = [[SKControllerEngine alloc] init];

	[director runWithScene:[[controller getCurrentState] getCurrentScene]];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *) theApplication
{
	return YES;
}

- (void)dealloc
{
	[[CCDirector sharedDirector] end];
	[window_ release];
	[super dealloc];
}

#pragma mark AppDelegate - IBActions

- (IBAction)toggleFullScreen: (id)sender
{
	CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
	[director setFullScreen: ! [director isFullScreen] ];
}

@end
