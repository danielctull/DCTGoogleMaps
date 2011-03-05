//
//  DCTGoogleMapsPlace+Implementation.h
//  DCTGoogleMaps
//
//  Created by Daniel Tull on 21.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

#import "DCTGoogleMapsPlace.h"
#import "NSManagedObject+DCTAutomatedSetup.h"
#import "DCTGoogleMapsDirection+Implementation.h"

typedef void (^DCTGoogleMapsGeocodeBlock) ();

@interface DCTGoogleMapsPlace (Implementation) <DCTManagedObjectAutomatedSetup>

@property (nonatomic, readonly) NSString *address;

- (void)geocode:(DCTGoogleMapsGeocodeBlock)block;

- (void)directionToPlace:(DCTGoogleMapsPlace *)place
		  directionBlock:(DCTGoogleMapsDirectionBlock)block;

- (void)directionFromPlace:(DCTGoogleMapsPlace *)place
			directionBlock:(DCTGoogleMapsDirectionBlock)block;

@end
