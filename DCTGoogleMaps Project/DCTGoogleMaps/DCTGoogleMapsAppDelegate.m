//
//  DCTGoogleMapsAppDelegate.m
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 20.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsAppDelegate.h"
#import <CoreData/CoreData.h>

#import "DCTGoogleMapsDirectionsConnectionController.h"
#import "DCTGoogleMapsGeocodingConnectionController.h"

#import "DCTGoogleMapsDirection.h"
#import "DCTGoogleMapsStep.h"
#import "DCTGoogleMapsLeg.h"
#import "DCTGoogleMapsRoute.h"
#import "DCTGoogleMapsPlace.h"
#import "NSManagedObjectContext+DCTGoogleMaps.h"

@implementation DCTGoogleMapsAppDelegate
@synthesize window, managedObjectContext;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	NSManagedObjectContext *moc = self.managedObjectContext;
	
	DCTGoogleMapsDirectionsConnectionController *cc = [DCTGoogleMapsDirectionsConnectionController connectionController];
	cc.managedObjectContext = moc;
	cc.startSearch = [moc dct_googleMapsSearchWithString:@"PO22 9HZ"];
	cc.endSearch = [moc dct_googleMapsSearchWithString:@"GU1 2AR"];
	
	[cc addCompletionBlock:^ (NSObject *object) {
		
		DCTGoogleMapsDirection *d = (DCTGoogleMapsDirection *)object;
		
		NSLog(@"%@", d);
		
		for (DCTGoogleMapsRoute *r in d.routes) {
			
			NSLog(@"%@", r);
			
			for (DCTGoogleMapsLeg *l in r.legs) {
				
				NSLog(@"%@", l);
				
				for (DCTGoogleMapsStep *s in l.steps) {
					NSLog(@"%@", s);
				}
			}
		}
	}];
	
	[cc addFailureBlock:^ (NSError *error) {
		
		
		
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:[error domain]
															message:[error localizedDescription]
														   delegate:nil
												  cancelButtonTitle:@"OK"
												  otherButtonTitles:nil];
		[alertView show];
		[alertView release];
	}];
	[cc connect];
	
	
	DCTGoogleMapsGeocodingConnectionController *cc2 = [DCTGoogleMapsGeocodingConnectionController connectionController];
	cc2.managedObjectContext = self.managedObjectContext;
	cc2.address = @"51 - 53 Great Marlborough Street, London, W1F 7JT";
	
	[cc addCompletionBlock:^ (NSObject *object) {
		NSLog(@"%@", object);
	}];
	
	[cc2 connect];
	
	// Override point for customization after application launch.
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

- (void)dealloc {
	[window release], window = nil;
	[managedObjectContext release], managedObjectContext = nil;
    [super dealloc];
}

- (NSManagedObjectContext *)managedObjectContext {
	
	if ((!managedObjectContext)) {
		
		NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
		NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
		
		[persistentStoreCoordinator addPersistentStoreWithType:NSInMemoryStoreType
												 configuration:nil
														   URL:nil
													   options:nil 
														 error:NULL];
		
		managedObjectContext = [[NSManagedObjectContext alloc] init];
		[managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
		[persistentStoreCoordinator release];
	}
	
	return [[managedObjectContext retain] autorelease];
}

@end
